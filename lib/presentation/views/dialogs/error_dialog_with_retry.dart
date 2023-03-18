import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorDialogWithRetry {
  BuildContext? _context;

  show(BuildContext context, String title, String msg, String tag,
      dynamic params, Function() onRetry) {
    _context = context;
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _context?.popRoute();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _context?.popRoute();
            onRetry();
          },
          child: const Text('Retry'),
        ),
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: const Color(0xADFFFFFF),
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
