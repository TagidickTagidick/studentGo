import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_or_signup.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';

class Landing extends StatefulWidget {

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )
      ..repeat();
    Future.delayed(Duration(seconds: 5)).then((value) =>
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginOrSignup()
            )
        )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff536DFE),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                UniWave(
                  size: size,
                  yOffset: size.height / 2.0,
                  color: Colors.white,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 6,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      FadeAnimation(
                        0.25,
                        Image.asset(
                          'images/your_uni.png',
                        ),
                      ),
                      FadeAnimation(
                          0.5,
                          Text(
                            "Твой вуз",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      FadeAnimation(
                          0.75,
                          Text(
                            "Твой вуз - в твоёем кармане",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: FadeAnimation(
                        1,
                        SvgPicture.asset(
                            "images/landing.svg",
                          height: 300,
                        )
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}