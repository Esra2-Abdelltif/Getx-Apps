import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo_app/note_app/helper/database_helper.dart';
import 'package:getx_demo_app/note_app/model/note_model.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:string_stats/string_stats.dart';

class NoteController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  var notes = <Note>[];
  int contentWordCount = 0;
  int contentCharCount = 0;

  // DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  bool isEmpty() {
    if (notes.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
    if (title.isEmpty) {
      title = "بدون عنوان";
    }
    Note note = Note(
      title: title,
      content: content,
      dateTimeEdited: DateFormat("MMM dd, yyyy  HH:mm:ss").format(DateTime.now()),
      dateTimeCreated: DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
    );

    await DatabaseHelper.instance.addNote(note);
    // to calculate num of word  in content
    contentWordCount = wordCount(content);
    // to calculate num of char in content
    contentCharCount = charCount(content);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.back();
  }

  void deleteNote(int id) async {
    Note note = Note(
      id: id,
    );
    await DatabaseHelper.instance.deleteNote(note);
    getAllNotes();
  }

  void deleteAllNotes() async {
    await DatabaseHelper.instance.deleteAllNotes();
    getAllNotes();
  }

  void updateNote(int id, String dTCreated) async {
    final title = titleController.text;
    final content = contentController.text;
    Note note = Note(
      id: id,
      title: title,
      content: content,
      dateTimeEdited: DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await DatabaseHelper.instance.updateNote(note);
    contentWordCount = wordCount(content);
    contentCharCount = charCount(content);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.back();
  }

  void getAllNotes() async {
    print("object-----");
    notes = await DatabaseHelper.instance.getNoteList();
    print(notes.length);
    print("object+++++-");

    update();
  }

  void shareNote(String title, String content) {
     Share.share("$title \n$content",subject: '$title Note');
  }
}
