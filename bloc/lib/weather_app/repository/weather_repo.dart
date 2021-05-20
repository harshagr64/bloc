import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bloc_tut/weather_app/models/data_model.dart';

class WeatherRepo {
  Future<DataModel> getWeather(String city) async {
    print('city: $city');
    final result = await http.get(
        'https://api.weatherapi.com/v1/current.json?key=85a1125cb3f440fca7f72303212005&q=$city&aqi=no');
    if (result.statusCode != 200) throw Exception();
    print(result.statusCode);
    return parseJson(result.body);
  }

  DataModel parseJson(String response) {
    final jsonDecoded = json.decode(response);
    Map<String, dynamic> data = jsonDecoded['current'];
    print(data);
    return DataModel.fromJson(data);
  }
}
