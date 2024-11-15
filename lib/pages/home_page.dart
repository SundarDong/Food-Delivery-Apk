import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/pages/my_sliver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled)=> [
            MySliverAppBar(
              title:MyTabBar(
                tabController: _tabController ,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  //current location 
                 const MyCurrentLocation(),

                  //description box
                 const MyDescriptionBox(),
                ],
              ),
               ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index)=> Text("first tab items"),
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index)=> Text("Second tab items"),
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index)=> Text("Third tab items"),
                ),
            ],
           ),
        ),
    );
  }
}