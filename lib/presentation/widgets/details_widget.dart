import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personalexpenses/presentation/widgets/edit_widget.dart';

//import 'package:personalexpenses/repository/expense_model.dart';
//import 'package:personalexpenses/repository/expense_model_offline.dart';

class DetailsExpense extends StatefulWidget {
  const DetailsExpense({Key? key}) : super(key: key);

  @override
  _DetailsExpenseState createState() => _DetailsExpenseState();
}

class _DetailsExpenseState extends State<DetailsExpense> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFcbefef),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "expense.expenseTitle",
                style: GoogleFonts.poppins(
                    color: const Color(0xAF030303),
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Expense Amount:",
                    style: GoogleFonts.poppins(
                        color: const Color(0xAF030303),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "expense.amount.toString() + \$",
                    style: GoogleFonts.poppins(
                        color: const Color(0xAF030303),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Date:",
                    style: GoogleFonts.poppins(
                        color: const Color(0xAF030303),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "expense.dateTime.toString()",
                    style: GoogleFonts.poppins(
                        color: const Color(0xAF030303),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF267b7b),
                    child: IconButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (_) => const EditExpense()).then((_) {
                        setState(() {});
                      }),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF267b7b),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: const Text("Delete this Item ?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("No")),
                              TextButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  child: const Text("Yes"))
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
