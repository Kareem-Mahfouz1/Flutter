import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  WeatherModel? weatherModel;
  late String cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());

    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherLoaded(weatherModel: weatherModel!));
    } on Exception {
      emit(WeatherError());
    }
  }
}
