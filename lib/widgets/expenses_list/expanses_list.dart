import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final Function(Expense expense) onRemove;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal
          )
        ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemove(expenses[index]);
          },
          child: ExpensesItem(expense: expenses[index])),
    );
  }
}
