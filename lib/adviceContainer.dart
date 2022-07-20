import 'package:flutter/material.dart';

class AdviceContainer extends StatefulWidget {
  final String tips;
  final Color color;
  AdviceContainer({Key? key, required this.tips, required this.color})
      : super(key: key);

  @override
  State<AdviceContainer> createState() => _AdviceContainerState();
}

class _AdviceContainerState extends State<AdviceContainer>
with SingleTickerProviderStateMixin {
  
  AnimationController? _controller;
  Animation? _text;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, duration: Duration(seconds: 4)
    );
    _text = Tween(begin: 0.4, end: 400.0).animate(
      CurvedAnimation(parent: _controller!, 
      curve: Interval(0.0, 0.95, curve: Curves.ease)));
      _controller?.forward();
      _controller?.addListener(() {setState(() {
        
      });});
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 20.0),
      child: Container(
        // height: 100,
        width: _text?.value,
        decoration: BoxDecoration(
          color: Color(0xff1b1a2e),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: 'Advice: ',
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.tips,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
