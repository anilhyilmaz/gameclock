import 'package:flutter/material.dart';

import 'TimerPage.dart';

class ByoYomi extends StatefulWidget {
  const ByoYomi({Key? key}) : super(key: key);

  @override
  _ByoYomiState createState() => _ByoYomiState();
}

class _ByoYomiState extends State<ByoYomi> {

  final List<String> listdegiskenler = <String>["Absolute2","Byo-Yomi2","Canadian2","aaa2","bbb2"];
  // final List<String> listextradegiskenler = <String>["Absolute","Byo-Yomi","Canadian","aaa","bbb"];

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> get ByoYomiTime {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("5 min x 10sn"), value: listdegiskenler[0]),
      DropdownMenuItem(child: Text("10 min x 20sn"), value: listdegiskenler[1]),
      DropdownMenuItem(child: Text("15 min x 25sn"), value: listdegiskenler[2]),
      DropdownMenuItem(child: Text("30 min x 30sn"), value: listdegiskenler[3]),
      DropdownMenuItem(child: Text("45 min x 45sn"), value: listdegiskenler[4]),
    ];
    return menuItems;
  }

  String selectedValue = "Absolute2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Byo-Yomi"),
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
                    print(selectedValue);
                  });
                },
                items: ByoYomiTime),
          ),
          SizedBox(
            height: 25,
          ),
          //Button
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              child: Text('Start'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                print("Byo-Yomi Start");
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
