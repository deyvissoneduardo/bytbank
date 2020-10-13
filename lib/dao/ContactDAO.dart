import 'package:bytbank/database/Database.dart';
import 'package:bytbank/models/Contacts.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {
  static const String _nameTable = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  static const String tableSql = 'CREATE TABLE $_nameTable('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  /** insere no banco **/
  Future<int> save(Contacts contacts) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contacts);
    return db.insert(_nameTable, contactMap);
  }

  Map<String, dynamic> _toMap(Contacts contacts) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contacts.fullName;
    contactMap[_accountNumber] = contacts.accountNumber;
    return contactMap;
  }

  /** busca todos contatos **/
  Future<List<Contacts>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_nameTable);
    return _toList(result);
  }

  List<Contacts> _toList(List<Map<String, dynamic>> result) {
    final List<Contacts> listContatcs = List();
    for (Map<String, dynamic> row in result) {
      final Contacts contacts = Contacts(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      listContatcs.add(contacts);
    }
    return listContatcs;
  }
}
