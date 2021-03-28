part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({@required this.weather});
}

class WeatherErrorState extends WeatherState {}
