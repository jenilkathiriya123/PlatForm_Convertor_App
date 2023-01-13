import 'package:flutter/material.dart';
import 'global.dart';

class calls extends StatefulWidget {
  const calls({Key? key}) : super(key: key);

  @override
  State<calls> createState() => _callsState();
}

class _callsState extends State<calls> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: Global.details
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (e['image']!= null)?(e['image'].runtimeType != String)?CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: FileImage(e['image']),
                        radius: 30,
                      ):CircleAvatar(
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(e['image']),
                        radius: 30,
                      ):CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/image/person.jpg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e['name']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${e['time']}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Global.call(contact: e['number']);
                          },
                          child: Icon(Icons.call, color: Colors.green)),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
