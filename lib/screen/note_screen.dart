import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/controller/note_controller.dart';
import 'package:note_pad/models/all_style.dart';
import 'package:note_pad/models/note_model.dart';

class NoteApp extends StatelessWidget {
  NoteApp({super.key});
  TextEditingController idctl = TextEditingController();
  TextEditingController namectl = TextEditingController();
  TextEditingController dptctl = TextEditingController();
  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.graycolor,
        title: Text(
          'Note Pad',
          style: TextStyle(fontFamily: AllText.simple.fontFamily, fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AllColors.orangecolor,
        onPressed: () {
          _showData(context);
        },
      ),
      body: Card(
        child: GetBuilder<NoteController>(
          builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: noteController.notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Text(noteController.notes[index].id),
                    title: Text(noteController.notes[index].name),
                    subtitle: Text(noteController.notes[index].dept),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  _showData(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: idctl,
                    decoration: InputDecoration(
                        label: Text('Id'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: AllColors.whitecolor,
                        hintText: 'Enter Your Id',
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: namectl,
                    decoration: InputDecoration(
                        label: Text('Name'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: AllColors.whitecolor,
                        hintText: 'Enter Your Name',
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: dptctl,
                    decoration: InputDecoration(
                        label: Text('Department'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: AllColors.whitecolor,
                        hintText: 'Enter Your Department',
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.orangecolor,
                            foregroundColor: AllColors.whitecolor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancle'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.bluecolor,
                            foregroundColor: AllColors.whitecolor),
                        onPressed: () {
                          noteController.createNote(
                              NoteModel(idctl.text, namectl.text, dptctl.text));
                          Navigator.pop(context);
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
