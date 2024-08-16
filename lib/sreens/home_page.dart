import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:menu_application/sreens/dishes_page.dart';
import 'package:menu_application/sreens/favorite_page.dart';
import 'package:menu_application/sreens/salats_page.dart';
import 'package:provider/provider.dart';

import '../main_provider.dart';
import '../models/lang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [FavoritePage(), DishesPage(), SalatsPage()];

  var _langs = [
    Lang('uz', true),
    Lang('ru', false),
    Lang('en', false),
  ];

  int _activeLangIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) {
              return myMenu(constraints);
            },
          ),
          Expanded(
              child: Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => _pages[_selectedIndex],
            ),
          ))
        ],
      ),
    );
  }

  Widget langBuild() {
    final langProvider = Provider.of<MainProvider>(context, listen: false);
    setCurrentLangButton();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 16,
        ),
        ToggleButtons(
          fillColor: Colors.transparent,
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          selectedColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          direction: Axis.vertical,
          children: <Widget>[
            langButton(_langs[0]),
            langButton(_langs[1]),
            langButton(_langs[2]),
          ],
          onPressed: (int index) {
            setState(() {
              _langs.forEach((e) {
                e.isActive = false;
              });
              switch (index) {
                case 0:
                  {
                    var newLocale = Locale('uz', 'UZ');
                    context.setLocale(newLocale);
                    langProvider.langChanged();
                  }
                  break;
                case 1:
                  {
                    var newLocale = Locale('ru', 'RU');
                    context.setLocale(newLocale);
                    langProvider.langChanged();
                  }
                  break;
                case 2:
                  {
                    var newLocale = Locale('en', 'US');
                    context.setLocale(newLocale);
                    langProvider.langChanged();
                  }
                  break;
              }
              _langs[index].isActive = true;
            });
          },
          isSelected: _langs.map((e) => e.isActive).toList(),
        ),
        SizedBox(height: 4),
      ],
    );
  }

  Widget langButton(Lang lang) {
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          lang.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            lang.isActive ? const Color(0xff206498) : const Color(0xff2A5270),
      ),
    );
  }

  Widget myMenu(BoxConstraints constraints) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: IntrinsicHeight(
          child: NavigationRail(
            minWidth: 54,
            // extended: true,
            // useIndicator: false,
            groupAlignment: 0.5,
            indicatorColor: Color(0xff2A5270),
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
              // _selectedIndex = index;
            },
            leading: langBuild(),
            unselectedLabelTextStyle:
                TextStyle(color: Colors.white70, fontSize: 13),
            destinations: [
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )),
                  )),
              NavigationRailDestination(
                icon: SizedBox(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'meals'.tr(),
                  ),
                ),
              ),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("salads".tr()),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("drinks".tr()),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("fast_food".tr()),
                  )),
            ],
            selectedIndex: _selectedIndex,
            backgroundColor: Color(0xff2A5270),
          ),
        ),
      ),
    );
  }

  void setCurrentLangButton() {
    switch (context.locale.toString()) {
      case 'uz_UZ':
        {
          _langs.forEach((element) {
            if (element.name == 'uz') {
              element.isActive = true;
            } else {
              element.isActive = false;
            }
          });
        }
        break;
      case 'ru_RU':
        {
          _langs.forEach((element) {
            if (element.name == 'ru') {
              element.isActive = true;
            } else {
              element.isActive = false;
            }
          });
        }
        break;
      case 'en_US':
        {
          _langs.forEach((element) {
            if (element.name == 'en') {
              element.isActive = true;
            } else {
              element.isActive = false;
            }
          });
        }
        break;
    }
  }
}
