import 'package:personalexpenses/repository/expense_model_offline.dart';

class LogicOffline {
  double totalExpenses() {
    double sum = 0;
    for (int i = 0; i < expensesListOffline.length; i++) {
      sum += expensesListOffline[i].amount;
    }
    return sum;
  }

  void addExpenseOffline(ExpenseOffline expense) {
    expensesListOffline.add(expense);
  }

  void editExpenseOffline(ExpenseOffline expense, int index) {
    expensesListOffline.replaceRange(index, index + 1, [expense]);
  }

  void deleteExpenseOffline(int id) {
    expensesListOffline.removeWhere((element) => element.id == id);
  }
}
