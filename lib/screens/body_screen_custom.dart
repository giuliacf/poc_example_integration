import 'package:flutter/material.dart';

class BodyScreenCustom extends StatelessWidget {
  final Widget body;

  BodyScreenCustom({required this.body});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: body
        ),
      ),
    );
  }
}
