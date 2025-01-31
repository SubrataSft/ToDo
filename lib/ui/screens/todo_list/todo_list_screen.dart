import 'package:flutter/material.dart';
import 'package:todo_list/ui/screens/add_new_todo_screen.dart';
import 'package:todo_list/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_list/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo_list/ui/screens/todo_list/undone_todo_list_tab.dart';
import 'package:todo_list/ui/widgets/todo_item.dart';

import '../../../entities/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  List<Todo> _todoList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController =TabController(length: 3, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo list"),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: [
            AllTodoListTab(
            onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList,
            ),
            UndoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item)=>item.isDone==false).toList(),
            ),
            DoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item)=>item.isDone==true).toList(),
            ),
          ],
        ),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: "Add new todo",
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(
                      onAddTodo: _addNewTodo,
                    )));
      },
      label: const Text("Add"),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
        // controller: _tabController,
        tabs: [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Undone',
          ),
          Tab(
            text: 'Done',
          ),
        ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
