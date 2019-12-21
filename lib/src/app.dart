import 'package:flutter/material.dart';
import 'package:page_view_demo/src/pages/first_page.dart';
import 'package:page_view_demo/src/pages/forth_page.dart';
import 'package:page_view_demo/src/pages/second_page.dart';
import 'package:page_view_demo/src/pages/third_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int bottomSelectedIndex = 0;

  PageController pageController =
      PageController(keepPage: true, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Page View Demo'),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {},),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomSelectedIndex,
          items: buildBottomNavBarItems(),
          onTap: (index) {
            bottomTapped(index);
          },
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[FirstPage(), SecondPage(), ThirdPage(), ForthPage()],
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.black,), title: new Text('Red', style: TextStyle(color: Colors.black),)),
      BottomNavigationBarItem(
          icon: new Icon(Icons.search, color: Colors.black,), title: new Text('Blue', style: TextStyle(color: Colors.black),)),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline, color: Colors.black,), title: Text('Yellow', style: TextStyle(color: Colors.black),)),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline, color: Colors.black,), title: Text('Green', style: TextStyle(color: Colors.black),))
    ];
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
