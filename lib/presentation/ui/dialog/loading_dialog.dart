import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingDialog {
  static final LoadingDialog _singleton = LoadingDialog._internal();

  factory LoadingDialog() {
    return _singleton;
  }

  LoadingDialog._internal();

  late BuildContext _context;

  show(BuildContext context) {
    _context = context;
    AlertDialog alert = AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void hide() {
    _context.pop();
  }
}
