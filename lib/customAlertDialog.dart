import 'package:bmi_calculator/BMIScreen.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String description;

  CustomDialog({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) => Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 100, bottom: 16, right: 16, left: 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Color(0xff0b0f1f),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0.0, 10))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.yellow[800],
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => BMIScreen()));
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => BMIScreen()));
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              child: ClipRRect(
                child: Image.asset('assets/bmi.png'),
                borderRadius: BorderRadius.circular(50),
              ),
            )
          )
        ],
      );
}
