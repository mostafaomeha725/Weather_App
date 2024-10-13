
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weatherModel.dart';

class weatherService
{
  Future<WeatherModel> getWeather( String CityName)
 async {
    String BaseUri = "http://api.weatherapi.com/v1";
    String ApiKey = "7120052998f14065b8195241232406";
    Uri url = 
    Uri.parse("$BaseUri/forecast.json?key=$ApiKey&q=$CityName&days=1&aqi=no&alerts=no"); 
    http.Response response =await http.get(url);
    Map<String , dynamic> data = await jsonDecode(response.body);
    var info = data ["forecast"]["forecastday"][0]["day"];
    WeatherModel weather = WeatherModel(
      data: data["location"]["localtime"] ,
      maxTemp: info["maxtemp_c"],
      Condition: info ["condition"]["text"] ,
      Temp: info ["avgtemp_c"] ,
      minTemp: info ["mintemp_c"],
        );
    return weather ;
    
  }
  
}