import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'SharedPrefUtils.dart';
import 'StyleOptions.dart';

class DBUtils {
  static Database _database;
  static bool isDBTableCreated;

  // Opens the database and creates a table if table
  // is not already created (read from SharedPrefs)
  static void initDB() async {
    var dbsPath = await getDatabasesPath();
    String dbPath = join(dbsPath, 'styles.db');

    isDBTableCreated = await SharedPrefUtils.isDBTableCreated();

    _database = await openDatabase(dbPath, version: 1, onCreate: (Database db, int version) async {
      if (!isDBTableCreated) {
        await db.execute('CREATE TABLE Styles (styleid INTEGER PRIMARY KEY, assetname TEXT, createdby TEXT)');
        SharedPrefUtils.setDBTableCreated(true);
      }
    });
  }

  static void unlockStyle(StyleOption style) async {
    if (!isDBTableCreated) {
      Fluttertoast.showToast(msg: 'Error: Database table not created yet');
      return;
    }
    await _database.transaction((txn) async {
      // note that the styleid attribute should be incremented by default, being a primary key
      txn.insert('Styles', {'assetname': style.assetName, 'createdby': style.createdBy});
    });
  }

  static Future<List<StyleOption>> getUnlockedStyles() async {
    if (!isDBTableCreated) {
      Fluttertoast.showToast(msg: 'Error: Database table not created yet');
      return null;
    }

    // must order the results so that they are always in a specific order
    List<Map> results = await _database.rawQuery('SELECT * FROM Styles ORDER BY styleid');
    List<StyleOption> stylesUnlocked = [];

    for (Map result in results) {
      stylesUnlocked.add(StyleOption.fromMap(result));
    }

    return stylesUnlocked;
  }
}
