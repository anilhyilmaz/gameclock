import 'package:flutter/material.dart';

import 'TimerPage.dart';

class Canadian extends StatefulWidget {
  const Canadian({Key? key}) : super(key: key);

  @override
  _CanadianState createState() => _CanadianState();
}

class _CanadianState extends State<Canadian> {
  List<DropdownMenuItem<String>> get TimeType {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Absolute"), value: "Absolute"),
      DropdownMenuItem(child: Text("Byo-Yomi"), value: "Byo-Yomi"),
      DropdownMenuItem(child: Text("Canadian"), value: "Canadian"),
    ];
    return menuItems;
  }

  String selectedValue = "Absolute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Canadian"),
          Text('Main Time'),
          Padding(
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
                  });
                },
                items: TimeType),
          ),
          SizedBox(
            height: 25,
          ),
          Text('Ex Time'),
          Padding(
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
                  });
                },
                items: TimeType),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              child: Text('Start'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                print("Canadian Start");
                print(selectedValue);
                Navigator
                    .of(context)
                    .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => TimerPage(myvariable : selectedValue)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
