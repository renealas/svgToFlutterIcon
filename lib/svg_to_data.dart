import 'package:flutter/widgets.dart';
import 'package:test_svg/print_functions.dart';

class SvgToData {
  final String svg;
  final String className;
  SvgToData({@required this.svg, @required this.className});

  Size getSize() {
    double width = 0;
    double height = 0;
    RegExp regExp = new RegExp(r'width\=\"(\d+)\" ');
    Match match = regExp.firstMatch(svg);
    if (match != null) {
      width =
          double.parse("${match.group(1)}"); // => topic  - first matched group
    }

    RegExp regExpHeight = new RegExp(r'height\=\"(\d+)\" ');
    Match matchHeight = regExpHeight.firstMatch(svg);
    if (matchHeight != null) {
      height = double.parse(
          "${matchHeight.group(1)}"); // => topic  - first matched group
    }

    return Size(width, height);
  }

  List<String> getPaths() {
    List<String> paths = [];
    RegExp regExp = new RegExp(r'path d="([0-9A-Z \.\-]+)"');
    Iterable<Match> matches = regExp.allMatches(svg);
    matches.forEach((match) {
      paths.add(match.group(1));
    });

    return paths;
  }

  print() {
    printHeaders(this);

    printPaths(this);

    printFooters();
  }
}
