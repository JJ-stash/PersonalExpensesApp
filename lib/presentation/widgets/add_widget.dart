import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personalexpenses/repository/expense_model.dart';

//import 'package:personalexpenses/logic/logic_offline.dart';
//import 'package:personalexpenses/repository/expense_model_offline.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();
  TextEditingController expensesIDController = TextEditingController();
  TextEditingController expensesAmountController = TextEditingController();
  TextEditingController expensesTitleController = TextEditingController();

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022 - 01 - 01),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dateTime = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFcbefef),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: expensesIDController,
                      decoration: const InputDecoration(
                          hintText: "Please Enter Expense ID",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Valid Info";
                        } else if (double.parse(value) <= 0) {
                          return "Please Enter Valid ID";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: expensesAmountController,
                      decoration: const InputDecoration(
                          hintText: "Please Enter Expense Amount",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Valid Info";
                        } else if (double.parse(value) <= 0) {
                          return "Please Enter Valid Amount";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: expensesTitleController,
                      decoration: const InputDecoration(
                          hintText: "Please Enter Expense Title",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Valid Info";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.yMMMd().format(dateTime),
                          style: GoogleFonts.poppins(
                              color: const Color(0xAF030303),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF267b7b)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () => _showDatePicker(context),
                          child: Text(
                            "Pick Date",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF267b7b)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Expense expense = Expense(
                                expenseTitle: expensesTitleController.text,
                                amount:
                                    double.parse(expensesAmountController.text),
                                dateTime: dateTime,
                                id: int.parse(expensesIDController.text),
                              );
                              // Add Goes Here
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "     ADD     ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
