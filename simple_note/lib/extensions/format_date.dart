import 'package:intl/intl.dart';

extension DateFormating on String {
  String formatDate(String date) {
    DateTime dateFormated = DateTime.parse(date);
    DateFormat formatter = DateFormat("EEEE, dd MMMM yyyy");
    final String formated = formatter.format(dateFormated);
    return formated;
  }
}
