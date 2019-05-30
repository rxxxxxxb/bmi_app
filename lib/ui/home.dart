import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Healthy";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });


    String _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/logo.png',
              height: 180,
              width: 150,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 250.0,
              width: 280.0,
              color: Colors.grey.shade400,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g: 24',
                        icon: new Icon(Icons.people_outline)),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in Feet',
                        hintText: 'e.g: 5.8',
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in pounds',
                        hintText: 'e.g: 200',
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: _calculateBMI,
                      color: Colors.green,
                      child: new Text('Calcuate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            new Padding(padding: new EdgeInsets.all(10.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Your BMI: $_finalResult",
                    style: new TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 20)),
                new Padding(
                  padding: const EdgeInsets.all(5),
                ),
                new Text("$_resultReading ",
                    style: new TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 20)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
