import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Max : " + 24.toString() + " ℃",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Min : " + 12.toString() + " ℃",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
