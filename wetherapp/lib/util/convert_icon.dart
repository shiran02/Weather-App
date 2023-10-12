import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


Widget getWeatherIcons({required String weatherDesctiption ,required Color color ,required double size}){
  
  switch(weatherDesctiption){
    case  "Clear":
      {return Icon(FontAwesome5Solid.sun,size: size,color: color,);}
      break;

    case  "Clouds":
      {return Icon(FontAwesome5Solid.cloud,size: size,color: color,);}
      break;

    case  "Rain":
      {return Icon(FontAwesome5Solid.cloud_rain,size: size,color: color,);}
      break;

    case  "Snow":
      {return Icon(FontAwesome5Solid.snowman,size: size,color: color,);}
      break;

    default :
    {return Icon(FontAwesome5Solid.sun,size: size,color: color,);}
      break;
  }
}