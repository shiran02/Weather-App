
import 'package:flutter/material.dart';
import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';


Widget bottomView(AsyncSnapshot<WetherForecastModel> snapshot , BuildContext context){

  var forecastList = snapshot.data?.list;

  return   Column(
    children:  [
      SizedBox(height: 10),
     Text(
        "7-day Weather Forecast",
        style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold
        ),
     ), 

     SizedBox(height: 10),

    Container(
      height: 190,
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index) =>SizedBox(width: 10,), 
        itemCount: forecastList!.length,
        itemBuilder: (context , index)=>ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 160,
            child: forecasCard(snapshot,index),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              ),
            ),
          ),
        ), 
        
        ),
    )

    ],
  );

}