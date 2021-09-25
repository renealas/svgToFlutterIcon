import 'package:path_parsing/path_parsing.dart';

/// A [PathProxy] that dumps Flutter `Path` commands to the console.
class PathPrinter extends PathProxy {
  String code = '';
  int _index;
  PathPrinter(this._index);

  @override
  void close() {
    // 'Path.close();');
    code += 'path$_index.close();\n';
  }

  @override
  void cubicTo(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    // 'Path.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);');
    code += 'path$_index.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);\n';
  }

  @override
  void lineTo(double x, double y) {
    //'Path.lineTo($x, $y);');
    code += 'path$_index.lineTo($x, $y);\n';
  }

  @override
  void moveTo(double x, double y) {
    //'Path.moveTo($x, $y);');
    code += 'path$_index.moveTo($x, $y);\n';
  }
}
