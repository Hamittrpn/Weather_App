part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ApplicationTheme extends ThemeState {
  final ThemeData theme;
  final MaterialColor color;

  ApplicationTheme({@required this.theme, @required this.color});
}
