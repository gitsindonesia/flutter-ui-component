String codeSnippetDateTimeExtension = ''' import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFullDateTime() =>
      DateFormat('EEEE, dd MMM yyyy - HH:mm', 'id').format(this);
  String toSimpleDateTime() =>
      DateFormat('dd MMM yyyy, HH:mm', 'id').format(this);
  String toFormatDate([String? pattern, String? locale]) =>
      DateFormat(pattern ?? 'dd MMM yyyy', locale ?? 'id').format(this);
}
''';
