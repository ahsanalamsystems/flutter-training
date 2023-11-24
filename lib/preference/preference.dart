import 'package:flutter/material.dart';
import 'package:lecture_one/constant/data.contant.dart';
import 'package:lecture_one/constant/preferences.model.dart';
import 'package:lecture_one/preference/preference.provider.dart';
import 'package:provider/provider.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferencesProvider =
        Provider.of<SharedPreferencesProvider>(context);
    TextEditingController textController = TextEditingController();
    textController.text = sharedPreferencesProvider.userName;
    return Scaffold(
      appBar: AppBar(title: const Text('User Preference')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Theme'),
                Switch(
                  value: sharedPreferencesProvider.isDarkModeEnabled,
                  onChanged: (value) {
                    sharedPreferencesProvider.toggleDarkMode();
                  },
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(label: Text('Username')),
              controller: textController,
              onChanged: (value) {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  sharedPreferencesProvider.saveUserData(textController.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
