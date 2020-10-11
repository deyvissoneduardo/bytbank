import 'package:bytbank/models/Contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  final String _nameTable = 'contacts';

  /** cria banco **/
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytbanck.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE ${_nameTable}('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    }, version: 1);
  });
}

/** insere no banco **/
Future<int> salve(Contacts contacts) {
  return createDataBase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contacts.fullName;
    contactMap['account_number'] = contacts.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

/** busca todos contatos **/
Future<List<Contacts>> findAll() {
 return createDataBase().then((db) {
   return db.query('contacts').then((maps) {
      final List<Contacts> listContatcs = List();
      for (Map<String, dynamic> map in maps) {
        final Contacts contacts = Contacts(
          map['id'],
          map['name'],
          map['account_number'],
        );
        listContatcs.add(contacts);
      }
      return listContatcs;
    });
  });
}
