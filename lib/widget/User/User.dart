import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_pk/random_pk.dart';
import 'package:movie/style/theme.dart' as theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/widget/User/Login.dart';
import 'package:movie/widget/User/Sign.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}):super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = new PageController();
    _pageView = new PageView(
      controller: _pageController,
      children: <Widget>[
        new LoginPage(),
        new SiginPage(),
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: new SingleChildScrollView(
          child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              gradient: theme.Theme.primaryGradient,
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new SizedBox(height: 75,),
                new SizedBox(height: 20,),
                new Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0x552B2B2B),
                  ),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Container(
                          decoration: _currentPage == 0 ? BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: Colors.white):null,
                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                              },
                              child: new Text("登录", style: TextStyle(fontSize: 16),),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Container(
                          decoration: _currentPage == 1 ? BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25),),color: Colors.white): null,
                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                              },
                              child: new Text("注册", style: TextStyle(fontSize: 16),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                new Expanded(child: _pageView,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}