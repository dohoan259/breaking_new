import 'package:flutter/material.dart';

class UninitializedWidget extends StatelessWidget {
  const UninitializedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
