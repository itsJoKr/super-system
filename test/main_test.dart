import 'package:move/main.dart';
import 'package:test/test.dart';

void main() {
  test('Test data from mail', () {
    final result = regroupPhotos(_inputMail);
    expect(result, _outputMail);
  });

  test('Reverse order test', () {
    final result = regroupPhotos(_inputReverse);
    expect(result, _outputReverse);
  });

  test('Pad sequence test', () {
    final result = regroupPhotos(_inputBigSequence);
    expect(result, _outputBigSequence);
  });

  test('No photos test', () {
    final result = regroupPhotos('');
    expect(result, '');
  });
}

/// Input data from mail
final _inputMail = '''DSC012333.jpg, Madrid, 2016-10-01 13:02:34
DSC044322.jpg, Milan, 2015-03-05 10:11:22
DSC130033.raw, Rio, 2018-06-02 17:01:30
DSC044322.jpeg, Milan, 2015-03-04 14:55:01
DSC130033.jpg, Rio, 2018-06-02 17:05:10
DSC012335.jpg, Milan, 2015-03-05 10:11:24''';

final _outputMail = '''Madrid1.jpg
Milan2.jpg
Rio1.raw
Milan1.jpeg
Rio2.jpg
Milan3.jpg''';

/// Reverse order test
final _inputReverse = '''
DSC130033.jpg, Zagreb, 2023-06-02 17:05:10
DSC012333.jpg, Zagreb, 2022-10-01 13:02:34
DSC044322.jpg, Zagreb, 2021-03-05 10:11:22
DSC130033.raw, Zagreb, 2020-06-02 17:01:30
DSC044322.jpeg, Zagreb, 2019-03-04 14:55:01''';

final _outputReverse = '''Zagreb5.jpg
Zagreb4.jpg
Zagreb3.jpg
Zagreb2.raw
Zagreb1.jpeg''';

final _inputBigSequence = '''
DSC130033.jpeg, Rome, 2023-06-02 17:05:10
DSC012333.jpeg, Rome, 2022-10-01 13:02:34
DSC044322.jpeg, Rome, 2021-03-05 10:11:22
DSC130033.jpeg, Rome, 2020-06-02 17:01:30
DSC044322.jpeg, Rome, 2017-03-04 14:55:01
DSC044322.jpeg, Rome, 2015-03-04 14:55:01
DSC044322.jpeg, Rome, 2014-03-04 14:55:01
DSC044322.jpeg, Rome, 2012-09-04 14:55:01
DSC044322.jpeg, Rome, 2011-03-04 14:55:01
DSC044322.jpeg, Rome, 2010-03-04 14:55:01
DSC044322.jpeg, Rome, 2009-03-04 14:55:01
DSC044322.jpeg, Rome, 2008-03-04 14:55:01
DSC044322.jpeg, Rome, 2010-03-04 14:55:01''';

final _outputBigSequence = '''Rome13.jpeg
Rome12.jpeg
Rome11.jpeg
Rome10.jpeg
Rome09.jpeg
Rome08.jpeg
Rome07.jpeg
Rome06.jpeg
Rome05.jpeg
Rome03.jpeg
Rome02.jpeg
Rome01.jpeg
Rome04.jpeg''';
