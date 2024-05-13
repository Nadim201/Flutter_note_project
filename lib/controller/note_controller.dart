import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];
  createNote(note) {
    notes.add(note);
    update();
  }
}
