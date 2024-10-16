import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ysec_weather_app/helper/extensions.dart';
import 'package:ysec_weather_app/shared/enums.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeTheme>(_getTheme);
  }

  void _getTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    emit(_mapWeatherConditionToThemeData(event.condition!));
  }

  ThemeState _mapWeatherConditionToThemeData(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return _buildThemeState(
          themeColor: Colors.yellow,
          primaryColor: Colors.orangeAccent,
        );
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        return _buildThemeState(
          themeColor: Colors.lightBlue,
          primaryColor: Colors.lightBlueAccent,
        );
      case WeatherCondition.heavyCloud:
        return _buildThemeState(
          themeColor: Colors.grey,
          primaryColor: Colors.blueGrey,
        );
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        return _buildThemeState(
          themeColor: Colors.indigo,
          primaryColor: Colors.indigoAccent,
        );
      case WeatherCondition.thunderstorm:
        return _buildThemeState(
          themeColor: Colors.deepPurple,
          primaryColor: Colors.deepPurpleAccent,
        );
      case WeatherCondition.unknown:
        return _buildThemeState(
          themeColor: Colors.lightBlue,
          isLightTheme: true,
        );
    }
  }

  ThemeState _buildThemeState({
    required Color? themeColor,
    Color? primaryColor,
    bool isLightTheme = false,
  }) {
    return ThemeState(
      theme: isLightTheme
          ? ThemeData.light()
          : ThemeData(
              primaryColor: primaryColor ?? themeColor,
              appBarTheme: AppBarTheme(
                backgroundColor: themeColor,
              ),
              
            ),
      color: themeColor?.toMaterialColor(),
    );
  }
}
