import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/service/weather_network_service.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("India's Weather App"),
        ),
        body: FutureBuilder(
          future: WeatherNetworkService.getWeatherData("London"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Weather weather = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height / 2.5,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Lottie.asset("assets/rain.json", fit: BoxFit.fill),

                  // ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              weather.temperature < 25
                                  ? Icon(
                                      Icons.cloud,
                                      size: 40,
                                      color: Colors.orange,
                                    )
                                  : Icon(
                                      Icons.wb_sunny,
                                      size: 40,
                                      color: Colors.orange,
                                    ),
                              Text(
                                weather.name,
                                style: TextStyle(fontSize: 40),
                              ),
                              Text(
                                weather.temperature.toString() + " `F",
                                style: TextStyle(fontSize: 40),
                              ),
                              Text(
                                weather.temperatureFeeling.toString() + " `F",
                                style: TextStyle(fontSize: 40),
                              ),
                              Text(
                                "humidity: " + weather.humidity.toString(),
                                style: TextStyle(fontSize: 40),
                              ),
                              Text(
                                weather.description,
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 80,
                    color: Colors.red,
                  ),
                  Text("Some Eror is occuring"),
                ],
              ));
            }
            return LinearProgressIndicator(
              value: null,
            );
          },
        ));
  }
}
