import 'package:flutter/material.dart';
import 'package:weather_app/widget/choose_city.dart';
import 'package:weather_app/widget/last_update.dart';
import 'package:weather_app/widget/situation_image.dart';
import 'package:weather_app/widget/temperature.dart';
import 'location.dart';

class WeatherApp extends StatelessWidget {
  String selectedCity = "İzmir";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              selectedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChooseCityWidget(),
                  ));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LocationWidget(
              selectedCity: selectedCity,
            ),
            LastUpdateWidget(),
            SituationImageWidget(),
            TemperatureWidget(),
          ],
        ),
      ),
    );
  }
}
