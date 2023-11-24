import 'package:flutter/material.dart';
import 'package:lecture_one/cache/cache.provider.dart';
import 'package:lecture_one/database/product.provider.dart';
import 'package:lecture_one/home.dart';
import 'package:lecture_one/preference/preference.provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => SharedPreferencesProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CacheProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<SharedPreferencesProvider>(context).isDarkModeEnabled
          ? ThemeData.dark()
          : ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}
