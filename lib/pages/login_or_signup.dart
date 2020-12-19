import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'signup.dart';
// import '../home/home.dart';
// import '../widgets/button_widget.dart';
// import '../widgets/textfield_widget.dart';
// import '../widgets/wave_widget.dart';
//import '../widgets/fade_animation.dart';
import '../widgets/uni_navbar.dart';

class LoginOrSignup extends StatefulWidget {
  @override
  _LoginOrSignupState createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UniNavbar()
        )
    ));
    super.initState();
  }
  // AnimationController _scaleController;
  // Animation<double> _scaleAnimation;
  //
  // bool hide = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _scaleController = AnimationController(
  //       vsync: this,
  //       duration: Duration(milliseconds: 300)
  //   );
  //
  //   _scaleAnimation = Tween<double>(
  //       begin: 1.0,
  //       end: 30.0
  //   ).animate(_scaleController)..addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       Navigator.push(context, PageTransition(
  //           child: Home(),
  //           type: PageTransitionType.fade
  //       ));
  //       Future.delayed(Duration(seconds: 1)).then((value) {
  //         _scaleController.reset();
  //         setState(() => hide = false);
  //       });
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _scaleController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          // backgroundColor: Colors.white,
          // body: GestureDetector(
          //   child: Stack(
          //     children: <Widget>[
          //       Container(
          //         height: size.height - 200,
          //         color: Color.fromARGB(255, 102, 18, 222),
          //       ),
          //       AnimatedPositioned(
          //         duration: Duration(milliseconds: 500),
          //         curve: Curves.easeOutQuad,
          //         top: keyboardOpen ? -size.height / 3.7 : 0.0,
          //         child: WaveWidget(
          //             size: size,
          //             yOffset: size.height / 3.0,
          //             color: Colors.white
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 100.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             FadeAnimation(
          //               0.25,
          //               Text(
          //                 'Войти',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 30.0,
          //                   fontWeight: FontWeight.w900,
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(30.0),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: <Widget>[
          //             FadeAnimation(
          //               0.5,
          //               TextFieldWidget(
          //                 hintText: 'Email',
          //                 obscureText: false,
          //                 prefixIconData: Icons.mail_outline,
          //                 // suffixIconData: model.isValid ? Icons.check : null,
          //                 // onChanged: (value) {
          //                 //   model.isValidEmail(value);
          //                 // },
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10.0,
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: <Widget>[
          //                 FadeAnimation(
          //                   0.75,
          //                   TextFieldWidget(
          //                     hintText: 'Пароль',
          //                     obscureText: false,
          //                     prefixIconData: Icons.lock_outline,
          //                     // suffixIconData: model.isVisible
          //                     //     ? Icons.visibility
          //                     //     : Icons.visibility_off,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10.0,
          //                 ),
          //                 FadeAnimation(
          //                   1,
          //                   Text(
          //                     'Забыли пароль?',
          //                     style: TextStyle(
          //                       color: Color.fromARGB(255, 102, 18, 222),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //               height: 20.0,
          //             ),
          //             FadeAnimation(
          //                 1.25,
          //                 AnimatedBuilder(
          //                     animation: _scaleController,
          //                     builder: (context, child) =>
          //                         Transform.scale(
          //                           scale: _scaleAnimation.value,
          //                           child: ButtonWidget(
          //                               title: hide ? "" : 'Войти',
          //                               hasBorder: false,
          //                               onPress: () {
          //                                 setState(() => hide = true);
          //                                 _scaleController.forward();
          //                               }
          //                           ),
          //                         )
          //                 )
          //             ),
          //             SizedBox(
          //               height: 10.0,
          //             ),
          //             FadeAnimation(
          //                 1.5,
          //                 GestureDetector(
          //                   onTap: () {
          //                     Navigator.pop(context);
          //                     Navigator.push(
          //                         context,
          //                         MaterialPageRoute(builder: (context) => Signup())
          //                     );
          //                   },
          //                   child: Text(
          //                     'Нет аккаунта? Зарегистрируйтесь',
          //                     style: TextStyle(
          //                       color: Color.fromARGB(255, 102, 18, 222),
          //                     ),
          //                   ),
          //                 )
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
      ),
    );
  }
}