import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_kit/constants.dart';
import 'package:habit_kit/widgets/bottom_nav_bar.dart';
import 'package:habit_kit/widgets/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class YogaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/icons/yoga.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text("Yoga Sessions",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold, color: activeIconColor)),
                    SizedBox(height: 10),
                    Text(
                      "Breath in",
                      style: TextStyle(fontWeight: FontWeight.bold, color: activeIconColor),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Breath out",
                        style: TextStyle(fontWeight: FontWeight.bold, color: activeIconColor),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          sessionNum: 1,
                          isDone: true,
                          press: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=jHZPtn15agE')),
                        ),
                        SessionCard(
                          sessionNum: 2,
                          press: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=x0nZ1ZLephQ')),
                        ),
                        SessionCard(
                          sessionNum: 3,
                          press: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=CqnWMPuyT0g')),
                        ),
                        SessionCard(
                          sessionNum: 4,
                          press: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=tL5xfikyJgI')),
                        ),
                        SessionCard(
                          sessionNum: 5,
                          press: () => launchUrl(Uri.parse('https://www.youtube.com/watch?v=OMu6OKF5Z1k')),
                        ),
                        SessionCard(
                          sessionNum: 6,
                          press: () => launchUrl(Uri.parse(
                              'https://www.youtube.com/watch?v=eqQUFdQpqiI&list=PLui6Eyny-UzwheLDyEScgdgbh7z3FgNCX')),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Today's recommendation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: activeIconColor),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: shadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/yoga.png",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Your early yoga routine",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text("20 minutes of selfcare")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;

  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10, // constraint.maxWidth provide us the available with for this widget
          decoration: BoxDecoration(
            color: textColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: shadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => press(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? blueColor : textColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: blueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? textColor : blueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $sessionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
