import 'package:bloc_tut/responsive_ui/presentation/styling.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Align(
                  alignment: Alignment.center, child: WelcomeContentWidget()),
            ),
            ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class WelcomeContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    child: Text(
                      'Ready to find your\nFavorite lesson?',
                      style: AppTheme.lightTextTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                'assets/images/home.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Anyone can join the millions of\nmembers in our community to learn\ncutting-edge skills',
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          constraints: BoxConstraints(minHeight: 50, maxHeight: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.chevron_left,
                  size: 20,
                ),
              ),
              Text(
                'Get Started',
                style: Theme.of(context).textTheme.button,
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.chevron_right,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
