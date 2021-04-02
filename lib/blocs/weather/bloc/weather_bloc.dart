import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState());
  final WeatherRepository weatherRepository = locator<WeatherRepository>();
  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather incomingWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: incomingWeather);
      } catch (e) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather incomingWeather =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: incomingWeather);
      } catch (e) {
        yield state;
      }
    }
  }
}
