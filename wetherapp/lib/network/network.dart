import 'dart:convert';

import 'package:http/http.dart';
import 'package:wetherapp/ui/forecast_util.dart';
import '../model/weather_forecast_model.dart';

class Network{
  Future<WetherForecastModel> getWeatherForecast({required String cityName}) async{
    
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
    "&appid="+Util.appId+"&units=imperial";  //change to metric or imperial

    //Response response = await get(Uri.encodeFull(finalUrl));
    Response response = await get(Uri.parse(finalUrl));

    

    if(response.statusCode == 200){
      print("weather data : ${response.body}");
      return WetherForecastModel.fromJson(json.decode(response.body));
      //we get actual mapped model (dart object)
    }else{
      throw Exception("Error getting weather forecast");
    }

  }
}


// class Network{
//   final String url;


//   Network(this.url);

//   Future fetchData() async{
    

//     print("$url");

//     Response response = await get(Uri.parse(url));


//     if(response.statusCode == 200){

//       print(response.body[0]);
//  //     print(response.body);
//       return json.decode(response.body);
//     }else{
//       print(response.statusCode);
//     }
//   }

// }