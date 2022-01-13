import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ExpenseList> fetchExpenseList() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/expenses'));

  if (response.statusCode == 200) {
    return ExpenseList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class ExpenseList {
  final List<Expense> expenses;

  ExpenseList({required this.expenses});

  factory ExpenseList.fromJson(Map<String, dynamic> json) {
    final expenses = <Expense>[];
    json['expenses'].forEach((item) {
      expenses.add(Expense.fromJson(item));
    });
    return ExpenseList(
      expenses: expenses,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = expenses.map((item) => item.toJson()).toList();
    return data;
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

  factory Expense.fromJson(Map<List, dynamic> json) {
    return Expense(
      id: json['id'],
      expenseTitle: json['expenseTitle'],
      amount: json['amount'],
      dateTime: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['expenseTitle'] = expenseTitle;
    data['amount'] = amount;
    data['dateTime'] = dateTime;
    return data;
  }
}
