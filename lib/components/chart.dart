import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransation;

  Chart(this.recentTransation);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransation.length; i++) {
        bool sameDay = recentTransation[i].date.day == weekDay.day;
        bool sameMonth = recentTransation[i].date.month == weekDay.month;
        bool sameYear = recentTransation[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransation[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }
  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double) ;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
              label: tr['day'].toString(),
              value: tr['value'] as double,
              percentage: _weekTotalValue == 0 ? 0 : (tr['value'] as double) / _weekTotalValue,
            ),
               );
            
          }).toList(),
        ),
      ),
    );
  }
}
