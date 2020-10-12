import 'package:bytbank/database/Database.dart';
import 'package:bytbank/models/Contacts.dart';
import 'package:bytbank/routes/GeneratedRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatcs'),
      ),
      body: FutureBuilder<List<Contacts>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text('loading')],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contacts> _listContacts = snapshot.data;
              return ListView.builder(
                itemCount: _listContacts.length,
                itemBuilder: (context, index) {
                  final Contacts contact = _listContacts[index];
                  return _ContactItem(contact);
                },
              );
              break;
          }
          return Container(
            child: Text('Error 502'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, GeneratedRoute.ROTA_CONTACT_FORM);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contacts contacts;

  _ContactItem(this.contacts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 9,
      child: ListTile(
        title: Text(
          contacts.fullName,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contacts.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
