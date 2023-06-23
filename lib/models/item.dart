import 'package:intl/intl.dart';

class DataItems {
  final String id;
  final String content;
  final String date;

  DataItems.fromData(this.id, this.content, this.date);

  DataItems({required this.id, required this.content, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'date': date.toString(),
    };
  }
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
