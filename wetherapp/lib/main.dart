import 'package:flutter/material.dart';
import 'package:wetherapp/model/weather_forecast_model.dart';
import 'package:wetherapp/network/network.dart';
import 'package:wetherapp/ui/midView.dart';
import 'package:wetherapp/widgets/textfield_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String _cityname = "kandy";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityname);

    forecastObject.then((weather){
      print(weather.list![0].weather?[0].main);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textField(),
          
          Container(
              child: FutureBuilder<WetherForecastModel>(
                future: forecastObject, 
                builder: (BuildContext context, AsyncSnapshot<WetherForecastModel> snapshot) {
                  if(snapshot.hasData){
                    return midView(snapshot);
                  }else{  
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                },
                
          ),

          ),
        ],
      ),
    );
  }
}
