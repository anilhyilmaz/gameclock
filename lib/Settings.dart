import 'package:flutter/material.dart';
import 'AbsoluteTime.dart';
import 'Byo-Yomi.dart';
import 'TimeClass.dart';
import 'Canadian.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  final myController = TextEditingController();
  List<DropdownMenuItem<String>> get TimeType {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Absolute"), value: "Absolute"),
      //DropdownMenuItem(child: Text("Byo-Yomi"), value: "Byo-Yomi"),
      // DropdownMenuItem(child: Text("Canadian"), value: "Canadian"),
    ];
    return menuItems;
  }

  String selectedValue = "Absolute";
  Widget degisecekSayfadegiskeni = AbsoluteTime();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting of Time System'),
        ),
        body: Column(
          children: [
            SizedBox(height: 25,),
            Text('Time System'),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                        print(selectedValue);
                        degisecekSayfa();
                      });
                    },
                    items: TimeType),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 8,
              child: Center(
                  child: Container(
                alignment: Alignment.center,
                child: degisecekSayfadegiskeni,
              )),
            ),
          ],
        ));
  }

  void degisecekSayfa() {
    setState(() {
      if (selectedValue == "Absolute") {
        degisecekSayfadegiskeni = AbsoluteTime();
      }
      // else if (selectedValue == "Byo-Yomi") {
      //   degisecekSayfadegiskeni = ByoYomi();
      // }
      //else {
      //   degisecekSayfadegiskeni = Canadian();
      // }
    });
  }
}
