import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lecture_one/camera_screen.dart';
import 'package:sensors_plus/sensors_plus.dart';

// ignore: camel_case_types
enum eLanguage { en, es }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String shortLang = 'en';
  eLanguage? _language = eLanguage.en;

  static const Duration _ignoreDuration = Duration(milliseconds: 20);

  UserAccelerometerEvent? _userAccelerometerEvent;
  AccelerometerEvent? _accelerometerEvent;
  GyroscopeEvent? _gyroscopeEvent;
  MagnetometerEvent? _magnetometerEvent;

  DateTime? _userAccelerometerUpdateTime;
  DateTime? _gyroscopeUpdateTime;
  DateTime? _magnetometerUpdateTime;

  int? _userAccelerometerLastInterval;
  int? _gyroscopeLastInterval;
  int? _magnetometerLastInterval;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  Duration sensorInterval = SensorInterval.normalInterval;

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();

    _streamSubscriptions.add(
      userAccelerometerEventStream(samplingPeriod: sensorInterval).listen(
        (UserAccelerometerEvent event) {
          final now = DateTime.now();
          setState(() {
            _userAccelerometerEvent = event;
            if (_userAccelerometerUpdateTime != null) {
              final interval = now.difference(_userAccelerometerUpdateTime!);
              if (interval > _ignoreDuration) {
                _userAccelerometerLastInterval = interval.inMilliseconds;
              }
            }
          });
          _userAccelerometerUpdateTime = now;
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context)!.sensorNotFound),
                  content: Text(AppLocalizations.of(context)!.sensorError),
                );
              });
        },
        cancelOnError: true,
      ),
    );
    _streamSubscriptions.add(
      gyroscopeEventStream(samplingPeriod: sensorInterval).listen(
        (GyroscopeEvent event) {
          final now = DateTime.now();
          setState(() {
            _gyroscopeEvent = event;
            if (_gyroscopeUpdateTime != null) {
              final interval = now.difference(_gyroscopeUpdateTime!);
              if (interval > _ignoreDuration) {
                _gyroscopeLastInterval = interval.inMilliseconds;
              }
            }
          });
          _gyroscopeUpdateTime = now;
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context)!.sensorNotFound),
                  content: Text(AppLocalizations.of(context)!.sensorError),
                );
              });
        },
        cancelOnError: true,
      ),
    );
    _streamSubscriptions.add(
      magnetometerEventStream(samplingPeriod: sensorInterval).listen(
        (MagnetometerEvent event) {
          final now = DateTime.now();
          setState(() {
            _magnetometerEvent = event;
            if (_magnetometerUpdateTime != null) {
              final interval = now.difference(_magnetometerUpdateTime!);
              if (interval > _ignoreDuration) {
                _magnetometerLastInterval = interval.inMilliseconds;
              }
            }
          });
          _magnetometerUpdateTime = now;
        },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context)!.sensorNotFound),
                  content: Text(AppLocalizations.of(context)!.sensorError),
                );
              });
        },
        cancelOnError: true,
      ),
    );
  }

  onCheckboxSelect(eLanguage? language) {
    setState(() {
      _language = language;
    });

    setState(() {
      shortLang = language == eLanguage.en ? 'en' : 'es';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 220, 235),
      body: Container(
          child: Localizations.override(
        context: context,
        locale: Locale(shortLang),
        child: Builder(builder: (context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.selectLanguage,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio<eLanguage>(
                                value: eLanguage.en,
                                groupValue: _language,
                                onChanged: (eLanguage? value) {
                                  onCheckboxSelect(value);
                                },
                              ),
                              const Text('English')
                            ],
                          ),
                          Row(
                            children: [
                              Radio<eLanguage>(
                                value: eLanguage.es,
                                groupValue: _language,
                                onChanged: (eLanguage? value) {
                                  onCheckboxSelect(value);
                                },
                              ),
                              const Text('Spanish')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(AppLocalizations.of(context)!.camera),
                GestureDetector(
                  child: const Icon(
                    Icons.camera,
                    size: 30,
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(4),
                      4: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                AppLocalizations.of(context)!.accelerometer),
                          ),
                          Text(
                              '${_userAccelerometerLastInterval?.toString() ?? '?'} ms'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child:
                                Text(AppLocalizations.of(context)!.gyroscope),
                          ),
                          Text(
                              '${_gyroscopeLastInterval?.toString() ?? '?'} ms'),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                AppLocalizations.of(context)!.magnetometer),
                          ),
                          Text(
                              '${_magnetometerLastInterval?.toString() ?? '?'} ms'),
                        ],
                      ),
                    ],
                  ),
                ),
              ]);
        }),
      )),
    );
  }
}
