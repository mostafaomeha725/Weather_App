
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubit/WeatherState.dart';
import 'package:weatherapp/model/weatherModel.dart';
import 'package:weatherapp/services/weatherService.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  
  WeatherModel? Dataa ;
 weatherService? weatherservice ;


  WeatherCubit(this.weatherservice): super(Weatherinitial());
  void getWeather({required String CityName})
async  {
  emit(WeatherLoading());
    try {
  Dataa = await  weatherservice!.getWeather(CityName);
  emit(WeatherSuccess());
}  catch (e) {
   emit(WeatherFailure(e.toString())) ;
}
  }
}