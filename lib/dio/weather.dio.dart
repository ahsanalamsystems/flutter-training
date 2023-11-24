import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lecture_one/constant/color.constant.dart';
import 'package:lecture_one/dio/weather.dio.service.dart';
import 'package:lecture_one/model/weather.model.dart';

class WeatherDioPage extends StatefulWidget {
  const WeatherDioPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherDioPageState createState() => _WeatherDioPageState();
}

class _WeatherDioPageState extends State<WeatherDioPage> {
  late WeatherModel weather = WeatherModel();
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    getWeatherUpdate();
  }

  void getWeatherUpdate() async {
    WeatherDioService weatherService = WeatherDioService();
    weather = await weatherService.getWeatherUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dio Weather Updates',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 190, 16, 225),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 190, 16, 225),
              Color.fromARGB(255, 100, 136, 212)
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Visibility(
                    visible: !isClicked,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isClicked = true;
                          });
                        },
                        child: const Text('Load Data'),
                      ),
                    )),
                Visibility(
                  visible: isClicked,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        // height: 300,
                        child: Card(
                          color: ColorConstant.primary,
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Colors.white),
                                      Text(weather.location?.name ?? '',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white))
                                    ],
                                  ),
                                  Center(
                                    child: Image(
                                      image: NetworkImage(
                                          'http:${weather.current?.condition.icon ?? ''}'),
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '${weather.current?.temp_c ?? '0'}*C',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        weather.current?.condition.text ?? '',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        textAlign: TextAlign.right),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            const Image(
                                                height: 50,
                                                width: 50,
                                                image: AssetImage(
                                                    'assets/images/wind.png')),
                                            Text(
                                              '${weather.current?.wind_kph ?? '0'} km/h',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Image(
                                                height: 50,
                                                width: 50,
                                                image: AssetImage(
                                                    'assets/images/humidity.png')),
                                            Text(
                                              '${weather.current?.humidity ?? '0'}%',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Image(
                                                height: 50,
                                                width: 50,
                                                image: AssetImage(
                                                    'assets/images/cloud.png')),
                                            Text(
                                              '${weather.current?.cloud ?? '0'}%',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: weather.forecast?.forecastday.length ?? 0,
                          itemBuilder: (context, index) {
                            final ForecastdayModel? forecast =
                                weather.forecast?.forecastday[index];

                            return Card(
                                color: ColorConstant.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          DateFormat('EEEE')
                                              .format(forecast!.date),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage((forecast
                                                      .day.condition.icon !=
                                                  null)
                                              ? 'http:${forecast.day.condition.icon}'
                                              : ''),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          weather.current?.condition.text ?? '',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        '${forecast?.day.avgtemp_c} *C',
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ));
                          })
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
