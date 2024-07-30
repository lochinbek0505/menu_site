import 'package:flutter/material.dart';
import 'package:menu_application/models/meal.dart';

class DetailesPage extends StatefulWidget {
  final int _selectedItemIndex;

  const DetailesPage(this._selectedItemIndex, {super.key});

  @override
  State<DetailesPage> createState() => _DetailesPageState();
}

class _DetailesPageState extends State<DetailesPage> {
  // final List<Lang> _langs = [
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        // boxShadow: [BoxShadow(
        //
        //   color:
        //
        // )],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/bg_details.png"),
        ),
      ),
      child: body(),
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.only(top: 80, right: 30),
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          detailes(),
          Positioned(
              top: -72,
              right: -48,
              child: Image.asset(
                Meal.mealsRu[widget._selectedItemIndex].imageUrl!,
                // height: 320,
                width: 210,
              ))
        ],
      ),
    );
  }

  Widget detailes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
          ),
          Text(
            Meal.mealsRu[widget._selectedItemIndex].name!,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/ic_dish.png',
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    Meal.mealsRu[widget._selectedItemIndex].time!,
                    style: const TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_cal.png',
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${Meal.mealsRu[widget._selectedItemIndex].ingCount} inch",
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_kkal.png',
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "445 kkal ",
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Meal.mealsRu[widget._selectedItemIndex].details!,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
