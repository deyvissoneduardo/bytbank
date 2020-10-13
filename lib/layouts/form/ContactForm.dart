import 'package:bytbank/dao/ContactDAO.dart';
import 'package:bytbank/models/Contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  /** controladores **/
  TextEditingController _nameController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();

  final ContactDAO _dao = ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(labelText: 'Account Number'),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: SizedBox(
                height: 50,
                width: double.maxFinite,
                child: RaisedButton(
                  color: Colors.blue,
                  elevation: 9,
                  child: Text(
                    'Create',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    /** recupera valores **/
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contacts contact = Contacts(0, name, accountNumber);
                    _dao.save(contact).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
