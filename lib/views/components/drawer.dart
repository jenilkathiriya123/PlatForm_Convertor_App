import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xff54759e),
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                  Text(
                    "Jenil Kathiriya",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "942800 1856",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people_alt_outlined),
                      SizedBox(width: 30),
                      Text("New Group"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 30),
                      Text("New Contact"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: 30),
                      Text("Calls"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.bookmark),
                      SizedBox(width: 30),
                      Text("Saved Messages"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 30),
                      Text("Settings"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
