import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../widgets/profile_list_item.dart';
import '../constants.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';
import 'dashboard.dart';
import 'level.dart';
import 'example_page.dart';

class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return Scaffold(
        backgroundColor: Color(0xff0a2896),
      body: Stack(
        children: [
          UniWave(
            size: size,
            yOffset: size.height / 2.0,
            color: Colors.white,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: kSpacingUnit.w * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: kSpacingUnit.w * 3),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: kSpacingUnit.w * 10,
                          width: kSpacingUnit.w * 10,
                          margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                          child: Stack(
                            children: <Widget>[
                              FadeAnimation(
                                0.1,
                                CircleAvatar(
                                  radius: kSpacingUnit.w * 5,
                                  backgroundImage: AssetImage('images/avatar.jpg'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: FadeAnimation(
                                  0.2,
                                  Container(
                                    height: kSpacingUnit.w * 2.5,
                                    width: kSpacingUnit.w * 2.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xff03a9fd),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      heightFactor: kSpacingUnit.w * 1.5,
                                      widthFactor: kSpacingUnit.w * 1.5,
                                      child: Icon(
                                        LineAwesomeIcons.pen,
                                        color: kDarkPrimaryColor,
                                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                                      ),
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: kSpacingUnit.w * 2),
                        FadeAnimation(
                          0.3,
                          Text(
                            'Ирина Смирнова',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: kSpacingUnit.w * 0.5),
                        FadeAnimation(
                          0.4,
                          Text(
                            'Студент',
                            style: kCaptionTextStyle,
                          ),
                        ),
                        SizedBox(height: kSpacingUnit.w * 2),
                        FadeAnimation(
                          0.5,
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Level()
                                )
                            ),
                            child: Hero(
                              tag: 1,
                              child: AnimatedLiquidLinearProgressIndicator(),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: kSpacingUnit.w * 3),
                ],
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    FadeAnimation(
                      0.6,
                      ProfileListItem(
                        icon: Icons.dashboard,
                        text: 'Дашборд',
                        navigateTo: Dashboard(),
                      ),
                    ),
                    FadeAnimation(
                      0.7,
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: 'Колесо фортуны',
                        navigateTo: ExamplePage(),
                      ),
                    ),
                    FadeAnimation(
                      0.8,
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'История',
                      ),
                    ),
                    FadeAnimation(
                      0.9,
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Настройки',
                      ),
                    ),
                    FadeAnimation(
                      1,
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Выйти',
                        hasNavigation: false,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

class AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedLiquidLinearProgressIndicator({this.value = 0.5});

  @override
  _AnimatedLiquidLinearProgressIndicatorState createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<AnimatedLiquidLinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: kSpacingUnit.w * 25,
        height: kSpacingUnit.w * 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          value: widget.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Color(0xff536DFE)),
          borderRadius: 12.0,
          center: Text(
            "Медный уровень",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}