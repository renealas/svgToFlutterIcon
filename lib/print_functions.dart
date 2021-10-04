import 'package:flutter/widgets.dart';
import 'package:test_svg/parser.dart';
import 'package:test_svg/svg_to_data.dart';
import 'package:path_parsing/path_parsing.dart';

printHeaders(SvgToData svg) {
  Size size = svg.getSize();
  String className = svg.className;
  //Imports
  String imports = "";
  imports += "import 'package:flutter/material.dart';\n";
  imports += "import 'package:flutter/widgets.dart';\n";
  imports += "import 'package:property1/widgets/icons/icon_mixin.dart';\n\n";

  //Widget Class//
  String widgetClass = "";
  widgetClass += "class $className extends StatelessWidget  with IconMixin {\n";
  widgetClass += "final double width;\n";
  widgetClass += "final double height;\n";
  widgetClass += "final Color color;\n";
  widgetClass += "final bool solid;\n";
  widgetClass +=
      "$className({this.width, this.height, this.color = const Color(0xFF00a669), this.solid = false});\n";

  widgetClass += "@override\n";
  widgetClass += "Widget build(BuildContext context) {\n";
  widgetClass += "return Container(\n";
  widgetClass +=
      "width: getWidth(height: height, width: width, originalSize: Size(${size.width}, ${size.height})),\n";
  widgetClass +=
      "height: getHeight(width: width, height: height, originalSize: Size(${size.width}, ${size.height})),\n";
  widgetClass += "alignment: Alignment.center,\n";
  widgetClass += "child: CustomPaint(\n";
  widgetClass += "painter: _$className(color: color, solid: solid),\n";
  widgetClass +=
      "size: getImageSize(width: width, height: height, originalSize: Size(${size.width}, ${size.height})),\n";
  widgetClass += "),\n";
  widgetClass += ");\n";
  widgetClass += "}\n";
  widgetClass += "}\n\n";

  //Init class Custom Painter
  String customPainter = "";
  customPainter += "class _$className extends CustomPainter {\n";
  customPainter += "final Color color;\n";
  customPainter += "final bool solid;\n";
  customPainter +=
      "_$className({@required this.color, this.solid = false});\n\n";
  customPainter += "@override\n";
  customPainter += "void paint(Canvas canvas, Size size) {\n";
  customPainter +=
      "final Size originalSize = Size(${size.width}, ${size.height});\n";
  customPainter +=
      "final double _xScaling = size.width / originalSize.width;\n";

  //Setting the gradient
  customPainter += "Paint paint = Paint();\n";
  customPainter += "paint.color = color;\n";

  debugPrint(imports + widgetClass + customPainter, wrapWidth: 1024);
}

printPaths(SvgToData svg) {
  List<String> paths = svg.getPaths();
  paths.asMap().forEach((index, path) {
    print("Path path$index = Path();");
    printPath(index, path);
  });

  drawPaths(svg);
}

printPath(int index, String path) {
  PathPrinter pp = PathPrinter(index);
  // Just put an svg path to it - is going to return all the code you need dumbass
  writeSvgPathDataToPath(path, pp);
  debugPrint(pp.code, wrapWidth: 1024);
}

drawPaths(SvgToData svg) {
  List<String> paths = svg.getPaths();
  String drawPaths = "";
  drawPaths += "canvas.scale(_xScaling);\n";

  paths.asMap().forEach((index, path) {
    drawPaths += "canvas.drawPath(path$index, paint);\n";
  });

  debugPrint(drawPaths, wrapWidth: 1024);
}

printFooters() {
  String footerPainter = "";

  footerPainter += "}\n\n";

  footerPainter += "@override\n";
  footerPainter +=
      "bool shouldRepaint(covariant CustomPainter oldDelegate) {\n";
  footerPainter += "return false;\n";
  footerPainter += "}\n";
  footerPainter += "}\n";

  debugPrint(footerPainter, wrapWidth: 1024);
}
