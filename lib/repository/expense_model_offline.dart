class ExpenseOffline {
  final int id;
  final String expenseTitle;
  final double amount;
  final DateTime dateTime;

  ExpenseOffline({
    required this.id,
    required this.expenseTitle,
    required this.amount,
    required this.dateTime,
  });
}

var expensesListOffline = <ExpenseOffline>[
  ExpenseOffline(
    id: 1,
    expenseTitle: "Test Expense 1",
    amount: 39.50,
    dateTime: DateTime.now(),
  ),
  ExpenseOffline(
    id: 2,
    expenseTitle: "Test Expense 2",
    amount: 40.00,
    dateTime: DateTime.now(),
  ),
  ExpenseOffline(
    id: 3,
    expenseTitle: "Money",
    amount: 32.00,
    dateTime: DateTime.now(),
  ),
  ExpenseOffline(
    id: 4,
    expenseTitle: "Money 2",
    amount: 22.00,
    dateTime: DateTime.now(),
  ),
];
