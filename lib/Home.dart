import 'package:bytbank/shareds/Constantes.dart';
import 'package:bytbank/shareds/themes/Theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboad'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(PATH_LOGO),
            Container(
              height: 100,
              width: 150,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.people,
                      size: 32,
                      color: Colors.white,
                    ),
                    Text(
                      'Contacts',
                      style: TextStyle(
                          fontSize: 24, color: themeDataDefault.primaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
