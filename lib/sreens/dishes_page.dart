import 'dart:io';

import 'package:flutter/material.dart';
import 'package:menu_application/models/meal.dart';
import 'package:menu_application/sreens/detailes_page.dart';

class DishesPage extends StatefulWidget {
  DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  bool _isItemSelected = false;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _isItemSelected
            ? setState(() {
                _isItemSelected = false;
              })
            : exit(0);

        return Future.value(false);
      },
      child: SafeArea(
        child: _isItemSelected
            ? DetailesPage(_selectedItem)
            : Scaffold(
                body: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Мы очень рады, что вы выбрали наш ресторан.\nМы надеемся, что вам понравится наш ресторан",
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: GridView.builder(
                          itemCount: Meal.mealsRu.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2 / 1,
                                  crossAxisCount: 1,
                                  mainAxisExtent: 385,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 32),
                          itemBuilder: (BuildContext context, int index) {
                            return meal(Meal.mealsRu[index], context, index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
      ),
    );
  }

  Widget meal(Meal meal, context, int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(meal.bannerColor!),
              ),
              height: 400,
              width: 230,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 2,
                          height: 25,
                          color: const Color(0xff00195C),
                        ),
                        SizedBox(width: 4),
                        Text(meal.type!),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 90,
                      child: Text(
                        meal.name!,
                        maxLines: 3,
                        style: const TextStyle(
                            height: 1.3,
                            fontSize: 24,
                            color: Color(0xff1E2022),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Narxi :',
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          meal.cost!,
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_dish.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              meal.time!,
                              style: const TextStyle(
                                  color: Color(0xff52616B),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_cal.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${meal.ingCount} inch",
                              style: TextStyle(
                                  color: Color(0xff52616B),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/btn_plus.png",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Color(0xff175B8F)))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff175B8F))),
                              onPressed: () {
                                setState(() {
                                  _isItemSelected = true;
                                  _selectedItem = index;
                                });

                                // Navigator(
                                //   onGenerateRoute: (setttings) =>
                                //       MaterialPageRoute(
                                //           builder: (context) => DetailesPage()),
                                // );

                                // Navigator.of(context).pushReplacement(
                                //     MaterialPageRoute(
                                //         builder: (context) => DetailesPage()));
                              },
                              child: Text(
                                "Batafsil",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                          )
                          // IconButton(
                          //     onPressed: () {
                          //       //agar selected bo'lsa remove()
                          //       // selected bo'lmasa add()
                          // //       if (widget.isFavourite) {
                          // //         removeFromFavorite(widget.index);
                          // //       } else {
                          // //         addToFavorite();
                          // //       }
                          // //     },
                          // //     icon: widget.isFavourite
                          // //         ? Icon(Icons.favorite_sharp)
                          // //         : Icon(Icons.favorite_border_outlined)),
                          // // Container(
                          // //   height: 50,
                          // //   child: ElevatedButton(
                          // //     style: ButtonStyle(
                          // //         shape: MaterialStateProperty.all<
                          // //                 RoundedRectangleBorder>(
                          // //             RoundedRectangleBorder(
                          // //                 borderRadius:
                          // //                     BorderRadius.circular(10.0),
                          // //                 side: const BorderSide(
                          // //                     color: Color(0xff175B8F)))),
                          // //         backgroundColor:
                          // //             MaterialStateProperty.all<Color>(
                          // //                 const Color(0xff175B8F))),
                          // //     onPressed: () {
                          // //       setState(() {
                          // //         navigateToDetails();
                          // //       });
                          //     },
                          //     child: Text('more'.tr()),
                          //   ),
                          //
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
            top: -30,
            right: -8,
            child: Image.asset(
              meal.imageUrl!,
              height: 170,
            ))
      ],
    );
  }
}
