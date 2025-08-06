import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PredictionResult extends StatelessWidget {


  const PredictionResult({
    required this.text,
    super.key
  });

  final String text;


  @override
  Widget build(BuildContext context){
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: 32.0, 
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}