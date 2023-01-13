import 'package:flutter/material.dart';
import 'global.dart';

class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: Global.details
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
                            (e['image']!= null)?(e['image'].runtimeType != String)?CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage: FileImage(e['image']),
                              radius: 60,
                            ):CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage: AssetImage(e['image']),
                              radius: 60,
                            ):const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/image/person.jpg'),
                            ),
                            Text("${e['name']}"),
                            Text("+91 ${e['number']}"),
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
