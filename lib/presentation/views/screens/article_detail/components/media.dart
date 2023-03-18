import 'package:flutter/cupertino.dart';

class Media extends StatelessWidget {
  const Media({Key? key, this.urlToImage}) : super(key: key);

  final String? urlToImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        urlToImage ?? '',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
