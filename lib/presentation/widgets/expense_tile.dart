import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile(
      {Key? key,
      required this.id,
      required this.expenseTitle,
      required this.dateTime,
      required this.amount})
      : super(key: key);

  final int id;
  final String expenseTitle;
  final double amount;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          expenseTitle,
          style: GoogleFonts.poppins(
              color: const Color(0xAF030303),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(dateTime),
          style: GoogleFonts.poppins(
              color: const Color(0xAF030303),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          amount.toString() + ' \$',
          style: GoogleFonts.poppins(
              color: const Color(0xAF030303),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
