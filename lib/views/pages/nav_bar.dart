import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_4traderx/app/utils/colors.dart';
import 'package:test_4traderx/views/pages/home.dart';
import 'package:test_4traderx/views/pages/settings.dart';

import '../../core/models/nav_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  DateTime currentBackPressTime = DateTime.now();
  final pages = [
    const Home(),
    const Home(),
    const Home(),
    const Settings(),
  ];
  List<NavigationItem> items = [
    NavigationItem('assets/images/home.png', 'Home'),
    NavigationItem('assets/images/accounts.png', 'Accounts'),
    NavigationItem('assets/images/app.png', 'Apps'),
    NavigationItem('assets/images/settings.png', 'Settings'),
  ];
  Widget buildItem(NavigationItem item, bool isSelected) {
    return SizedBox(
      height: 65.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 5.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(2.r),
              ),
              color: isSelected ? const Color(0xffEC7E3D) : AppColors.white,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Image.asset(
            item.image,
            color:
                isSelected ? const Color(0xffEC7E3D) : const Color(0xffC1BDBD),
            height: 22.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
          Text(
            item.title.toString(),
            style: TextStyle(
              color: isSelected ? AppColors.black : const Color(0xffC1BDBD),
              fontSize: 10,
              height: 13 / 10,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (currentIndex == 0) {
      DateTime now = DateTime.now();
      int timeDiff = now.difference(currentBackPressTime).inSeconds;
      if (timeDiff > 2) {
        currentBackPressTime = now;
        return Future.value(false);
      }
      currentBackPressTime = now;
      return Future.value(true);
    } else {
      _onItemTapped(0);
      setState(() {});
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
          ),
          height: 66.h,
          color: const Color(0xFFFFFFFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: () => _onItemTapped(itemIndex),
                child: buildItem(item, currentIndex == itemIndex),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
