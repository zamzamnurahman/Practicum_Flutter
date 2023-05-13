import 'package:path/path.dart';
import 'package:simple_note/models/note.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String DB_NAME = 'simple_notes.db';
  final int DB_VERSIONS = 1;
  final String TABLE_NAME = "notes";
  DatabaseService._();
  static final DatabaseService db = DatabaseService._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      print("DATABASE SUDAH ADA");
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    print("DATABASE DI BUAT");
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DB_NAME);
    print(path);
    return await openDatabase(path, version: DB_VERSIONS,
        onCreate: (db, version) async {
      await db.execute(
        '''
        CREATE TABLE $TABLE_NAME(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          created_at DATE )
        ''',
      );
    });
  }

  ///[* Add notes]
  // add a new notes in database
  addNewNotes(Note note) async {
    final db = await database;
    db?.insert(
      TABLE_NAME,
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// [* Get Notes]
  // get all note for database
  getNotes() async {
    final db = await database;
    List<Map<String, Object?>>? response = await db?.query(TABLE_NAME);
    if (response!.isEmpty) {
      return null;
    } else {
      var result = response.toList();
      return result;
    }
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    var result = db?.rawUpdate(
      """
        UPDATE $TABLE_NAME SET 
        title = "${note.title}",
        desctiprion = "${note.description}",
        created_at = "${note.createdAt}",
        WHERE id = ${note.id}
      """,
    );
    return result!;
  }

  /// [* REMOVE NOTE]
  //Remove a notes from database
  Future<int> deleteNotes(int id) async {
    final db = await database;
    int count = await db!.rawDelete(
      "DELETE FROM $TABLE_NAME WHERE id = ?",
      [id],
    );
    return count;
  }
}
