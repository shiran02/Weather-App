
import 'package:flutter/material.dart';
import '../model/weather_forecast_model.dart';


Widget bottomView(AsyncSnapshot<WetherForecastModel> snapshot , BuildContext context){

  var forecastList = snapshot.data?.list;

  return   Column(
    children:  [
      
     Text(
        "7-day Weather Forecast",
        style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold
        ),
     ), 
    ],
  );

}