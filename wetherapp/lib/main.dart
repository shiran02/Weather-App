import 'package:flutter/material.dart';
import 'package:wetherapp/model/weather_forecast_model.dart';
import 'package:wetherapp/network/network.dart';
import 'package:wetherapp/ui/bottom-view.dart';
import 'package:wetherapp/ui/midView.dart';
import 'package:wetherapp/util/forecast_util.dart';
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
  String _cityName = "kandy";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName :_cityName);

    forecastObject.then((weather){
      print(weather.list![0].weather?[0].main);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textField2(),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: FutureBuilder<WetherForecastModel>(
                  future: forecastObject, 
                  builder: (BuildContext context, AsyncSnapshot<WetherForecastModel> snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        children: [
                          midView(snapshot),
                           bottomView(snapshot, context),
                        ],
                      );
                    }else{  
                      return Container(
                        child: Center(child: CircularProgressIndicator(),),
                      );
                    }
                  },
                  
            ),
          
            ),
          ),

          
        ],
      ),
    );
  }


  Widget textField2(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.blueAccent,
        hintText: "Search city",
        prefixIcon: const Icon(Icons.search,color: Colors.blue,),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 4,
            color: Colors.blue
          ),
          borderRadius: BorderRadius.circular(12),
          
          
          
        )
      ),
      onSubmitted: (value){
        setState((){
          _cityName = value;
          forecastObject = getWeather(cityName :_cityName);
        });
      },
    ),
  );
}

  Future<WetherForecastModel> getWeather({required String cityName}) => 
  new Network().getWeatherForecast(cityName: _cityName);
}


