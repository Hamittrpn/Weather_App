import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/bloc/weather_bloc.dart';

class TemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: _weatherBloc,
        builder: (context, WeatherState state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Max : " +
                      (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather[0]
                          .maxTemp
                          .floor()
                          .toString() +
                      " ℃",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Min : " +
                      (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather[0]
                          .minTemp
                          .floor()
                          .toString() +
                      " ℃",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        });
  }
}
