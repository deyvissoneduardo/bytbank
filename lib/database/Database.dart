import 'package:bytbank/models/Contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String _nameTable = 'contacts';
final String _nameDatabase = 'bytbanck.db';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), _nameDatabase);
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE ${_nameTable}('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER)');
  }, version: 1);
}

/** insere no banco **/
Future<int> save(Contacts contacts) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contacts.fullName;
  contactMap['account_number'] = contacts.accountNumber;
  return db.insert(_nameTable, contactMap);
}

/** busca todos contatos **/
Future<List<Contacts>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query(_nameTable);
  final List<Contacts> listContatcs = List();
  for (Map<String, dynamic> row in result) {
    final Contacts contacts = Contacts(
      row['id'],
      row['name'],
      row['account_number'],
    );
    listContatcs.add(contacts);
  }
  return listContatcs;
}
