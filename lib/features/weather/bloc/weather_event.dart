part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


final class GetWeatherData extends WeatherEvent {
  final String city;
  GetWeatherData(this.city);
  @override
  List<Object?> get props => [city];
}

final class ToggleTempUnit extends WeatherEvent {
  ToggleTempUnit();
}


