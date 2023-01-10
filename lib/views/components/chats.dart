import 'package:flutter/material.dart';

class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  static List<Map<String, dynamic>> details = [
    {
      'id': 1,
      'name': 'Tony Stark',
      'desc': 'Sun of Odin',
      'time': '8:50',
      'image': "assets/image/tony.jpg",
    },
    {
      'id': 2,
      'name': 'Captain America',
      'desc': 'Hey There',
      'time': '9:90',
      'image': "assets/image/Captain America.jpg",
    },
    {
      'id': 3,
      'name': 'Thor',
      'desc': 'Done!',
      'time': '8:60',
      'image': "assets/image/Thor.jpg",
    },
    {
      'id': 4,
      'name': 'Thanos',
      'desc': 'Ready for fight',
      'time': 'Now',
      'image': "assets/image/Thanos.jpg",
    },
    {
      'id': 5,
      'name': 'Hulk',
      'desc': 'I am angry..',
      'time': 'Now',
      'image': "assets/image/Hulk.jpg",
    },
    {
      'id': 6,
      'name': 'Dr.Strange',
      'desc': 'it magic',
      'time': '9:88 PM',
      'image': "assets/image/Dr Strange.jpg",
    },
    {
      'id': 7,
      'name': 'spider man',
      'desc': 'You Are My Friend',
      'time': '7:46',
      'image': "assets/image/spider man.jpg",
    },
    {
      'id': 8,
      'name': 'Ant Man',
      'desc': 'You Are Mine Follow',
      'time': '5:33',
      'image': "assets/image/Ant Man.jpg",
    },
    {
      'id': 9,
      'name': 'Wakanda',
      'desc': 'Women',
      'time': 'Now',
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
                              backgroundColor: Colors.white,
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
                          backgroundColor: Colors.white,
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
                          "${e['time']}",
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
