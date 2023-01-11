import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  State<stepper> createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  int initialStep = 0;

  ImagePicker image = ImagePicker();
  File? file;

  camera() async {
    final cam = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(cam!.path);
    });
  }

  gallery() async {
    final gal = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(gal!.path);
    });
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Stepper(
        controlsBuilder: (context, controlDetails) => Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff54759e),
                ),
              ),
              onPressed: controlDetails.onStepContinue,
              child: Text("CONTINUE"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff54759e),
                ),
              ),
              onPressed: controlDetails.onStepCancel,
              child: Text("CANCEL"),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 60, right: 10),
        currentStep: initialStep,
        onStepContinue: () {
          setState(() {
            if (initialStep < 2) {
              ++initialStep;
            }
          });
        },
        onStepCancel: () {
          if (initialStep == 0) {
            initialStep = 0;
          }
        },
        onStepTapped: (val) {
          setState(() {
            initialStep = val;
          });
        },
        steps: [
          Step(
            isActive: (initialStep >= 0) ? true : false,
            state: StepState.indexed,
            title: const Text(
              "PROFILE PHOTO",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              "Add Profile Photo",
              style: TextStyle(color: Colors.grey),
            ),
            content: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage: (file != null) ? FileImage(file!) : null,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        alignment: Alignment.center,
                        title: const Text("Choose any source to pick image"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                camera();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Camera"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                gallery();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Gallery"),
                          ),
                        ],
                      ),
                    );
                  });
                },
                child: const Align(
                  alignment: Alignment(1, 1),
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ),
          Step(
            isActive: (initialStep >= 1) ? true : false,
            state: StepState.indexed,
            title: const Text(
              "NAME",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              "Enter name",
              style: TextStyle(color: Colors.grey),
            ),
            content: TextFormField(
              onSaved: (val) {
                setState(() {
                  Global.name = val!;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter your Name";
                } else {
                  return null;
                }
              },
            ),
          ),
          Step(
            isActive: (initialStep >= 2) ? true : false,
            state: StepState.indexed,
            title: const Text(
              "DESCRIPTION",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              "Enter description",
              style: TextStyle(color: Colors.grey),
            ),
            content: TextFormField(
              onSaved: (val) {
                setState(() {
                  Global.description = val!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
