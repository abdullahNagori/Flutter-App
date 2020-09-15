import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/second.dart';


void main() => runApp(MyAppThree());

Color primary = Color(0xfff7aeac);
Color primaryDark = Color(0xffe37e7c);
Color accent = Color(0xffe37e7c);
Color accentLight = Color(0xfff7aeac);
double leftMargin = 30;
double centralBoxSize;

class MyAppThree extends StatefulWidget {
  @override
  SecondPage createState() => SecondPage();
}

class SecondPage extends State<MyAppThree> with TickerProviderStateMixin {
  AnimationController _controllerBody, _controllerBulb;
  Animation<double> _animationBody, _animationBulb;

  @override
  void dispose() {
    _controllerBody.dispose();
    _controllerBulb.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controllerBody = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animationBody = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBody,
      curve: Curves.easeOut,
    ));

    _controllerBulb = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animationBulb = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBulb,
      curve: Curves.easeInOutQuint,
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _controllerBody.forward();
    _controllerBulb.forward();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          centralBoxSize ??= MediaQuery.of(context).size.height / 6;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primary,
              leading: Container(
                margin: EdgeInsets.only(left: 30),
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 30,
                  ),
                  child: Text(
                    'Good Night',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                            )),
                        margin: EdgeInsets.only(top: 80),
                      ),
                      FadeTransition(
                        opacity: _animationBody,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset(0, 0),
                          ).animate(_animationBody),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //THE SWITCH
                              Container(
                                height: centralBoxSize,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: leftMargin),
                                  width: 120,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                      color: primary.withOpacity(0.3),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 80,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: primary.withOpacity(0.8),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            )),
                                        child: Icon(
                                          Icons.new_releases,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                      Icon(
                                        Icons.filter_vintage,
                                        color: primary.withOpacity(0.5),
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: leftMargin),
                                height: centralBoxSize,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Saved today'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: primaryDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "\$1.55".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 66,
                                          color: primaryDark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: leftMargin),
                                height: centralBoxSize,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Current production'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: accent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "\$0.34".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 36,
                                        color: accent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //THE BOTTOM BAR
                              Container(
                                margin: EdgeInsets.only(bottom: 0),
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => MyApp()));
                                      },
                                      child: Icon(
                                        Icons.lightbulb_outline,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => MyAppTwo()));
                                      },
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.brightness_3,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: accent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      // bottomLeft: Radius.circular(10),
                                      // bottomRight: Radius.circular(10),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animationBulb,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset(0, 0),
                          ).animate(_animationBulb),
                          child: Align(
                            alignment: Alignment.topRight,
                            //THE BULB
                            child: Stack(
                              children: <Widget>[
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Container(
                                //       margin: EdgeInsets.only(top: 40),
                                //       height: 80,
                                //       width: 90,
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius: BorderRadius.only(
                                //                 topLeft: Radius.circular(40))),
                                //       )),
                                // ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 200,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment(-0.4, -0.8),
                                          stops: [0.0, 0.5, 0.5, 1],
                                          colors: [
                                            accentLight,
                                            accentLight,
                                            accent,
                                            accent,
                                          ],
                                          tileMode: TileMode.repeated,
                                        ).createShader(bounds);
                                      },
                                      child: Icon(
                                        Icons.brightness_3,
                                        size: 350,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 80),
                                    width: 113,
                                    height: 175,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.9),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: primary,
          );
        },
      ),
    );
  }
}