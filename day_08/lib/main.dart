import 'package:day_08/preferences_service.dart';
import 'package:flutter/material.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final preferencesService = PreferencesService();
  final userNameController = TextEditingController();
  var selectedGender = Gender.female;
  var selectedLanguages = <ProgrammingLanguage>{};  //This is a set Set<ProgrammingLanguage>(); but syntactic sugar reduced it
  var isEmployed = false;

  @override
  void initState() {
    super.initState();
    populateFields();
  }

  void populateFields() async {
    final settings = await preferencesService.getSettings();
    setState(() {
      userNameController.text = settings.username;
      selectedGender = settings.gender;
      selectedLanguages = settings.programmingLanguages;
      isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Settings"),
        ),
          body: ListView(
            children: [
              ListTile(
                title: TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
              ),
              radioTile("Female", Gender.female),
              radioTile("Male", Gender.male),
              radioTile("Other", Gender.other),
              checkboxTile("JavaScript", ProgrammingLanguage.javascript),
              checkboxTile("Dart", ProgrammingLanguage.dart),
              checkboxTile("Kotlin", ProgrammingLanguage.kotlin),
              checkboxTile("Swift", ProgrammingLanguage.swift),
              SwitchListTile(
                  title: const Text('Is Employed'),
                  value: isEmployed,
                  onChanged: (newValue) =>
                      setState(() => isEmployed = newValue)),
              TextButton(onPressed: saveSettings, child: const Text('Save Settings'))
            ],
          ),
      ),
    );
  }

  Widget radioTile(String title, Gender gender) {
    return RadioListTile(
        title: Text(title),
        value: gender,
        groupValue: selectedGender,
        onChanged: (newValue) =>
            setState(() => selectedGender = newValue!)
    );
  }

  Widget checkboxTile(String title, ProgrammingLanguage language) {
    return CheckboxListTile(
        title: Text(title),
        value: selectedLanguages.contains(language),
        onChanged: (_) {
          setState(() {
            selectedLanguages.contains(language)
                ? selectedLanguages.remove(language)
                : selectedLanguages.add(language);
          });
        }
    );
  }

  void saveSettings() {
    final newSettings = Settings(
        username: userNameController.text,
        gender: selectedGender,
        programmingLanguages: selectedLanguages,
        isEmployed: isEmployed
    );
    
    preferencesService.saveSettings(newSettings);
  }
}
