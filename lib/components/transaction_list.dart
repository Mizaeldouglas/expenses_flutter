import 'package:expenses_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key? key, required this.transaction, required this.onRemove})
      : super(key: key);
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transaction.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nenhuma Transação Cadastrada!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  final tr = transaction[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              'R\$${tr.value}',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat("dd/MM/yyyy - hh:mm a").format(tr.date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  );
                },
              ));
  }
}
