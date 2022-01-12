// ignore_for_file: file_names

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:rust_controll/addServerScreen.dart';
import 'package:rust_controll/data/work_data.dart';
import 'package:rust_controll/settingsScreen.dart';

import 'widgets/listServers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool checkInternet = false;
  bool connection = false;

  checkInternetConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      setState(() {
        checkInternet = true;
        connection = true;
      });
    } else {
      // print(DataConnectionChecker().lastTryResults);
      setState(() {
        checkInternet = true;
      });
    }
  }

  checkInternetConnectionScreen() {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Colors.blueAccent,
        height: size.height,
        width: size.width,
        child: checkInternet && !connection
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text(
                      "No internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black12),
                    onPressed: () {
                      setState(() {
                        checkInternet = false;
                        connection = false;
                      });
                      checkInternetConnection();
                    },
                    child: Text('Try Again', style: TextStyle(fontSize: 20)),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Flexible(
                    child: Text(
                      "Checking internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  final screen = [
    ListServers(),
    // AddServerScreen(),
    settingsScreen(),
    Demo(),
    // Center(child: Text('2')),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Colors.blue;
    final secondaryColor = Colors.black54;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.white;

    return !connection
        ? checkInternetConnectionScreen()
        : Scaffold(
            body: screen[_selectedIndex],
            extendBody: true,
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, height + 6),
                    painter:
                        BottomNavCurvePainter(backgroundColor: backgroundColor),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: primaryColor,
                        child: Icon(Icons.add_outlined),
                        elevation: 0.1,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddServerScreen(),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NavBarIcon(
                          text: "Home",
                          icon: Icons.home_outlined,
                          selected: _selectedIndex == 0,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          defaultColor: secondaryColor,
                          selectedColor: primaryColor,
                        ),
                        SizedBox(),
                        NavBarIcon(
                          text: "Settings",
                          icon: Icons.settings_outlined,
                          selected: _selectedIndex == 1,
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          selectedColor: primaryColor,
                          defaultColor: secondaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
