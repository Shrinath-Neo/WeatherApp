// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ysec_weather_app/features/theme/bloc/theme_bloc.dart';
import 'package:ysec_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:ysec_weather_app/shared/enums.dart';
import 'package:ysec_weather_app/features/weather/widgets/select_city.dart';
import 'package:ysec_weather_app/features/weather/widgets/setting_widget.dart';
import 'package:ysec_weather_app/features/weather/widgets/temprature_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectCity(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context).add(
                  GetWeatherData(city),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          buildWhen: (previous, current) => current != WeatherEmptyState(),
          listener: (context, state) {
            if (state is WeatherDataSuccess) {
              BlocProvider.of<ThemeBloc>(context).add(
                  ChangeTheme(condition: state.consolidatedWeather?.condition));
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherDataSuccess) {
              final weather = state.weather;
              String time = DateFormat('hh:mm a')
                  .format(state.consolidatedWeather!.created!);
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.6, 0.8, 1.0],
                          colors: [
                            themeState.color![700]!,
                            themeState.color![500]!,
                            themeState.color![300]!,
                          ],
                        ),
                      ),
                      child: RefreshIndicator(
                        onRefresh: () {
                          // ignore: void_checks
                          return Future.value(() {
                            BlocProvider.of<WeatherBloc>(context).add(
                              GetWeatherData(state.weather!.title!),
                            );
                          });
                          // BlocProvider.of<WeatherBloc>(context).add(
                          //   WeatherRefreshRequested(city: weather.location),
                          // );
                          // return _refreshCompleter.future;
                        },
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 100.0),
                              child: Center(
                                child: Text(
                                  weather?.title ?? '',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Updated: $time',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 50.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: _mapConditionToImage(state
                                              .consolidatedWeather!.condition!),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Temperature(
                                              temperature: state
                                                  .consolidatedWeather?.theTemp,
                                              high: state
                                                  .consolidatedWeather?.maxTemp,
                                              low: state
                                                  .consolidatedWeather?.minTemp,
                                              units: state.weather?.tempUnit,
                                            )),
                                      ],
                                    ),
                                    Center(
                                      child: Text(
                                        state.consolidatedWeather
                                                ?.weatherStateName ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w200,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            }
            if (state is WeatherLoadFailure) {
              return Text(
                state.error ?? 'Something went wrong!',
                style: const TextStyle(color: Colors.red),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }
}
