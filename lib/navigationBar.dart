import 'package:bmi_calculator/BMIScreen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff0b0f1f),
      elevation: 6,
      child: Column(
        children: [
          buildNavigationHeader(context),
          buildNavigationItems(context)
        ],
      ),
    );
  }

  buildNavigationHeader(BuildContext context) => Container(
    color: Colors.yellow[800],
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    margin: EdgeInsets.only(bottom: 12),
    width: double.infinity,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image(
            image: AssetImage('assets/body-mass-index.png'),
            height: 150,
          ),
        )
        
      ],
    ),
  );

  buildNavigationItems(BuildContext context) => Wrap(
    runSpacing: 16,
    children: [
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text('Home'),
        textColor: Colors.white,
        iconColor: Colors.white,
        onTap: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BMIScreen()));
        },
      ),
      ListTile(
        leading: Icon(Icons.history_outlined),
        title: Text('History'),
        textColor: Colors.white,
        iconColor: Colors.white,
        onTap: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BMIScreen()));
        },
      ),
      ListTile(
        leading: Icon(Icons.update_outlined),
        title: Text('Updates'),
        textColor: Colors.white,
        iconColor: Colors.white,
        onTap: (){},
      ),
      Divider(color: Colors.white,),
      Row(
        children: [
          SizedBox(
            width: 24,
          ),
          Text(
            'Copyright ',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          Icon(Icons.copyright_outlined, color: Colors.white,),
          Text(
            ' 2022',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ],
      )
    ],
  );
}