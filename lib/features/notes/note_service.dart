import 'package:hive_flutter/hive_flutter.dart';

import '../../core/models/note.dart';

class NoteService {
  NoteService() {
    Hive.registerAdapter(NoteAdapter());
  }

  List<Note> notes = [];

  Future<List<Note>> getNotes() async {
    final box = await Hive.openBox('mybox');
    List notes2 = box.get('notes') ?? [];
    notes = notes2.cast<Note>();
    return notes;
  }

  Future<List<Note>> updateNotes() async {
    final box = await Hive.openBox('mybox');
    box.put('notes', notes);
    notes = await box.get('notes');
    return notes;
  }
}
