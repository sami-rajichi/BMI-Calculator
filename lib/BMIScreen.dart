// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:bmi_calculator/BMIResultScreen.dart';
import 'package:bmi_calculator/navigationBar.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}


class _BMIScreenState extends State<BMIScreen> {

  double _heightValue = 120;
  double _weightValue = 60;
  int _age = 28;
  bool isMale = true;
  Color? _color;
  String category = 'Normal';
  String? tips;
  String? moreTips;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0b0f1f),
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.yellow[800] : Color(0xff1b1a2e),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/male.png'),
                              height: 105,
                              width: 105,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){setState(() {
                        isMale = false;
                      });},
                      child: Container(
                        decoration: BoxDecoration(
                            color: isMale ? Color(0xff1b1a2e) : Colors.yellow[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/female.png'),
                              height: 105,
                              width: 105,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1b1a2e)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _heightValue.round().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Slider(
                      activeColor: Colors.yellow[800],
                      thumbColor: Colors.amber[300],
                      min: 50,
                      max: 220,
                      value: _heightValue,
                      onChanged: (value) => setState(() {
                        _heightValue = value;
                      })
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1b1a2e),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            _weightValue.round().toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                _weightValue--;
                              });
                            },
                            backgroundColor: Colors.yellow[800],
                            child: Icon(Icons.remove),
                            mini: true,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                _weightValue++;
                              });
                            },
                            backgroundColor: Colors.yellow[800],
                            child: Icon(Icons.add),
                            mini: true,
                          ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1b1a2e),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            _age.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                _age--;
                              });
                            },
                            backgroundColor: Colors.yellow[800],
                            child: Icon(Icons.remove),
                            mini: true,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                _age++;
                              });
                            },
                            backgroundColor: Colors.yellow[800],
                            child: Icon(Icons.add),
                            mini: true,
                          ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow[800]
            ),
            child: MaterialButton(
              onPressed: (){
                double bmi = calculateBMI(_weightValue, _heightValue);
                correspondingColor(bmi);
                print(bmi.round());
                // Navigator.pushReplacementNamed(
                //   context, 
                //   '/result',
                //   arguments: {
                //     'bmi': bmi,
                //     'color': _color,
                //     'category': category
                //   }
                // );
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => BMIResult(
                      color: _color!,
                      category: category,
                      bmi: bmi,)));
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),

              ),
          ),
        ],
      ),
      backgroundColor: Color(0xff0b0f1f),
      drawer: NavBar(),
    );
  }

  calculateBMI(double weight, double height){
    return weight / pow(height / 100, 2);
  }

  correspondingColor(double bmi){
    if(bmi < 15.9){
      setState(() {
        _color = Color(0xffbc2020);
        category = 'Sevre Thinness';
      });
    }
    else if(bmi >= 16 && bmi < 16.9){
      setState(() {
        _color = Colors.red[600];
        category = 'Moderte Thinness';
      });
    }
    else if(bmi >= 17 && bmi < 18.4){
      setState(() {
        _color = Color(0xffd38888);
        category = 'Mild Thinness';
      });
    }
    else if(bmi >= 18.5 && bmi < 24.9){
      setState(() {
        _color = Colors.green[700];
        category = 'Normal';
      });
    }
    else if(bmi >= 25 && bmi < 29.9){
      setState(() {
        _color = Colors.yellow[600];
        category = 'Overweight';
      });
    }
    else if(bmi >= 30 && bmi < 34.9){
      setState(() {
        _color = Color(0xffd38888);
        category = 'Obese Class I';
      });
    }
    else if(bmi >= 35 && bmi < 39.9){
      setState(() {
        _color = Colors.red[600];
        category = 'Obese Class II';
      });
    }
    else {
      setState(() {
        _color = Color(0xffbc2020);
        category = 'Obese Class III';
      });
    }
  }

}
