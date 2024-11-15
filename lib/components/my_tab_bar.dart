import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {

   final TabController tabController;
  
  const MyTabBar({
    super.key,
    required this.tabController,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller:tabController,
        tabs: [
          //first tab
          Tab(
            icon: Icon(Icons.home),
          ),

          //second tab
           Tab(
            icon: Icon(Icons.settings),
          ),

           //third tab
           Tab(
            icon: Icon(Icons.person),
          )
        ],
        ),
    );
  }
}