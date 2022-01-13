import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Logic {
  getJsonData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/expenses'));
    final parsedData = jsonDecode(response.body);
    return parsedData;
  }

  // will have to call this from somewhere else
  Future<double> totalExpenses() async {
    double sum = 0;
    List parsedData = await getJsonData();
    for (int i = 0; i < parsedData.length; i++) {
      sum += parsedData[i].amount;
    }
    return sum;
  }
}
