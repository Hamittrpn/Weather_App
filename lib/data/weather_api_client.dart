import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = "www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final queryParameters = {'query': '$cityName'};
    final cityUrl =
        Uri.https(baseUrl, "/api/location/search/", queryParameters);

    final response = await httpClient.get(cityUrl);
    if (response.statusCode != 200) {
      throw Exception("Veri getirilemedi!");
    }
    final responseJson = (jsonDecode(response.body)) as List;
    if (responseJson.length > 0) {
      return responseJson[0]["woeid"];
    }
  }

  Future<Weather> getWeather(int cityId) async {
    final weatherUrl = Uri.https(baseUrl, "/api/location/$cityId");
    final response = await httpClient.get(weatherUrl);
    if (response.statusCode != 200) {
      throw Exception("Hava Durumu getirilemedi!");
    }
    final responseJson = jsonDecode(response.body);
    return Weather.fromJson(responseJson);
  }
}
