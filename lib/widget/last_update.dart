import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text('Last Update ' + TimeOfDay(hour: 20, minute: 09).format(context),
      style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}
