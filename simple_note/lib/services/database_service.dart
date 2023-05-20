import 'package:hive/hive.dart';

import '../models/note.dart';

class DatabaseServices {
  ///[ *nama database/box ]
  final String boxName = "notesBox";

  /// [*menambahkan catatan]
  Future<void> addNote(Note note) async {
    final box = await Hive.openBox(boxName);
    await box.add(note);
  }

  /// [*mengambil semua catatan di database]
  Future<List<Note>> getAllNotes() async {
    final box = await Hive.openBox(boxName);
    return box.values.toList().cast<Note>();
  }

  /// [* memperbaharui satu catatan di database]
  Future<void> updateNote(Note note) async {
    final box = await Hive.openBox(boxName);
    await box.put(note.key, note);
  }

  ///[* menghapus satu catatan di database]
  Future<void> deleteNote(Note note) async {
    final box = await Hive.openBox(boxName);
    await box.delete(note.key);
  }
}
