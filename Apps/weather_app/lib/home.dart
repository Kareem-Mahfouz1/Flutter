// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/forecast_entry.dart';
import 'package:weather_app/data/models/weather_response.dart';
import 'package:weather_app/data/network/weather_api.dart';

class Home extends StatelessWidget {
  late WeatherResponse response;
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue[900]!,
          Colors.lightBlue[200]!,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: FutureBuilder<WeatherResponse>(
        future: WeatherApi.getApiData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              response = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          response.city.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 25),
                        Image.network(
                          'http://openweathermap.org/img/wn/${response.list[0].weather[0].icon}@2x.png',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 25),
                        Text(
                          response.list[0].main.temp.toInt().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'H:${response.list[0].main.temp_max.toInt()}° L:${response.list[0].main.temp_min.toInt()}°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: response.list
                            .map(
                              (e) => MyColumn(entry: e),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      ),
    ));
  }
}

class MyColumn extends StatelessWidget {
  late ForecastEntry entry;
  MyColumn({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('EEEE')
              .format(DateTime.fromMillisecondsSinceEpoch(entry.dt * 1000))
              .substring(0, 3),
          style:
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500),
        ),
        Text(
          DateFormat('jm')
              .format(DateTime.fromMillisecondsSinceEpoch(entry.dt * 1000)),
          style:
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500),
        ),
        Image.network(
          'http://openweathermap.org/img/wn/${entry.weather[0].icon}@2x.png',
          width: 100,
          height: 75,
          fit: BoxFit.contain,
        ),
        Text(
          '${entry.main.temp.toInt()}°',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
