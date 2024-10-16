 

import 'dart:convert';

import 'package:ysec_weather_app/shared/enums.dart';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    final List<ConsolidatedWeather>? consolidatedWeather;
    final DateTime? time;
    final DateTime? sunRise;
    final DateTime? sunSet;
    final String? timezoneName;
    final Parent? parent;
    final List<Source>? sources;
    final String? title;
    final String? locationType;
    final int? woeid;
    final String? lattLong;
    final String? timezone;
    final TemperatureUnits? tempUnit;

    WeatherModel({
        this.consolidatedWeather,
        this.time,
        this.sunRise,
        this.sunSet,
        this.timezoneName,
        this.parent,
        this.sources,
        this.title,
        this.locationType,
        this.woeid,
        this.lattLong,
        this.timezone,
        this.tempUnit = TemperatureUnits.celsius
    });

    WeatherModel copyWith({
        List<ConsolidatedWeather>? consolidatedWeather,
        DateTime? time,
        DateTime? sunRise,
        DateTime? sunSet,
        String? timezoneName,
        Parent? parent,
        List<Source>? sources,
        String? title,
        String? locationType,
        int? woeid,
        String? lattLong,
        String? timezone,
        TemperatureUnits? tempUnit,
    }) => 
        WeatherModel(
            consolidatedWeather: consolidatedWeather ?? this.consolidatedWeather,
            time: time ?? this.time,
            sunRise: sunRise ?? this.sunRise,
            sunSet: sunSet ?? this.sunSet,
            timezoneName: timezoneName ?? this.timezoneName,
            parent: parent ?? this.parent,
            sources: sources ?? this.sources,
            title: title ?? this.title,
            locationType: locationType ?? this.locationType,
            woeid: woeid ?? this.woeid,
            lattLong: lattLong ?? this.lattLong,
            timezone: timezone ?? this.timezone,
            tempUnit: tempUnit ?? this.tempUnit
        );

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        consolidatedWeather: json["consolidated_weather"] == null ? [] : List<ConsolidatedWeather>.from(json["consolidated_weather"]!.map((x) => ConsolidatedWeather.fromJson(x))),
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        sunRise: json["sun_rise"] == null ? null : DateTime.parse(json["sun_rise"]),
        sunSet: json["sun_set"] == null ? null : DateTime.parse(json["sun_set"]),
        timezoneName: json["timezone_name"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
        timezone: json["timezone"],
        
    );

    Map<String, dynamic> toJson() => {
        "consolidated_weather": consolidatedWeather == null ? [] : List<dynamic>.from(consolidatedWeather!.map((x) => x.toJson())),
        "time": time?.toIso8601String(),
        "sun_rise": sunRise?.toIso8601String(),
        "sun_set": sunSet?.toIso8601String(),
        "timezone_name": timezoneName,
        "parent": parent?.toJson(),
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
        "timezone": timezone,
    };
}

class ConsolidatedWeather {
    final int? id;
    final String? weatherStateName;
    final String? weatherStateAbbr;
    final String? windDirectionCompass;
    final DateTime? created;
    final DateTime? applicableDate;
    final double? minTemp;
    final double? maxTemp;
    final double? theTemp;
    final double? windSpeed;
    final double? windDirection;
    final double? airPressure;
    final int? humidity;
    final double? visibility;
    final int? predictability;
    final WeatherCondition? condition;

    ConsolidatedWeather({
        this.id,
        this.weatherStateName,
        this.weatherStateAbbr,
        this.windDirectionCompass,
        this.created,
        this.applicableDate,
        this.minTemp,
        this.maxTemp,
        this.theTemp,
        this.windSpeed,
        this.windDirection,
        this.airPressure,
        this.humidity,
        this.visibility,
        this.predictability,
        this.condition
    });

    ConsolidatedWeather copyWith({
        int? id,
        String? weatherStateName,
        String? weatherStateAbbr,
        String? windDirectionCompass,
        DateTime? created,
        DateTime? applicableDate,
        double? minTemp,
        double? maxTemp,
        double? theTemp,
        double? windSpeed,
        double? windDirection,
        double? airPressure,
        int? humidity,
        double? visibility,
        int? predictability,
        WeatherCondition? condition
    }) => 
        ConsolidatedWeather(
            id: id ?? this.id,
            weatherStateName: weatherStateName ?? this.weatherStateName,
            weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
            windDirectionCompass: windDirectionCompass ?? this.windDirectionCompass,
            created: created ?? this.created,
            applicableDate: applicableDate ?? this.applicableDate,
            minTemp: minTemp ?? this.minTemp,
            maxTemp: maxTemp ?? this.maxTemp,
            theTemp: theTemp ?? this.theTemp,
            windSpeed: windSpeed ?? this.windSpeed,
            windDirection: windDirection ?? this.windDirection,
            airPressure: airPressure ?? this.airPressure,
            humidity: humidity ?? this.humidity,
            visibility: visibility ?? this.visibility,
            predictability: predictability ?? this.predictability,
            condition: condition ?? this.condition
        );

    factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => ConsolidatedWeather(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        applicableDate: json["applicable_date"] == null ? null : DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"]?.toDouble(),
        maxTemp: json["max_temp"]?.toDouble(),
        theTemp: json["the_temp"]?.toDouble(),
        windSpeed: json["wind_speed"]?.toDouble(),
        windDirection: json["wind_direction"]?.toDouble(),
        airPressure: json["air_pressure"]?.toDouble(),
        humidity: json["humidity"],
        visibility: json["visibility"]?.toDouble(),
        predictability: json["predictability"],
        condition: _mapStringToWeatherCondition(json['weather_state_abbr'])
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created?.toIso8601String(),
        "applicable_date": "${applicableDate!.year.toString().padLeft(4, '0')}-${applicableDate!.month.toString().padLeft(2, '0')}-${applicableDate!.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
    };
}

class Parent {
    final String? title;
    final String? locationType;
    final int? woeid;
    final String? lattLong;

    Parent({
        this.title,
        this.locationType,
        this.woeid,
        this.lattLong,
    });

    Parent copyWith({
        String? title,
        String? locationType,
        int? woeid,
        String? lattLong,
    }) => 
        Parent(
            title: title ?? this.title,
            locationType: locationType ?? this.locationType,
            woeid: woeid ?? this.woeid,
            lattLong: lattLong ?? this.lattLong,
        );

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
    };
}

class Source {
    final String? title;
    final String? slug;
    final String? url;
    final int? crawlRate;

    Source({
        this.title,
        this.slug,
        this.url,
        this.crawlRate,
    });

    Source copyWith({
        String? title,
        String? slug,
        String? url,
        int? crawlRate,
    }) => 
        Source(
            title: title ?? this.title,
            slug: slug ?? this.slug,
            url: url ?? this.url,
            crawlRate: crawlRate ?? this.crawlRate,
        );

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        title: json["title"],
        slug: json["slug"],
        url: json["url"],
        crawlRate: json["crawl_rate"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "url": url,
        "crawl_rate": crawlRate,
    };
}

 WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }