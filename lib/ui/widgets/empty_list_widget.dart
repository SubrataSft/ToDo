import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          Lottie.asset("assets/lotties/empty_list.json",
              width: 200, height: 250, fit: BoxFit.scaleDown),
          const Text("Todo list empty",style: TextStyle(
            fontSize: 23,
            color: Colors.grey
          ),)
        ],
      ),
    );
  }
}
