import 'package:flutter/material.dart';

import '../../entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});

  final Function(Todo) onAddTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  hintText: "Title",
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty?? true){
                    return "Enter your title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(

                controller: _descriptionTEController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Description",
                ),
                maxLength: 288,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty?? true){
                    return "Enter your description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8,),
              ElevatedButton(onPressed: (){
                if (_formkey.currentState!.validate()) {
                  Todo todo = Todo(_titleTEController.text.trim(),
                      _descriptionTEController.text.trim(), DateTime.now());
                  widget.onAddTodo(todo);
                  Navigator.pop(context);
                }
              },
                  child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
   _titleTEController.dispose();
   _descriptionTEController.dispose();
    super.dispose();
  }
}
