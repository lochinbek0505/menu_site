import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:menu_application/main_provider.dart';
import 'package:menu_application/models/meal.dart';
import 'package:menu_application/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../utils/product_type.dart';

class DishesPage extends StatefulWidget {
  DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, data, child) {
      return SafeArea(child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return mainUi(constraints);
          },
        ),
      ));
    });
  }

  Widget mainUi(BoxConstraints constrains) {
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "title".tr(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(top: 30, bottom: 24),
            itemCount: Meal.mealsRu.length,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 1,
                crossAxisCount: axisCount,
                mainAxisExtent: 385,
                crossAxisSpacing: 20,
                mainAxisSpacing: 32),
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder(
                  future: getFavourites(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.contains(index)) {
                        return ProductItem(
                          getMeals()[index],
                          index,
                          isFavourite: true,
                          productType: ProductType.DISH,
                        );
                      } else {
                        return ProductItem(
                          getMeals()[index],
                          index,
                          isFavourite: false,
                          productType: ProductType.DISH,
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // return ProductItem(getMeals()[index], index,
                    //     isFavourite: snapshot.data.contains(index));
                  });
            },
          ),
        ),
      ],
    );
  }

  List<Meal> getMeals() {
    switch (context.locale.toString()) {
      case 'uz_UZ':
        {
          return Meal.mealsUz;
        }
      case 'ru_RU':
        {
          return Meal.mealsRu;
        }
      case 'en_US':
        {
          return Meal.mealsEn;
        }
      default:
        return Meal.mealsRu;
    }
  }

  Future<List<int>> getFavourites() async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return await mainProvider.getFavList();
  }
}
