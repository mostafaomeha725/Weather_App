

import 'package:flutter/material.dart';


class WeatherModel 
{
  String? data ;
  double? maxTemp ;
  double? minTemp ;
  String? Condition ;
  double? Temp ;
  WeatherModel({required this.data , required this.maxTemp , required this.Condition , required this.Temp , required this.minTemp});

  @override
  String toString() {
    // TODO: implement toString
    return "data = $data   maxTemp = $maxTemp   minTemp = $minTemp   condition = $Condition   Temp = $Temp";
  }


  String? getImage()
{
if (Condition == 'Sunny' || Condition == 'Clear' || Condition == 'partly cloudy')
{
  return "assets/images/clear.png" ;
}
else if(Condition == 'Blizzard' || Condition == 'Patchy snow possible' || Condition == 'Patchy sleet possible' || Condition == 'Patchy freezing drizzle possible' || Condition == 'Blowing snow')
{
  return "assets/images/snow.png" ;
}
else if (Condition == 'Freezing fog' || Condition == 'Fog' ||  Condition == 'Heavy Cloud' || Condition == 'Mist' || Condition == 'Fog')
{
  return 'assets/images/cloudy.png';
} 
else if (Condition == 'Patchy rain possible' || Condition == 'Heavy Rain' || Condition == 'Showers') 
{
  return 'assets/images/rainy.png';
} 
else if (Condition == 'Thundery outbreaks possible' || Condition == 'Moderate or heavy snow with thunder' || Condition == 'Patchy light snow with thunder'|| Condition == 'Moderate or heavy rain with thunder' || Condition == 'Patchy light rain with thunder' )
{
  return 'assets/images/thunderstorm.png';
} 
else
{
  return 'assets/images/clear.png';
}

} 

MaterialColor getColor()
{
if (Condition == 'Sunny' || Condition == 'Clear' || Condition == 'partly cloudy')
{
  return Colors.orange ;
}
else if(Condition == 'Blizzard' || Condition == 'Patchy snow possible' || Condition == 'Patchy sleet possible' || Condition == 'Patchy freezing drizzle possible' || Condition == 'Blowing snow')
{
  return Colors.blue ;
}
else if (Condition == 'Freezing fog' || Condition == 'Fog' ||  Condition == 'Heavy Cloud' || Condition == 'Mist' || Condition == 'Fog')
{
  return Colors.blueGrey;
} 
else if (Condition == 'Patchy rain possible' || Condition == 'Heavy rain' || Condition == 'Showers') 
{
  return Colors.blue;
} 
else if (Condition == 'Thundery outbreaks possible' || Condition == 'Moderate or heavy snow with thunder' || Condition == 'Patchy light snow with thunder'|| Condition == 'Moderate or heavy rain with thunder' || Condition == 'Patchy light rain with thunder' )
{
  return Colors.deepPurple;
}
else if (Condition == 'Moderate rain' || Condition == 'Overcast') 
{
  return Colors.green ;
}
else
{
  return Colors.orange;
}

}

}



