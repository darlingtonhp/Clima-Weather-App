import 'package:clima/services/weather.dart';
import 'package:clima/views/loading_view.dart';
import 'package:clima/views/location_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClimaApp());
}

class ClimaApp extends StatelessWidget {
  const ClimaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLocationData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingPage();
        } else {
          return LocationView(locationWeather: snapshot.data as dynamic);
        }
      },
    );
  }
}
