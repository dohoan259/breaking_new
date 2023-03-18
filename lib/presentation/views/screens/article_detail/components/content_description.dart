import 'package:flutter/cupertino.dart';

class ContentDescription extends StatelessWidget {
  const ContentDescription(
      {Key? key, required this.description, required this.content})
      : super(key: key);

  final String? description;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '$description\n\n$content',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
