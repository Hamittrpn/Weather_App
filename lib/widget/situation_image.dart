import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/bloc/weather_bloc.dart';

class SituationImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Text(
                  (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather[0]
                          .theTemp
                          .floor()
                          .toString() +
                      " ℃",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.network(
                    "https://www.metaweather.com/static/img/weather/png/" +
                        (state as WeatherLoadedState)
                            .weather
                            .consolidatedWeather[0]
                            .weatherStateAbbr +
                        ".png",
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
