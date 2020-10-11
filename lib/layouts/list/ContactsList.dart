import 'package:bytbank/routes/GeneratedRoutes.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatcs'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'nome',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, GeneratedRoute.ROTA_CONTACT_FORM)
              .then((contact) => debugPrint(contact.toString()), );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
