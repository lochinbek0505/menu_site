import 'package:flutter/material.dart';
import 'package:menu_application/sreens/dishes_page.dart';
import 'package:menu_application/sreens/salats_page.dart';

import '../models/lang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [DishesPage(), SalatsPage()];

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
          NavigationRail(
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
            destinations: const [
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: RotatedBox(quarterTurns: -1, child: Text('Блюда')),
              ),
              NavigationRailDestination(
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Салаты"),
                  ),
                  icon: RotatedBox(quarterTurns: -1, child: Text(""))),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Напытки"),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Fast - Food"),
                  )),
            ],
            selectedIndex: _selectedIndex,
            backgroundColor: Color(0xff2A5270),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  Widget langBuild() {
    // final langProvider = Provider.of<MainProvider>(context, listen: false);
    // setCurrentLangButton();

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
              // switch (index) {
              //   case 0:
              //     {
              //       var newLocale = Locale('uz', 'UZ');
              //       context.setLocale(newLocale);
              //       langProvider.langChanged();
              //     }
              //     break;
              //   case 1:
              //     {
              //       var newLocale = Locale('ru', 'RU');
              //       context.setLocale(newLocale);
              //       langProvider.langChanged();
              //     }
              //     break;
              //   case 2:
              //     {
              //       var newLocale = Locale('en', 'US');
              //       context.setLocale(newLocale);
              //       langProvider.langChanged();
              //     }
              //     break;
              // }
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

// void setCurrentLangButton() {
//   switch (context.locale.toString()) {
//     case 'uz_UZ':
//       {
//         _langs.forEach((element) {
//           if (element.name == 'uz') {
//             element.isActive = true;
//           } else {
//             element.isActive = false;
//           }
//         });
//       }
//       break;
//     case 'ru_RU':
//       {
//         _langs.forEach((element) {
//           if (element.name == 'ru') {
//             element.isActive = true;
//           } else {
//             element.isActive = false;
//           }
//         });
//       }
//       break;
//     case 'en_US':
//       {
//         _langs.forEach((element) {
//           if (element.name == 'en') {
//             element.isActive = true;
//           } else {
//             element.isActive = false;
//           }
//         });
//       }
//       break;
//   }
// }
}
