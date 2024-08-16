import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_provider.dart';
import '../models/meal.dart';
import '../widgets/product_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Consumer<MainProvider>(builder: (context, data, child) {
      return FutureBuilder(
          future: mainProvider.getFavList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constrains) {
                var axisCount = 1;
                var current = constrains.maxWidth;

                if (current <= 500) {
                  axisCount = 1;
                } else if (current > 500 && current <= 750) {
                  axisCount = 2;
                } else if (current > 750 && current <= 1000) {
                  axisCount = 3;
                } else {
                  axisCount = 4;
                }

                return GridView.builder(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 1,
                        crossAxisCount: axisCount,
                        mainAxisExtent: 350,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 32),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem(
                        Meal.mealsRu[snapshot.data[index]],
                        snapshot.data[index],
                        isFavourite: true,
                      );
                    });
              });
            }
          });
    });
  }

// Widget mainUi(BoxConstraints constrains, AsyncSnapshot snapshot) {
//   var axisCount = 1;
//   var current = constrains.maxWidth;
//
//   if (current <= 500) {
//     axisCount = 1;
//   } else if (current > 500 && current <= 750) {
//     axisCount = 2;
//   } else if (current > 750 && current <= 1000) {
//     axisCount = 3;
//   } else {
//     axisCount = 4;
//   }
//
//   return GridView.builder(
//       padding: const EdgeInsets.only(top: 24, bottom: 24),
//       scrollDirection: Axis.vertical,
//       itemCount: snapshot.data.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: 2 / 1,
//           crossAxisCount: axisCount,
//           mainAxisExtent: 350,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 32),
//       itemBuilder: (BuildContext context, int index) {
//         return ProductItem(
//           Meal.mealsRu[snapshot.data[index]],
//           snapshot.data[index],
//           isFavourite: true,
//         );
//       });
// }

// [0,3] fav list
// [0,1] fav page
}
