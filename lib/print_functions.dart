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
  imports += "import 'package:stamp_app/config/stamp_ui.dart';\n\n";

  //Widget Class//
  String widgetClass = "";
  widgetClass += "class $className extends StatelessWidget {\n";
  widgetClass += "final double size;\n";
  widgetClass += "$className({this.size = 50});\n";

  widgetClass += "@override\n";
  widgetClass += "Widget build(BuildContext context) {\n";
  widgetClass += "return Container(\n";
  widgetClass += "width: size,\n";
  widgetClass += "height: size,\n";
  widgetClass += "alignment: Alignment.center,\n";
  widgetClass += "child: CustomPaint(\n";
  widgetClass += "painter: _$className(),\n";
  widgetClass += "size: Size(size,size),\n";
  widgetClass += "),\n";
  widgetClass += ");\n";
  widgetClass += "}\n";
  widgetClass += "}\n\n";

  //Init class Custom Painter
  String customPainter = "";
  customPainter += "class _$className extends CustomPainter {\n";
  customPainter += "@override\n";
  customPainter += "void paint(Canvas canvas, Size size) {\n";
  customPainter +=
      "final Size originalSize = Size(${size.width}, ${size.height});\n";
  customPainter +=
      "final double _xScaling = size.width / originalSize.width;\n";

  //Setting the gradient
  customPainter += "Paint paint = Paint();\n";
  customPainter +=
      "paint.shader = StampUI.gradients.fujiTopLeft.createShader(\n";
  customPainter += "Rect.fromCenter(\n";
  customPainter +=
      "center: Offset(originalSize.width / 2, originalSize.height / 2),\n";
  customPainter += "width: originalSize.width ,\n";
  customPainter += "height: originalSize.height,\n";
  customPainter += "),\n";
  customPainter += ");\n";

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
