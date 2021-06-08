import 'package:flutter/material.dart';

class BodyScreenCustom extends StatelessWidget {
  final Widget body;

  BodyScreenCustom({required this.body});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Container(
            padding: EdgeInsets.fromLTRB(
                width > 1200 ? 0 : 32, 40, width > 1200 ? 0 : 32, 16),
            child: body),
      ),
    );
  }
}
