import 'package:ysec_weather_app/features/weather/models/weather_model.dart';

class WeatherRepository{
  Future<WeatherModel> getWeatherData(String city)async{
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(WeatherModel.fromJson('london'.contains(city.toLowerCase()) ? londonJson : chicagoJson));
  }
}

const londonJson = {
	  "consolidated_weather": [
	    {
	      "id": 5565095488782336,
	      "weather_state_name": "Showers",
	      "weather_state_abbr": "s",
	      "wind_direction_compass": "WNW",
	      "created": "2019-02-10T19:55:02.434940Z",
	      "applicable_date": "2019-02-10",
	      "min_temp": 3.75,
	      "max_temp": 6.883333333333333,
	      "the_temp": 6.885,
	      "wind_speed": 10.251177687940428,
	      "wind_direction": 288.4087075064449,
	      "air_pressure": 998.9649999999999,
	      "humidity": 79,
	      "visibility": 8.241867493835997,
	      "predictability": 73
	    },
	    {
	      "id": 5039805855432704,
	      "weather_state_name": "Light Cloud",
	      "weather_state_abbr": "lc",
	      "wind_direction_compass": "NW",
	      "created": "2019-02-10T19:55:02.537745Z",
	      "applicable_date": "2019-02-11",
	      "min_temp": 1.7699999999999998,
	      "max_temp": 8.986666666666666,
	      "the_temp": 8.105,
	      "wind_speed": 5.198548786091227,
	      "wind_direction": 319.24869874195554,
	      "air_pressure": 1027.4,
	      "humidity": 75,
	      "visibility": 11.027785234232084,
	      "predictability": 70
	    },
	    {
	      "id": 6214207016009728,
	      "weather_state_name": "Heavy Cloud",
	      "weather_state_abbr": "hc",
	      "wind_direction_compass": "SW",
	      "created": "2019-02-10T19:55:02.736577Z",
	      "applicable_date": "2019-02-12",
	      "min_temp": 3.2699999999999996,
	      "max_temp": 11.783333333333333,
	      "the_temp": 10.425,
	      "wind_speed": 6.291005350509027,
	      "wind_direction": 225.7496998927606,
	      "air_pressure": 1034.9099999999999,
	      "humidity": 77,
	      "visibility": 9.639331305177762,
	      "predictability": 71
	    },
	    {
	      "id": 6548160117735424,
	      "weather_state_name": "Heavy Cloud",
	      "weather_state_abbr": "hc",
	      "wind_direction_compass": "SSW",
	      "created": "2019-02-10T19:55:02.687267Z",
	      "applicable_date": "2019-02-13",
	      "min_temp": 3.526666666666667,
	      "max_temp": 11.476666666666667,
	      "the_temp": 10.695,
	      "wind_speed": 6.524550068392587,
	      "wind_direction": 203.1296143014564,
	      "air_pressure": 1035.775,
	      "humidity": 76,
	      "visibility": 12.940987135130836,
	      "predictability": 71
	    },
	    {
	      "id": 4957149578919936,
	      "weather_state_name": "Light Cloud",
	      "weather_state_abbr": "lc",
	      "wind_direction_compass": "SSE",
	      "created": "2019-02-10T19:55:03.487370Z",
	      "applicable_date": "2019-02-14",
	      "min_temp": 3.4500000000000006,
	      "max_temp": 12.540000000000001,
	      "the_temp": 12.16,
	      "wind_speed": 5.990352212916568,
	      "wind_direction": 154.1901674720193,
	      "air_pressure": 1035.53,
	      "humidity": 71,
	      "visibility": 13.873665294679075,
	      "predictability": 70
	    },
	    {
	      "id": 5277694765826048,
	      "weather_state_name": "Light Cloud",
	      "weather_state_abbr": "lc",
	      "wind_direction_compass": "S",
	      "created": "2019-02-10T19:55:04.800837Z",
	      "applicable_date": "2019-02-15",
	      "min_temp": 3.4,
	      "max_temp": 12.986666666666666,
	      "the_temp": 12.39,
	      "wind_speed": 5.359238182348418,
	      "wind_direction": 176.84978678797177,
	      "air_pressure": 1030.96,
	      "humidity": 77,
	      "visibility": 9.997862483098704,
	      "predictability": 70
	    }
	  ],
	  "time": "2019-02-10T21:49:37.574260Z",
	  "sun_rise": "2019-02-10T07:24:19.235049Z",
	  "sun_set": "2019-02-10T17:05:51.151342Z",
	  "timezone_name": "LMT",
	  "parent": {
	    "title": "England",
	    "location_type": "Region / State / Province",
	    "woeid": 24554868,
	    "latt_long": "52.883560,-1.974060"
	  },
	  "sources": [
	    {
	      "title": "BBC",
	      "slug": "bbc",
	      "url": "http://www.bbc.co.uk/weather/",
	      "crawl_rate": 180
	    },
	    {
	      "title": "Forecast.io",
	      "slug": "forecast-io",
	      "url": "http://forecast.io/",
	      "crawl_rate": 480
	    },
	    {
	      "title": "HAMweather",
	      "slug": "hamweather",
	      "url": "http://www.hamweather.com/",
	      "crawl_rate": 360
	    },
	    {
	      "title": "Met Office",
	      "slug": "met-office",
	      "url": "http://www.metoffice.gov.uk/",
	      "crawl_rate": 180
	    },
	    {
	      "title": "OpenWeatherMap",
	      "slug": "openweathermap",
	      "url": "http://openweathermap.org/",
	      "crawl_rate": 360
	    },
	    {
	      "title": "Weather Underground",
	      "slug": "wunderground",
	      "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
	      "crawl_rate": 720
	    },
	    {
	      "title": "World Weather Online",
	      "slug": "world-weather-online",
	      "url": "http://www.worldweatheronline.com/",
	      "crawl_rate": 360
	    },
	    {
	      "title": "Yahoo",
	      "slug": "yahoo",
	      "url": "http://weather.yahoo.com/",
	      "crawl_rate": 180
	    }
	  ],
	  "title": "London",
	  "location_type": "City",
	  "woeid": 44418,
	  "latt_long": "51.506321,-0.12714",
	  "timezone": "Europe/London"
	};

  const chicagoJson = {
  "consolidated_weather": [
    {
      "id": 8765432189098765,
      "weather_state_name": "Snow",
      "weather_state_abbr": "sn",
      "wind_direction_compass": "N",
      "created": "2024-02-10T19:55:02.434940Z",
      "applicable_date": "2024-02-10",
      "min_temp": -5.75,
      "max_temp": 0.0,
      "the_temp": -2.5,
      "wind_speed": 12.15,
      "wind_direction": 10.4,
      "air_pressure": 1012.6,
      "humidity": 85,
      "visibility": 3.2,
      "predictability": 80
    },
    {
      "id": 908765432109876,
      "weather_state_name": "Heavy Snow",
      "weather_state_abbr": "hs",
      "wind_direction_compass": "NE",
      "created": "2024-02-10T19:55:02.537745Z",
      "applicable_date": "2024-02-11",
      "min_temp": -10.2,
      "max_temp": -3.5,
      "the_temp": -6.0,
      "wind_speed": 20.5,
      "wind_direction": 40.8,
      "air_pressure": 1005.9,
      "humidity": 90,
      "visibility": 1.5,
      "predictability": 85
    },
    {
      "id": 3456789012345678,
      "weather_state_name": "Cloudy",
      "weather_state_abbr": "hc",
      "wind_direction_compass": "SW",
      "created": "2024-02-10T19:55:02.736577Z",
      "applicable_date": "2024-02-12",
      "min_temp": -8.0,
      "max_temp": 2.5,
      "the_temp": 1.0,
      "wind_speed": 15.3,
      "wind_direction": 215.0,
      "air_pressure": 1020.2,
      "humidity": 78,
      "visibility": 9.0,
      "predictability": 70
    },
    {
      "id": 1234567890123456,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "SE",
      "created": "2024-02-10T19:55:02.687267Z",
      "applicable_date": "2024-02-13",
      "min_temp": -6.0,
      "max_temp": 3.0,
      "the_temp": 2.8,
      "wind_speed": 10.7,
      "wind_direction": 145.2,
      "air_pressure": 1025.0,
      "humidity": 65,
      "visibility": 15.0,
      "predictability": 90
    },
    {
      "id": 9876543210987654,
      "weather_state_name": "Light Snow",
      "weather_state_abbr": "ls",
      "wind_direction_compass": "W",
      "created": "2024-02-10T19:55:03.487370Z",
      "applicable_date": "2024-02-14",
      "min_temp": -4.0,
      "max_temp": 1.5,
      "the_temp": -0.5,
      "wind_speed": 13.9,
      "wind_direction": 280.3,
      "air_pressure": 1015.8,
      "humidity": 75,
      "visibility": 5.8,
      "predictability": 75
    },
    {
      "id": 1234598765432109,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "E",
      "created": "2024-02-10T19:55:04.800837Z",
      "applicable_date": "2024-02-15",
      "min_temp": -2.0,
      "max_temp": 5.0,
      "the_temp": 4.0,
      "wind_speed": 8.5,
      "wind_direction": 90.6,
      "air_pressure": 1030.1,
      "humidity": 60,
      "visibility": 12.0,
      "predictability": 85
    }
  ],
  "time": "2024-02-10T21:49:37.574260Z",
  "sun_rise": "2024-02-10T07:24:19.235049Z",
  "sun_set": "2024-02-10T17:45:51.151342Z",
  "timezone_name": "CST",
  "parent": {
    "title": "Illinois",
    "location_type": "Region / State / Province",
    "woeid": 2347563,
    "latt_long": "40.633125,-89.398529"
  },
  "sources": [
    {
      "title": "BBC",
      "slug": "bbc",
      "url": "http://www.bbc.co.uk/weather/",
      "crawl_rate": 180
    },
    {
      "title": "Forecast.io",
      "slug": "forecast-io",
      "url": "http://forecast.io/",
      "crawl_rate": 480
    },
    {
      "title": "HAMweather",
      "slug": "hamweather",
      "url": "http://www.hamweather.com/",
      "crawl_rate": 360
    },
    {
      "title": "Met Office",
      "slug": "met-office",
      "url": "http://www.metoffice.gov.uk/",
      "crawl_rate": 180
    },
    {
      "title": "OpenWeatherMap",
      "slug": "openweathermap",
      "url": "http://openweathermap.org/",
      "crawl_rate": 360
    },
    {
      "title": "Weather Underground",
      "slug": "wunderground",
      "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
      "crawl_rate": 720
    },
    {
      "title": "World Weather Online",
      "slug": "world-weather-online",
      "url": "http://www.worldweatheronline.com/",
      "crawl_rate": 360
    },
    {
      "title": "Yahoo",
      "slug": "yahoo",
      "url": "http://weather.yahoo.com/",
      "crawl_rate": 180
    }
  ],
  "title": "Chicago",
  "location_type": "City",
  "woeid": 2379574,
  "latt_long": "41.878113,-87.629799",
  "timezone": "America/Chicago"
};
