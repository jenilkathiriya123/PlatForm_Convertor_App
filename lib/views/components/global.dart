import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Global {
  static List view = [];
  static String? description;
  static String? contact;
  static String? name;

  static List<Map<String, dynamic>> details = [
    {
      'number': '9909915484',
      'name': 'Tony Stark',
      'desc': 'Sun of Odin',
      'time': '8:50',
      'image': "assets/image/tony.jpg",
    },
    {
      'number': '98989144102',
      'name': 'Captain America',
      'desc': 'Hey There',
      'time': '9:90',
      'image': "assets/image/Captain America.jpg",
    },
    {
      'number': '7436039032',
      'name': 'Thor',
      'desc': 'Done!',
      'time': '8:60',
      'image': "assets/image/Thor.jpg",
    },
    {
      'number': '9510570516',
      'name': 'Thanos',
      'desc': 'Ready for fight',
      'time': 'Now',
      'image': "assets/image/Thanos.jpg",
    },
    {
      'number': '9824960767',
      'name': 'Hulk',
      'desc': 'I am angry..',
      'time': 'Now',
      'image': "assets/image/Hulk.jpg",
    },
    {
      'number': '7228088510',
      'name': 'Dr.Strange',
      'desc': 'it magic',
      'time': '9:88 PM',
      'image': "assets/image/Dr Strange.jpg",
    },
    {
      'number': '9825720410',
      'name': 'spider man',
      'desc': 'You Are My Friend',
      'time': '7:46',
      'image': "assets/image/spider man.jpg",
    },
    {
      'number': '9913180878',
      'name': 'Ant Man',
      'desc': 'You Are Mine Follow',
      'time': '5:33',
      'image': "assets/image/Ant Man.jpg",
    },
    {
      'number': '8238244102',
      'name': 'Wakanda',
      'desc': 'Women',
      'time': 'Now',
      'image': "assets/image/Wakanda.jpg",
    },
  ];

  static call({required String contact}) async {
    String number = contact;
    bool? call = await FlutterPhoneDirectCaller.callNumber(number);
  }
}