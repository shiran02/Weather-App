import 'package:flutter/material.dart';
import 'package:wetherapp/model/weather_forecast_model.dart';
import 'package:wetherapp/network/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late Future<WetherForecastModel> forecastObject;
  String _cityname = "colombo";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityname);

    forecastObject.then((weather){
      print(weather.city?.country);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("wether Forecast"),
      ),
    );
  }
}
