import 'package:bmi_calculator/adviceContainer.dart';
import 'package:bmi_calculator/customAlertDialog.dart';
import 'package:bmi_calculator/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIResult extends StatefulWidget {

  final Color color;
  final String category;
  final double bmi;
  BMIResult({
    required this.color,
    required this.category,
    required this.bmi
  });
  @override
  State<BMIResult> createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {

  Map? data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color(0xff0b0f1f),
        title: Text('BMI Result'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Your',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[800]),
                ),
              ),
              Text(
                'Result',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(12),
                ),
                depth: 5,
                lightSource: LightSource.topLeft,
                color: Color(0xFFf6f9fe),
              ),
              child: SfRadialGauge(
                title: GaugeTitle(
                    text: widget.category,
                    textStyle:
                        TextStyle(
                          fontSize: 25.0, 
                          fontWeight: FontWeight.bold,
                          color: widget.color
                        )
                      ),
                enableLoadingAnimation: true,
                animationDuration: 3500,
                axes: <RadialAxis>[
                  RadialAxis(minimum: 0, maximum: 45, pointers: <GaugePointer>[
                    NeedlePointer(value: widget.bmi, 
                    enableAnimation: true,
                    animationType: AnimationType.ease,)
                  ], ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0, endValue: 15.9, color: Color(0xffbc2020)),
                    GaugeRange(
                        startValue: 16, endValue: 16.9, color: Colors.red[600]),
                    GaugeRange(
                        startValue: 17, endValue: 18.4, color: Color(0xffd38888)),
                    GaugeRange(
                        startValue: 18.5, endValue: 24.9, color: Colors.green[700]),
                    GaugeRange(
                        startValue: 25, endValue: 29.9, color: Colors.yellow[600]
                    ),
                    GaugeRange(
                        startValue: 30, endValue: 34.9, color: Color(0xffd38888)
                    ),
                    GaugeRange(
                        startValue: 35, endValue: 39.9, color: Colors.red[600]
                    ),
                    GaugeRange(
                        startValue: 40, endValue: 45, color: Color(0xffbc2020)
                    ),
                  ], annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                          "BMI = ${widget.bmi.toString().substring(0, widget.bmi.toString().indexOf(('.')) + 2)}",
                          style: TextStyle(
                              fontSize: 20.0, 
                              fontWeight: FontWeight.bold),
                        ),
                        positionFactor: 0.5,
                        angle: 90)
                  ])
                ],
              ),
            ),
          ),
          Expanded(child: pickAdvice(widget.category),),
          
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                showDialog(context: context, builder: (context) => CustomDialog(
                title: 'BMI Calculator', 
                description: 'Would You Like To Save This Result ?'));
              },
              color: Colors.yellow[800],
              child: Text(
                'RE-CALCULATE YOUR BMI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              ),
            ),
          )
        ],
      ),
      
      backgroundColor: Color(0xff0b0f1f),
    );
  }

  pickAdvice(String category){
    List<String> tips = [
      'You may be underweight due to genetics, improper metabolism of nutrients, lack of food, medicines that affect appetite, illness (physical or mental) or the eating disorder.',
      'Great Job! You are hitting an exciting milestone.. Keep up the great work.',
      'You are overweight and you are hitting a critical step towards obesity, try to choose a healthy combination of diet and exercises.',
      'Obesity is generally caused by eating too much and moving too little. It may also be a result of genetics, medications, psychological factors or even diseases such as hypothyroidism, insulin resistance, polycystic ovary syndrome, and Cushing\'s syndrome '
    ];
    switch (category){
      case 'Sevre Thinness':
        return AdviceContainer(tips: tips[0], color: Color(0xffbc2020)); break;
      case 'Moderte Thinness':
        return AdviceContainer(tips: tips[0], color: Colors.red[600]!); break;
      case 'Mild Thinness':
        return AdviceContainer(tips: tips[0], color: Color(0xffd38888)); break;
      case 'Normal':
        return AdviceContainer(tips: tips[1], color: Colors.green[700]!); break;
      case 'Overweight':
        return AdviceContainer(tips: tips[2], color: Colors.yellow[600]!); break;
      case 'Obese Class I':
        return AdviceContainer(tips: tips[3], color: Color(0xffd38888)); break;
      case 'Obese Class II':
        return AdviceContainer(tips: tips[3], color: Colors.red[600]!); break;
      case 'Obese Class III':
        return AdviceContainer(tips: tips[3], color: Color(0xffbc2020)); break;
    }
  }
}
