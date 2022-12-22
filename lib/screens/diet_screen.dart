import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_kit/constants.dart';
import 'package:habit_kit/widgets/bottom_nav_bar.dart';
import 'package:habit_kit/widgets/search_bar.dart';

class DietScreen extends StatelessWidget {
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
              color: kBackgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/icons/diet.png"),
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
                    Text("Diet Recommendation",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold, color: kActiveIconColor)),
                    SizedBox(height: 10),
                    Text(
                      "Your healthy lunch",
                      style: TextStyle(fontWeight: FontWeight.bold, color: kActiveIconColor),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Try these recipes",
                        style: TextStyle(fontWeight: FontWeight.bold, color: kActiveIconColor),

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
                        RecipeCard(
                          recipeNum: 1,
                          isDone: true,
                          press: () {},
                        ),
                        RecipeCard(
                          recipeNum: 2,
                          press: () {},
                        ),
                        RecipeCard(
                          recipeNum: 3,
                          press: () {},
                        ),
                        RecipeCard(
                          recipeNum: 4,
                          press: () {},
                        ),
                        RecipeCard(
                          recipeNum: 5,
                          press: () {},
                        ),
                        RecipeCard(
                          recipeNum: 6,
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Today's recommendation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: kActiveIconColor),
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
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/diet.png",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hummus Recipe",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text("Start healthy habits")
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

class RecipeCard extends StatelessWidget {
  final int recipeNum;
  final bool isDone;
  final Function press;

  const RecipeCard({
    Key key,
    this.recipeNum,
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
            color: kTextColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : kTextColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? kTextColor : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Recipe $recipeNum",
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
