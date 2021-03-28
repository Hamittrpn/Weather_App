import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/bloc/weather_bloc.dart';
import 'package:weather_app/widget/choose_city.dart';
import 'package:weather_app/widget/last_update.dart';
import 'package:weather_app/widget/situation_image.dart';
import 'package:weather_app/widget/temperature.dart';
import 'location.dart';

class WeatherApp extends StatelessWidget {
  String selectedCity;
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

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
              if (selectedCity != null) {
                _weatherBloc.add(FetchWeatherEvent(cityName: selectedCity));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitialState) {
              return Center(
                child: Text("Select a city"),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              final incomingWeather = state.weather;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LocationWidget(
                    selectedCity: selectedCity,
                  ),
                  LastUpdateWidget(),
                  SituationImageWidget(),
                  TemperatureWidget(),
                ],
              );
            }
            if (state is WeatherErrorState) {
              return Center(
                child: Text("Error Occured!"),
              );
            }
          },
        ),
      ),
    );
  }
}
