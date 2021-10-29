import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'Settings.dart';
import 'TimeClass.dart';

class TimerPage extends StatefulWidget {
  final String? myvariable;
  const TimerPage({Key? key,required this.myvariable}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTime();
  }
  final CountdownController _controller1 =
  new CountdownController(autoStart: false);
  final CountdownController _controller2 =
  new CountdownController(autoStart: false);
  var calisan_controller;
  var sure;
  int TimerTime = 20;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: RotatedBox(
                quarterTurns: -2,
                child: GestureDetector(
                  onTap: () {
                    _controller1.pause();
                    _controller2.resume();
                    print('tıklandı1');
                    calisan_controller = _controller2;
                    //-------------------------------------------------------
                  },
                  child: Countdown(
                    controller: _controller1,
                    seconds: TimerTime,
                    build: (BuildContext context, double time) => Text(
                      time.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    interval: Duration(milliseconds: 100),
                    onFinished: () {
                      print('Timer is done!');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Alert!!"),
                            content: new Text("Timer is done"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Pause'),
                  onPressed: () {
                    _controller1.pause();
                    _controller2.pause();
                    print('pause');
                  },
                ),
                ElevatedButton(
                  child: Text('Resume'),
                  onPressed: () {
                    if(calisan_controller == _controller1){
                      _controller1.resume();
                    }
                    else{
                      _controller2.resume();
                    }
                    print('resume');
                  },
                ),
                ElevatedButton(
                  child: Text('Restart'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget));
                    print('restart');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: GestureDetector(
                onTap: () {
                  _controller2.pause();
                  _controller1.resume();
                  print('tıklandı2');
                  calisan_controller = _controller1;
                },
                child: Countdown(
                  controller: _controller2,
                  seconds: TimerTime,
                  build: (BuildContext context, double time) => Text(
                    time.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  interval: Duration(milliseconds: 100),
                  onFinished: () {
                    print('Timer is done!');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Alert!!"),
                          content: new Text("Timer is done"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Flexible(child: ListTile(title: Text('Settings'),leading: Icon(Icons.settings),onTap: (){
                print("settings");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );

              },)),
              Flexible(child: ListTile(title: Text('Quit'),leading: Icon(Icons.cancel),onTap: (){
                exit(0);
              },)),
            ],
          ),
        ),
      ),
    );
  }
  void updateTime(){
    print("Update Time:  ${widget.myvariable}");
    if(widget.myvariable != null && widget.myvariable == "Absolute"){
      print("5");
      TimerTime = 300;
    }
    if(widget.myvariable != null && widget.myvariable == "Byo-Yomi"){
      print("10");
      TimerTime = 600;
    }
    if(widget.myvariable != null && widget.myvariable == "Canadian"){
      print("15");
      TimerTime = 900;
    }
    if(widget.myvariable != null && widget.myvariable == "aaa"){
      print("30");
      TimerTime = 1800;
    }
    if(widget.myvariable != null && widget.myvariable == "bbb"){
      print("45");
      TimerTime = 2700;
    }

    // ----------------------------------------------------------------

    if(widget.myvariable != null && widget.myvariable == "Absolute2"){
      print("5");
      TimerTime = 300;
    }
    if(widget.myvariable != null && widget.myvariable == "Byo-Yomi2"){
      print("10");
      TimerTime = 600;
    }
    if(widget.myvariable != null && widget.myvariable == "Canadian2"){
      print("15");
      TimerTime = 900;
    }
    if(widget.myvariable != null && widget.myvariable == "aaa2"){
      print("30");
      TimerTime = 1800;
    }
    if(widget.myvariable != null && widget.myvariable == "bbb2"){
      print("45");
      TimerTime = 2700;
    }
  }
}