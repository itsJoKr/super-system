import 'dart:collection';

import 'package:move/photo.dart';

String regroupPhotos(String input) {
  if (input.isEmpty) {
    return '';
  }

  final HashMap<String, List<Photo>> photos = HashMap<String, List<Photo>>();

  // Parse raw data into something we can work with
  final rawFiles = input.split('\n');
  for (int i = 0; i < rawFiles.length; i++) {
    final photo = Photo.fromRawPhoto(rawFiles[i], i);
    final cityPhotos = photos[photo.city] ??= [];
    cityPhotos.add(photo);
  }

  // Creating fixed-length output list
  final outputList = List<Photo?>.generate(rawFiles.length, (index) => null);

  // Go through all photos by city
  for (final cityPhotos in photos.values) {
    // Order the photos by date/time taken
    cityPhotos.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    // Set sequence number for each photo
    final cityMaxSequence = cityPhotos.length;
    for (int i = 0; i < cityPhotos.length; i++) {
      final photo = cityPhotos[i];
      photo.setSequenceSuffix(i + 1, cityMaxSequence);
      outputList[photo.index] = (photo);
    }
  }

  /// Order output by original input index
  outputList.sort((a, b) => a!.index.compareTo(b!.index));

  return outputList.map((photo) => photo!.toNewFilename()).join('\n');
}
