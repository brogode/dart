import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';


class atendance {

  List<List<dynamic>> students = [];

  void writeCSV(String filename, String data) {
    final file = File(filename);
    file.writeAsStringSync(data);
  }

  void import(String filename) {
    final input = File(filename).readAsStringSync();
    final rows = LineSplitter().convert(input);
   final fields = rows.map((row) => row.split(';')).toList();
    students = fields;
     //for (final row in students) {
     //print(row.join(', '));
     //}
  }

  void printdata(){
    for (final row in students) {
     print(row.join(', '));
     }
  }

  void marking(var index, var mark) {
    for (var j in students) {
      //print(j[0]);
      
        //print(j[1]);
        if (j[0] == index){
          j[2] = mark;
          //print('done');
        
      }
     }
  }
  void report(){
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final file = File('$date.csv');
    final report = students.map((row) => row.join(',')).join('\n');
    file.writeAsStringSync(report);
  }


}
void main() {
  final regester = new atendance();

  regester.writeCSV('students.csv', 'id;firstname;lastname;present \n1804;Dylan Stephen;Chakanyuka \n1803;Simon Panashe;Chikono \n1803;Ahmed;Fourati  \n1804;Yassin;Kharrat \n1804;Laura Tinatsei;Manhondo \n1802;Godfrey;Manjoro \n1803;Sibongile Tafadzwa;Mazipetele \n1803;Ropafadzo Mellisa;Mushawembirimi \n1804;Emma Vassily;Rukatsa \n1803;Arnold;Rurangwa  \n1804;Komila;Temirxojoyeva ');
  
  regester.import('students.csv');
  regester.printdata();
  regester.marking('1803', '1');
  print('');
  regester.printdata();
  regester.report();


}