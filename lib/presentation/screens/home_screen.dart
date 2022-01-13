import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personalexpenses/repository/expense_model.dart';
import 'package:personalexpenses/repository/expense_model_offline.dart';
import 'package:personalexpenses/presentation/widgets/expense_tile.dart';
import 'package:personalexpenses/presentation/widgets/add_widget.dart';
import 'package:personalexpenses/presentation/widgets/details_widget.dart';
import 'package:personalexpenses/logic/logic_offline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ExpenseList> futureExpenseList;

  @override
  void initState() {
    super.initState();
    futureExpenseList = fetchExpenseList();
  }

  @override
  Widget build(BuildContext context) {
    var totalExpensesOffline =
        LogicOffline().totalExpenses().toString(); // Use for Offline Model
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('./assets/images/screen_back.png'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Personal Expenses",
                      style: GoogleFonts.poppins(
                          color: const Color(0xAF030303),
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFF267b7b),
                      child: IconButton(
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (_) => const AddExpense()).then((_) {
                          setState(() {});
                        }),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 45),
                      child: Text(
                        totalExpensesOffline +
                            " \$", // Displays Total Expenses for Offline Model
                        style: GoogleFonts.poppins(
                            color: const Color(0xAF030303),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
/*
                FutureBuilder<ExpenseList>(
                  future: futureExpenseList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      ExpenseList expenseList = snapshot.data;
                      return ListView.builder(
                        itemCount: expenseList.expenses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (_) => const DetailsExpense())
                                .then((_) {
                              setState(() {});
                            }),
                            child: ExpenseTile(
                              id: expenseList.expenses[index].id,
                              expenseTitle:
                                  expenseList.expenses[index].expenseTitle,
                              dateTime: expenseList.expenses[index].dateTime,
                              amount: expenseList.expenses[index].amount,
                            ),
                          );
                        },
                      );
                    } else {
                      return Text('${snapshot.error}');
                    }
                  },
                )
*/
                // Offline Demo Start
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: expensesListOffline.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (_) => const DetailsExpense()).then((_) {
                        setState(() {});
                      }),
                      child: ExpenseTile(
                        id: expensesListOffline[index].id,
                        expenseTitle: expensesListOffline[index].expenseTitle,
                        dateTime: expensesListOffline[index].dateTime,
                        amount: expensesListOffline[index].amount,
                      ),
                    );
                  },
                ),
                // Offline Demo End
              ],
            ),
          ),
        ),
      ),
    );
  }
}
