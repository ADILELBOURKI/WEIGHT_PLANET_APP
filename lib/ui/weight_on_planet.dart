import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          break;
        case 1 : 
          _finalResult = calculateWeight(_weightController.text, 2.34);
          break;
        case 2 : 
        _finalResult = calculateWeight(_weightController.text, 0.38);
       
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset('images/105 planet.png',
                height: 133.0, width: 200.0),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'your weight on earth',
                        hintText: 'in pounds',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "pluto",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      new Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "jupyter",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      new Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "mars",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: new EdgeInsets.all(15.6),
                  ),
                  new Text(
                    "Your weight is $_finalResult",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double p) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * p;
    }
  }
}
