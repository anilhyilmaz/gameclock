import 'package:flutter/material.dart';
import 'TimerPage.dart';
import 'package:gameclock/main.dart';
import 'package:time_picker_widget/main.dart';

class AbsoluteTime extends StatefulWidget {
  const AbsoluteTime({Key? key}) : super(key: key);

  @override
  _AbsoluteTimeState createState() => _AbsoluteTimeState();
}

class _AbsoluteTimeState extends State<AbsoluteTime> {
  final List<String> listdegiskenler = <String>["Absolute","Byo-Yomi","Canadian","aaa","bbb"];
  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> get TimeLimit {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("5 min"), value: listdegiskenler[0]),
      DropdownMenuItem(child: Text("10 min"), value: listdegiskenler[1]),
      DropdownMenuItem(child: Text("15 min"), value: listdegiskenler[2]),
      DropdownMenuItem(child: Text("30 min"), value: listdegiskenler[3]),
      DropdownMenuItem(child: Text("45 min"), value: listdegiskenler[4]),
    ];
    return menuItems;
  }

  String selectedValue = "Absolute";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                items: TimeLimit),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              child: Text('Start'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                print("Absolute Start");
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
