import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  DateTime currentDate = DateTime.now();

  List<String> Months = [
    'Jan',
    'Fab',
    'Mar',
    'April',
    'May',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oac',
    'Nav',
    'Des',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date"),
              Text(
                  '${currentDate.day},${Months[currentDate.month - 1]} ${currentDate.year}'),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Change Date"),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(2010),
                  lastDate: DateTime(250),
                );
                setState(() {
                  if (pickedDate != null) {
                    currentDate = pickedDate;
                  }
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time"),
                  Text("9:45:08 AM"),
                ],
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Change Time"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
