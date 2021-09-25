import 'package:flutter/material.dart';

class HeartIcon extends StatelessWidget {
  final Size size;
  final Color color;

  const HeartIcon(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _Painter(color), size: size);
  }
}

class _Painter extends CustomPainter {
  final Color color;

  _Painter(this.color);
  int _xScaling = 1;
  int _yScaling = 1;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(68.080886 * _xScaling, 3.1544674 * _yScaling);
    path.cubicTo(
      41.098858813255525 * _xScaling,
      3.158352886575416 * _yScaling,
      19.18896637647596 * _xScaling,
      24.37954412583933 * _yScaling,
      19.05039725731902 * _xScaling,
      50.64376134871445 * _yScaling,
    );
    path.lineTo(18.963788 * _xScaling, 50.643761 * _yScaling);
    path.cubicTo(
      18.998238 * _xScaling,
      51.144729 * _yScaling,
      19.040068 * _xScaling,
      51.647853999999995 * _yScaling,
      19.088299 * _xScaling,
      52.15188 * _yScaling,
    );
    path.cubicTo(
      19.291934251936603 * _xScaling,
      59.55114314611118 * _yScaling,
      21.260523193515994 * _xScaling,
      66.80293130622412 * _yScaling,
      24.83851803166875 * _xScaling,
      73.3342485049529 * _yScaling,
    );
    path.cubicTo(
      37.823795 * _xScaling,
      104.24602 * _yScaling,
      67.475358 * _xScaling,
      133.84477 * _yScaling,
      67.475358 * _xScaling,
      133.84477 * _yScaling,
    );
    path.cubicTo(
      67.475358 * _xScaling,
      133.84477 * _yScaling,
      101.81682 * _xScaling,
      102.09016000000001 * _yScaling,
      113.39295 * _xScaling,
      69.07438300000001 * _yScaling,
    );
    path.cubicTo(
      115.75140565375976 * _xScaling,
      63.50869931239183 * _yScaling,
      117.00692985963752 * _xScaling,
      57.55895428759475 * _yScaling,
      117.09329543511022 * _xScaling,
      51.53896835487854 * _yScaling,
    );
    path.cubicTo(
      117.0953 * _xScaling,
      51.50254800000001 * _yScaling,
      117.0963 * _xScaling,
      51.46608800000001 * _yScaling,
      117.0983 * _xScaling,
      51.42961500000001 * _yScaling,
    );
    path.cubicTo(
      117.1278 * _xScaling,
      50.85875100000001 * _yScaling,
      117.1426 * _xScaling,
      50.28871000000001 * _yScaling,
      117.1514 * _xScaling,
      49.72057800000001 * _yScaling,
    );
    path.lineTo(117.1009 * _xScaling, 49.72057800000001 * _yScaling);
    path.cubicTo(
      116.44948872865598 * _xScaling,
      23.821704252326086 * _yScaling,
      94.69470623846789 * _xScaling,
      3.1561615445024573 * _yScaling,
      68.08038734588163 * _xScaling,
      3.154477121720582 * _yScaling,
    );
    path.close();

    canvas.drawPath(
      path,
      Paint()..color = color,
    );

    /*canvas.drawPath(
      Path()
        ..moveTo(22.1595, 3.80852)
        ..cubicTo(19.6789, 1.35254, 16.3807, -4.809659999999999e-7, 12.8727,
            -4.809659999999999e-7)
        ..cubicTo(9.36452, -4.809659999999999e-7, 6.06642, 1.35254,
            3.5857900000000003, 3.80852)
        ..cubicTo(
            1.77297, 5.60333, 0.53896, 7.8599, 0.017188900000000007, 10.3343)
        ..cubicTo(-0.0738999, 10.7666, 0.20610900000000001, 11.1901,
            0.6426500000000002, 11.2803)
        ..cubicTo(1.07908, 11.3706, 1.50711, 11.0934, 1.5982, 10.661)
        ..cubicTo(2.05552, 8.49195, 3.13775, 6.51338, 4.72783, 4.9391)
        ..cubicTo(9.21893, 0.49283800000000005, 16.5262, 0.49272800000000005,
            21.0173, 4.9391)
        ..cubicTo(25.5082, 9.38548, 25.5082, 16.6202, 21.0173, 21.0667)
        ..cubicTo(16.5265, 25.5132, 9.21893, 25.5133, 4.72805, 21.0669)
        ..cubicTo(3.17644, 19.5307, 2.10538, 17.6035, 1.63081, 15.4937)
        ..cubicTo(
            1.53386, 15.0627, 1.10252, 14.7908, 0.6669700000000002, 14.887)
        ..cubicTo(0.23164500000000002, 14.983, -0.04272720000000001, 15.4103,
            0.05422050000000001, 15.8413)
        ..cubicTo(0.5956680000000001, 18.2481, 1.8168600000000001, 20.4461,
            3.5859, 22.1976)
        ..cubicTo(6.14623, 24.7325, 9.50955, 26.0, 12.8727, 26.0)
        ..cubicTo(16.236, 26.0, 19.5991, 24.7326, 22.1595, 22.1976)
        ..cubicTo(27.2802, 17.1277, 27.2802, 8.87841, 22.1595, 3.80852)
        ..close(),
      Paint()..color = color,
    );
    */
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return oldDelegate.color != this.color;
  }
}

class StampLogoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path x = Path();

    x.moveTo(22.1595, 3.80852);
    x.cubicTo(19.6789, 1.35254, 16.3807, -4.809659999999999e-7, 12.8727,
        -4.809659999999999e-7);
    x.cubicTo(9.36452, -4.809659999999999e-7, 6.06642, 1.35254,
        3.5857900000000003, 3.80852);
    x.cubicTo(1.77297, 5.60333, 0.53896, 7.8599, 0.017188900000000007, 10.3343);
    x.cubicTo(-0.0738999, 10.7666, 0.20610900000000001, 11.1901,
        0.6426500000000002, 11.2803);
    x.cubicTo(1.07908, 11.3706, 1.50711, 11.0934, 1.5982, 10.661);
    x.cubicTo(2.05552, 8.49195, 3.13775, 6.51338, 4.72783, 4.9391);
    x.cubicTo(9.21893, 0.49283800000000005, 16.5262, 0.49272800000000005,
        21.0173, 4.9391);
    x.cubicTo(25.5082, 9.38548, 25.5082, 16.6202, 21.0173, 21.0667);
    x.cubicTo(16.5265, 25.5132, 9.21893, 25.5133, 4.72805, 21.0669);
    x.cubicTo(3.17644, 19.5307, 2.10538, 17.6035, 1.63081, 15.4937);
    x.cubicTo(1.53386, 15.0627, 1.10252, 14.7908, 0.6669700000000002, 14.887);
    x.cubicTo(0.23164500000000002, 14.983, -0.04272720000000001, 15.4103,
        0.05422050000000001, 15.8413);
    x.cubicTo(0.5956680000000001, 18.2481, 1.8168600000000001, 20.4461, 3.5859,
        22.1976);
    x.cubicTo(6.14623, 24.7325, 9.50955, 26.0, 12.8727, 26.0);
    x.cubicTo(16.236, 26.0, 19.5991, 24.7326, 22.1595, 22.1976);
    x.cubicTo(27.2802, 17.1277, 27.2802, 8.87841, 22.1595, 3.80852);
    x.close();
    return x;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
