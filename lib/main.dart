import '/components/transaction_user.dart';
import 'package:flutter/material.dart';


main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  child: Text('Grafico',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      )),
                  elevation: 5,
                ),
              ),
             TransactionUser(),
            ]),
      ),
    );
  }
}
