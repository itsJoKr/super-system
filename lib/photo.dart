import 'package:move/date_time_formatter.dart';

/// Model representing for photo
class Photo {
  Photo._(this.extension, this.city, this.dateTime, this.index);

  factory Photo.fromRawPhoto(String filename, int index) {
    final parts = filename.split(', ');
    final fileExtension = parts[0].split('.').last;
    final city = parts[1];
    final dateTime = DateTimeFormatter.parseRawPhoto(parts[2]);

    return Photo._(fileExtension, city, dateTime, index);
  }

  final int index;
  final String extension;
  final String city;
  final DateTime dateTime;

  late String sequenceSuffix;

  void setSequenceSuffix(int index, int cityMaxIndex) {
    sequenceSuffix = index.toString().padLeft(cityMaxIndex.toString().length, '0');
  }

  String toNewFilename() => '$city$sequenceSuffix.$extension';
}
