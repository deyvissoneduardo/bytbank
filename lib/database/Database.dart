import 'package:bytbank/dao/ContactDAO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String _nameDatabase = 'bytbanck.db';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), _nameDatabase);
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDAO.tableSql);
  }, version: 1);
}
