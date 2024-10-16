part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent{
    final WeatherCondition? condition;
  const ChangeTheme({@required this.condition});

  @override
  List<Object> get props => [condition!];
}