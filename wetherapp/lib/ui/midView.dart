import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WetherForecastModel> snapshot){
  var forecaseList = snapshot.data?.list;

  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;

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
        ),),
      ],
    ),
  );

  return midView;
}