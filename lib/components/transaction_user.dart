import 'dart:math';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tenis de Corrida',
        date: DateTime.now(),
        value: 310.76),
    Transaction(
        id: 't2', title: 'Conta de Luz', date: DateTime.now(), value: 211.30),
  ];
  
  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }
  @override

 
    @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ]
      
    );
  }
}