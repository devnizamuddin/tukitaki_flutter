import 'package:intl/intl.dart';

String getFormatedDate(DateTime date) => DateFormat('dd-MMM-yyyy').format(date); //'Wednesday, January 10, 2012'
String getFormatedMonth(DateTime date) => DateFormat('MMM').format(date); //'Wednesday, January 10, 2012'
String getFormatedYear(DateTime date) => DateFormat('yyyy').format(date); //'Wednesday, January 10, 2012'
