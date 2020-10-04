import 'package:example/src/FancyRadio/FancyRadio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FancyRadio(
            label: ['One','Two','Three','Four'],
            labelValue: ['1','2','3','4'],
            activeColor: Colors.blue,
            activeBorderColor: Colors.blue,
            onChanged: (val){
              selectedValue=val;
            },
          )
        ],
      ),
    );
  }
}

