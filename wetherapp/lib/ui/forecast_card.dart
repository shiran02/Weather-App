import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:wetherapp/util/convert_icon.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

Widget forecasCard(AsyncSnapshot<WetherForecastModel> snapshot, index) {
  var forecastList = snapshot.data?.list;

  DateTime date =
      DateTime.fromMillisecondsSinceEpoch((forecastList![index].dt! * 1000));
  var dayOdWeek = "";
  var fulDate = Util.getFormattedDate(date);
  dayOdWeek = fulDate.split(",")[0];

  var forecast = forecastList[0];

  final String? weatherDescription = forecast.weather![0].main;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${dayOdWeek}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          ),
        ),
      ),


      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: getWeatherIcons(
                  weatherDesctiption: weatherDescription ?? "Snow",
                  color: Colors.pink,
                  size: 25),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("${forecastList[index].temp?.min?.toStringAsFixed(0)}°F"),
                ),

                Icon(FontAwesome.arrow_circle_down,color: Colors.white,)
                ],
              ),

              Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("${forecastList[index].temp?.max?.toStringAsFixed(0)}°F"),
                ),

                Icon(FontAwesome.arrow_circle_up,color: Colors.white,)
                ],
              ),

              Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Hum :${forecastList[index].humidity?.toStringAsFixed(0)}°F"),
                ),
                ],
              ),

              Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Win :${forecastList[index].speed?.toStringAsFixed(0)} mi/h"),
                ),

               // Icon(FontAwesome5Solid.wind,color: Colors.white,)
                ],
              )
              
            ],
          ),
        ],
      ),
    ],
  );
}
