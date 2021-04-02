part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final String weatherStateAbbr;
  ChangeThemeEvent({@required this.weatherStateAbbr});
}
