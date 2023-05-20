import 'package:intl/intl.dart';

extension DateFormating on String {
  String formatDate() {
    DateTime dateFormated = DateTime.parse(this);
    DateFormat formatter = DateFormat("EEEE, dd MMMM yyyy");
    final String formated = formatter.format(dateFormated);
    return formated;
  }
}
