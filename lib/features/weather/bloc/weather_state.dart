part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherDataSuccess extends WeatherState {
  //Weather Model
  final WeatherModel? weather;
  final ConsolidatedWeather? consolidatedWeather;

  WeatherDataSuccess({required this.weather,required this.consolidatedWeather});
  @override
  List<Object> get props => [weather! , consolidatedWeather!];

}

class WeatherLoadFailure extends WeatherState {
  final String? error;
  WeatherLoadFailure({this.error});

  @override
  List<Object> get props => [error ?? ''];
}
