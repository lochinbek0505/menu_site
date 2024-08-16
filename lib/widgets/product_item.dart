import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:menu_application/main_provider.dart';
import 'package:menu_application/models/meal.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final Meal meal;
  final int index;

  const ProductItem(this.meal, this.index, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
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
                color: Color(widget.meal.bannerColor!),
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
                        Text(widget.meal.type!),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 90,
                      child: Text(
                        widget.meal.name!,
                        maxLines: 3,
                        style: const TextStyle(
                            height: 1.2,
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
                          widget.meal.cost!,
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
                              widget.meal.time!,
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
                              "${widget.meal.ingCount} inch",
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
                          IconButton(
                              onPressed: () {
                                mainProvider.setItemIndex(widget.index);
                              },
                              icon: Icon(Icons.favorite_border)),
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
                                  mainProvider.isItemSelected(true);
                                  // _isItemSelected = true;
                                  mainProvider.setItemIndex(widget.index);
                                });
                              },
                              child: Text(
                                "more".tr(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
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
              widget.meal.imageUrl!,
              height: 170,
            ))
      ],
    );
  }
}
