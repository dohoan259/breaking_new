import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoadingDialog {
  BuildContext? _context;

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
    _context?.popRoute();
  }
}
