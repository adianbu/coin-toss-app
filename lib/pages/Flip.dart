import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:coin_toss_app/pages/Home.dart';
import 'package:flutter/material.dart';

class Flip extends StatefulWidget {
    const Flip({Key key, this.repeat}) : super(key: key);

  final String repeat;
  @override
  _FlipState createState() => _FlipState();
}

class _FlipState extends State<Flip> {
  String _imageAsset = "heads.png";
  var oneSec = const Duration(milliseconds: 50);

  //for running flip animation
  bool run = true;

  int numberOfFlips = 5;

  AudioCache audioCache = AudioCache();

  _FlipState() {
    audioCache.play('coinflip1.mp3');

    Timer flip = Timer.periodic(oneSec, (Timer t) {
      // print('hi!');
      if (_imageAsset == "heads.png") {
        setState(() {
          _imageAsset = "tailsmini.png";
        });
      } else {
        setState(() {
          _imageAsset = "heads.png";
        });
      }
    });
    Timer(Duration(milliseconds: 2100), () {
     
      flip.cancel();
      setState(() {
        run = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/$_imageAsset');
    Image image = Image(
      image: assetImage,
    );
    if (run)
      return Scaffold(
        body: Center(
            child: Container(
          child: image,
        )),
      );
    else {
      return Home(repeat: widget.repeat);
    }
  }
}
