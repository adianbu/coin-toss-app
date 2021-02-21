import 'package:flutter/material.dart';
import 'dart:math';

class Coin extends StatefulWidget {
  const Coin({Key key, this.clientName}) : super(key: key);

  final String clientName;
  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  int randomNumber;
 
  _CoinState() {
    Random rng = new Random();
    randomNumber = rng.nextInt(2);
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.clientName;
    print(name);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Text(
                  "HEADS",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 90,                     
                      color: (name=="Normal"||name==null)?(randomNumber == 1 ? Colors.black : Colors.grey[300]):(name=="Heads"?Colors.black : Colors.grey[300])
                          ),

                )),
                Container(
                  child: Image(
                    image: AssetImage(
                        'assets/${name=="Normal"||name==null?(randomNumber == 1 ? 'heads.png' : 'tails.png'):(name=="Heads"?'heads.png' : 'tails.png')}'),
                  ),
                ),
                Center(
                    child: Text(
                  'TAILS',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 90,
                      color: (name=="Normal"||name==null)?(randomNumber == 0 ? Colors.black : Colors.grey[300]):(name=="Tails"?Colors.black : Colors.grey[300])                          ),
                )),
                SizedBox(
                  height: 10,
                )
              ]),
        ),
      ),
    );
  }
}
