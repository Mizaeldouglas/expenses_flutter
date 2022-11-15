import 'package:expenses_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transaction})
      : super(key: key);
  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemCount: transaction.length,
          itemBuilder: (ctx, index) {
            final tr = transaction[index];
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.purple,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${tr.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat("dd/MM/yyyy - hh:mm ").format(tr.date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
