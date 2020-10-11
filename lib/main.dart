import 'package:bytbank/layouts/home/Home.dart';
import 'package:bytbank/routes/GeneratedRoutes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.green[900],
      accentColor: Colors.blueAccent[700]),
  home: Home(),
  initialRoute: GeneratedRoute.ROTA_HOME,
  onGenerateRoute: GeneratedRoute.generatedRoute,
));

