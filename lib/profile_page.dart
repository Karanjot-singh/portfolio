import 'dart:html' as html;

import 'package:flutter/material.dart';
import './responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        NavButton(
          text: "About",
          onPressed: () {
            // html.window.open("https://pawan.live", "Pk");
          },
        ),
        NavButton(
          text: "Projects",
          onPressed: () {
            // html.window.open("https://pawan.live", "Pk");
          },
        ),
        NavButton(
          text: "Contact",
          onPressed: () {
            // html.window.open("https://pawan.live", "Pk");
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.teal,
        ),
        //if mobile:
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(),
                ),
              )
            : null,
        //else

        body:
            // ListView.builder(itemBuilder: null)
            SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Dot(),
//          Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Karanjot Singh",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;
  final String imgURL;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.imgURL,
      this.color = Colors.teal,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlineButton(
          child: 
          Text(text),
          borderSide: BorderSide(
            color: color,
          ),
          shape: StadiumBorder(),
          onPressed: onPressed,
          highlightedBorderColor: Colors.blueGrey[50],
        ),
        // SizedBox(
        //     width:ResponsiveWidget.isSmallScreen(context)
        //     ? MediaQuery.of(context).size.height * 0.05:null,
        //   ),
        //   SizedBox(
        //     height:ResponsiveWidget.isSmallScreen(context)
        //     ?null: MediaQuery.of(context).size.width * 0.05,
        //   ),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("karanjot.jpeg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.teal),
      ),
      Text(
        "Karanjot\nSingh",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "A member of Google Developer Groups.\n"
        "Flutter App Developer\n",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.blueGrey[50]),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {
              html.window.open(
                  "https://google-developers.appspot.com/community/experts/directory/profile/profile-pawan_kumar",
                  "GDE");
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {
              html.window.open("https://pawan.live", "Pk");
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      
      NavButton(
        text: "Github",
        onPressed: () {
          html.window.open("https://github.com/Karanjot-singh", "Git");
        },
        color: Colors.teal,
        imgURL: "GIT.png",
      ),
      NavButton(
        text: "LinkedIn",
        onPressed: () {
          html.window.open("https://www.linkedin.com/in/karanjot-singh-/", "LinkedIn");
        },
        color: Colors.teal,
        imgURL: "linked.png",

      ),
      NavButton(
        text: "Mail",
        onPressed: () {
          html.window.open("mailto.karanjot19050@iiitd.ac.in", "Fb");
        },
        color: Colors.teal,
        imgURL: "mail.png",

      ),
    ];
  }

  Widget copyRightText() => Text(
        "Karanjot Singh ©️ 2020",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueGrey),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
