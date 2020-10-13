import 'package:bytbank/layouts/form/ContactForm.dart';
import 'package:bytbank/layouts/home/Home.dart';
import 'package:bytbank/layouts/list/ContactsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneratedRoute {
  /** constante com nome das telas **/
  static const String ROTA_HOME = '/Home';
  static const String ROTA_CONTACT_LIST = '/ContactsList';
  static const String ROTA_CONTACT_FORM = '/ContactForm';

  /** metodo que gera as rotas **/
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    /** config para passagem de argumentos entre telas **/
    final args = settings.arguments;

    switch (settings.name) {
      case ROTA_HOME :
        return MaterialPageRoute(builder: (_) => Home());
      case ROTA_CONTACT_LIST :
        return MaterialPageRoute(builder: (_) => ContactsList());
      case ROTA_CONTACT_FORM:
        return MaterialPageRoute(builder: (_) => ContactForm());
      default:
        _erroRota();
    }
  }

  /** metedo para quando nao encontra a tela **/
  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Tela Não Encontrada'),
        ),
        body: Center(
          child: Text('Tela Não Encontrada'),
        ),
      );
    });
  }
}
