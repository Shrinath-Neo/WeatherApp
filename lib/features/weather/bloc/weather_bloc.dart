import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ysec_weather_app/shared/enums.dart';
import 'package:ysec_weather_app/features/weather/models/weather_model.dart';
import 'package:ysec_weather_app/features/weather/repositories/weather_repo.dart';


part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherModel? weatherData;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<GetWeatherData>(_getWeatherData);
    on<ToggleTempUnit>(_toggleTempUnit);
  }

  Future<void> _getWeatherData(
      GetWeatherData event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    weatherData = await weatherRepository.getWeatherData(event.city);
    emit(WeatherDataSuccess(
        weather: weatherData,
        consolidatedWeather:
            getMostPredictableWeather(weatherData?.consolidatedWeather ?? [])));
  }

  Future<void> _toggleTempUnit(
      ToggleTempUnit event, Emitter<WeatherState> emit) async {
    if (weatherData == null) return;
    weatherData = weatherData?.copyWith(
        tempUnit: weatherData?.tempUnit == TemperatureUnits.celsius
            ? TemperatureUnits.fahrenheit
            : TemperatureUnits.celsius);
    emit(WeatherDataSuccess(
        weather: weatherData,
        consolidatedWeather:
            getMostPredictableWeather(weatherData?.consolidatedWeather ?? [])));
  }

  ConsolidatedWeather? getMostPredictableWeather(
      List<ConsolidatedWeather> weatherForecast) {
    // Find the weather with the highest predictability
    return weatherForecast.reduce((current, next) {
      return current.predictability! > next.predictability! ? current : next;
    });
  }
}
