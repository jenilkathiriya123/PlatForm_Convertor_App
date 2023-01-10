import 'package:flutter/material.dart';

class calls extends StatefulWidget {
  const calls({Key? key}) : super(key: key);

  @override
  State<calls> createState() => _callsState();
}

class _callsState extends State<calls> {
  static List<Map<String, dynamic>> details = [
    {
      'id': 1,
      'name': 'Tony Stark',
      'desc': 'Sun of Odin',
      'image': "assets/image/tony.jpg",
    },
    {
      'id': 2,
      'name': 'Captain America',
      'desc': 'Hey There',
      'image': "assets/image/Captain America.jpg",
    },
    {
      'id': 3,
      'name': 'Thor',
      'desc': 'Done!',
      'image': "assets/image/Thor.jpg",
    },
    {
      'id': 4,
      'name': 'Thanos',
      'desc': 'Ready for fight',
      'image': "assets/image/Thanos.jpg",
    },
    {
      'id': 5,
      'name': 'Hulk',
      'desc': 'I am angry..',
      'image': "assets/image/Hulk.jpg",
    },
    {
      'id': 6,
      'name': 'Dr.Strange',
      'desc': 'it magic',
      'image': "assets/image/Dr Strange.jpg",
    },
    {
      'id': 7,
      'name': 'spider man',
      'desc': 'You Are My Friend',
      'image': "assets/image/spider man.jpg",
    },
    {
      'id': 8,
      'name': 'Ant Man',
      'desc': 'You Are Mine Follow',
      'image': "assets/image/Ant Man.jpg",
    },
    {
      'id': 9,
      'name': 'Wakanda',
      'desc': 'Women',
      'image': "assets/image/Wakanda.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: details
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 300,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(e['image']),
                              radius: 60,
                            ),
                            Text("${e['name']}"),
                            Text("${e['desc']}"),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Send Message"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(e['image']),
                          radius: 25,
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
                              "${e['desc']}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "${e['Icon']}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
