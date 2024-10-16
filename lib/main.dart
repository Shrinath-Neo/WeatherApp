import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysec_weather_app/features/theme/bloc/theme_bloc.dart';
import 'package:ysec_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:ysec_weather_app/features/weather/pages/weather_page.dart';
import 'package:ysec_weather_app/features/weather/repositories/weather_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepository: WeatherRepository())
                ..add(GetWeatherData('')),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeState.theme,
            debugShowCheckedModeBanner: false,
            home: const WeatherPage(),
          );
        },
      ),
    );
  }
}
