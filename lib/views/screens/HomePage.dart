import 'package:flutter/material.dart';

import '../components/calls.dart';
import '../components/chats.dart';
import '../components/drawer.dart';
import '../components/settings.dart';
import '../components/stepper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  PageController pageController = PageController();

  bool switchBool = false;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor:Color(0xff54759e),
        title: Text("Platform Convertor"),
        actions: [
          Switch(
            value: switchBool,
            onChanged: (val) {
              setState(() {
                switchBool = !switchBool;
              });
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          onTap: (val) {
            pageController.animateToPage(val,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          },
          tabs: [
            Tab(text: "CHATS"),
            Tab(text: "CALLS"),
            Tab(text: "SETTINGS"),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          controller.animateTo(val);
        },
        children: [
          chats(),
          calls(),
          setting(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: stepper(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor:Color(0xff54759e),
      ),
    );
  }
}
