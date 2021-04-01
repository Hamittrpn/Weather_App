import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String selectedCity;

  LocationWidget({@required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        selectedCity,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
