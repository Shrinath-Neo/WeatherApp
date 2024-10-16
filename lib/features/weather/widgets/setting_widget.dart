import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysec_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:ysec_weather_app/shared/enums.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocSelector<WeatherBloc, WeatherState, bool>(selector: (state) {
            if (state is WeatherDataSuccess) {
              return state.weather?.tempUnit == TemperatureUnits.fahrenheit;
            }
            return false;
          }, builder: (context, state) {
            return ListTile(
              title: const Text(
                'Temperature Units',
              ),
              isThreeLine: true,
              subtitle:
                  const Text('Use metric measurements for temperature units.'),
              trailing: Switch(
                value: state,
                onChanged: (_) =>
                    BlocProvider.of<WeatherBloc>(context).add(ToggleTempUnit()),
              ),
            );
          }),
        ],
      ),
    );
  }
}
