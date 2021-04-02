import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ApplicationTheme(theme: ThemeData.light(), color: Colors.blue));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    ApplicationTheme applicationTheme;
    if (event is ChangeThemeEvent) {
      switch (event.weatherStateAbbr) {
        case "sn": // Kar
        case "sl": // Sulu Kar
        case "h": // Dolu
        case "t": // Fırtına
        case "hc": // Çok Bulutlu
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.blueGrey),
              color: Colors.grey);
          break;
        case "hr": // Ağır Yağmurlu
        case "lr": // Hafif Yağmurlu
        case "s": // Sağanak Yağışlı
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
              color: Colors.purple);
          break;
        case "lc": // Az Bulutlu
        case "c": // Açık Güneşli Hava
          applicationTheme = ApplicationTheme(
              theme: ThemeData(primaryColor: Colors.orangeAccent),
              color: Colors.yellow);
          break;
      }
      yield applicationTheme;
    }
  }
}
