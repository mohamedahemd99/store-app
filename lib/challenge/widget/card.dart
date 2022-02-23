import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal,
      elevation: 5,
      child: Padding(padding: EdgeInsets.all(30), child: child),
    );
  }
}
