import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Expense> fetchExpenseList() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/expenses'));

  if (response.statusCode == 200) {
    return Expense.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class Expense {
  int? id;
  String? expenseTitle;
  double? amount;
  String? dateTime;

  Expense({this.id, this.expenseTitle, this.amount, this.dateTime});

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json['id'],
        expenseTitle: json['expenseTitle'],
        amount: json['amount'],
        dateTime: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'expenseTitle': expenseTitle,
        'amount': amount,
        'date': dateTime,
      };
}

/*
class ExpenseList {
  final List<Expense> expenses;

  ExpenseList({required this.expenses});

  factory ExpenseList.fromJson(List<dynamic> response) {
    var expenses = List<Expense>.empty();
    expenses = response.map((item) => Expense.fromJson(item)).toList();

    return ExpenseList(
      expenses: expenses,
    );
  }
}

class Expense {
  final int id;
  final String expenseTitle;
  final double amount;
  final DateTime dateTime;

  Expense({
    required this.id,
    required this.expenseTitle,
    required this.amount,
    required this.dateTime,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      expenseTitle: json['expenseTitle'],
      amount: json['amount'],
      dateTime: json['date'],
    );
  }
}
*/