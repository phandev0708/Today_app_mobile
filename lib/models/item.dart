import 'package:intl/intl.dart';

class DataItems {
  final String id;
  final String name;
  final DateTime date;
  DataItems({required this.id, required this.name, required this.date});
}

class DateFormatter {
  final String input;

  DateFormatter(this.input);

  String format(String? formatInput) {
    final formatI = formatInput ?? 'HH:mm dd/MM/yyyy';
    DateTime dateTime = DateTime.parse(input).toLocal();
    var formatter = DateFormat(formatI);
    return formatter.format(dateTime);
  }
}
