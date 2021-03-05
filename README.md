path\.moveTo\((.+), (.+)\);
path.moveTo($1 * _xScaling, $2*_yScaling);

path\.cubicTo\((.+),(.+),(.+),(.+),(.+),(.+)\);
path.cubicTo($1*_xScaling, $2*_yScaling, $3*_xScaling, $4*_yScaling, $5*_xScaling, $6*_yScaling,);

path\.lineTo\((.+), (.+)\);
path.lineTo($1 * _xScaling, $2 * _yScaling);