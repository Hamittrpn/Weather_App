import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/bloc/weather_bloc.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/widget/weather_app.dart';
import 'blocs/theme/bloc/theme_bloc.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) {
        return MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          theme: (state as ApplicationTheme).theme,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
