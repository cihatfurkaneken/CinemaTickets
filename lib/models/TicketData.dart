import 'package:intl/intl.dart';

class TicketData {
  final String number;
  final int seat;
  final DateTime dateTime;
  final String movie;

  String get formattedDate => DateFormat('dd/MM/yy').format(dateTime);

  String get formattedTime => DateFormat('kk:mm').format(dateTime);

  TicketData({this.number, this.movie, this.seat, this.dateTime});
}
