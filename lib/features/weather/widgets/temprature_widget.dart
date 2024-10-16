import 'package:flutter/material.dart';
import 'package:ysec_weather_app/shared/enums.dart';

class Temperature extends StatelessWidget {
  final double? temperature;
  final double? low;
  final double? high;
  final TemperatureUnits? units;

  const Temperature({
    super.key,
    this.temperature,
    this.low,
    this.high,
  required  this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature ?? 0.0)}°',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'max: ${_formattedTemperature(high ?? 0.0)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'max: ${_formattedTemperature(low ?? 0.0)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  int _formattedTemperature(double t) =>
      units == TemperatureUnits.fahrenheit ? _toFahrenheit(t) : t.round();
}