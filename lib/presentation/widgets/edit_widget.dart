import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:personalexpenses/repository/expense_model.dart';

class EditExpense extends StatefulWidget {
  const EditExpense({Key? key}) : super(key: key);

  @override
  _EditExpenseState createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController expenseID = TextEditingController();
  late TextEditingController expenseAmount = TextEditingController();
  late TextEditingController expenseTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Expense expense;
    //expenseID = TextEditingController(text: expense.id.toString());
    //expenseAmount = TextEditingController(text: expense.amount.toString());
    //expenseTitle = TextEditingController(text: expense.expenseTitle);

    return Container(
      color: Colors.amber,
    );
  }
}
