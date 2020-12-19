import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/home.dart';
import '../pages/shop.dart';
import '../pages/map.dart';
import '../pages/account.dart';
import '../main.dart';

class UniNavbar extends StatefulWidget {
  UniNavbar({Key key}) : super(key: navbarKey);

  @override
  UniNavbarState createState() => UniNavbarState();
}

class UniNavbarState extends State<UniNavbar> {
  PageController _controller = PageController(initialPage: 0);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: PageView(
            controller: _controller,
            children: [
              Home(),
              Shop(),
              Map(),
              Account()
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: GNav(
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Color(0xff0a2896),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Главная',
                      ),
                      GButton(
                        icon: Icons.shopping_cart,
                        text: 'Магазин',
                      ),
                      GButton(
                        icon: Icons.map,
                        text: 'Карта',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Аккаунт',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      _controller.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease
                      );
                      setState(() => _selectedIndex = index);
                    }),
              ),
            ),
          ),
        )
      )
  );
}