
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:wetherapp/ui/bottom-view.dart';

import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WetherForecastModel> snapshot){
  var forecastList = snapshot.data?.list;

  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  

  var formattedates = DateTime.fromMillisecondsSinceEpoch((forecastList![0].dt! * 1000 ));

  var forecast = forecastList[0];

 final String? weatherDescription = forecast.weather![0].main;

  Container midView =  Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$city , $country",
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black
          ),
        ),

        Text(
            "${Util.getFormattedDate(formattedates)}",
            style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.black
            ),
        ),

        SizedBox(),


       // Icon(Icons.wb_sunny,size: 195),
        getWeatherIcons(weatherDesctiption: weatherDescription ?? "Snow", color: Colors.pink, size: 195 , ),


        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
        
              Text(
                "${forecast.temp?.day?.toStringAsFixed(0)}°F",
                style: const TextStyle(
                  fontSize: 34
                ),
              ),
        
              const SizedBox(width: 10),
          
              Text(
                "${forecast.weather?[0].description?.toUpperCase()}",
                style: const TextStyle(
                  fontSize: 14
                ),
              ),
        
            ],
          ),
        ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].speed?.toStringAsFixed(1)} mi/h"),
                      const Icon(
                        FontAwesome5Solid.wind,
                        size: 20,
                        color: Colors.redAccent,
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.humidity?.toStringAsFixed(0)}%"),
                      const Icon(
                        FontAwesome5Solid.grin_beam_sweat,
                        size: 20,
                        color: Colors.redAccent,
                        )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.temp?.max?.toStringAsFixed(0)} °F"),
                      const Icon(
                        FontAwesome5Solid.temperature_high,
                        size: 20,
                        color: Colors.redAccent,
                        )
                      //const Icon(Icons.wb_sunny,color: Colors.orangeAccent,)
                    ],
                  ),
                ),

                


              ],
            ),
          ),

         

        

      ],
    ),
  );

  return midView;
}