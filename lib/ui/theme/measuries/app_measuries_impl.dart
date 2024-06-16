import 'package:flutter/widgets.dart' show BuildContext;
import 'package:portfolio/ui/ui.dart';

class AppMeasuriesImpl implements AppMeasuries {
  AppMeasuriesImpl({
    double factor = 1,
    double noneValue = 0,
    double borderRadiusSmallValue = 8,
    double borderRadiusMediumValue = 16,
    double borderRadiusLargeValue = 24,
    double paddingSmallValue = 8.0,
    double paddingMediumValue = 16.0,
    double paddingLargeValue = 24.0,
    double paddingExtraLargeValue = 32.0,
    double maxWidthValue = 1400,
  })  : _factor = factor <= 0 ? 1 : factor,
        _noneValue = noneValue,
        _borderRadiusSmallValue = borderRadiusSmallValue,
        _borderRadiusMediumValue = borderRadiusMediumValue,
        _borderRadiusLargeValue = borderRadiusLargeValue,
        _paddingSmallValue = paddingSmallValue,
        _paddingMediumValue = paddingMediumValue,
        _paddingLargeValue = paddingLargeValue,
        _paddingExtraLargeValue = paddingExtraLargeValue,
        _maxWidthValue = maxWidthValue;

  final double _factor;
  final double _noneValue;

  final double _borderRadiusSmallValue;
  final double _borderRadiusMediumValue;
  final double _borderRadiusLargeValue;

  final double _paddingSmallValue;
  final double _paddingMediumValue;
  final double _paddingLargeValue;
  final double _paddingExtraLargeValue;
  final double _maxWidthValue;

  BuildContext? _context;

  @override
  double get none => _noneValue;

  @override
  double get borderRadiusSmall => _borderRadiusSmallValue * _factor;

  @override
  double get borderRadiusMedium => _borderRadiusMediumValue * _factor;

  @override
  double get borderRadiusLarge => _borderRadiusLargeValue * _factor;

  @override
  double get paddingSmall => _paddingSmallValue * _factor;

  @override
  double get paddingMedium => _paddingMediumValue * _factor;

  @override
  double get paddingLarge => _paddingLargeValue * _factor;

  @override
  double get paddingExtraLarge => _paddingExtraLargeValue * _factor;

  @override
  double get maxWidth => _maxWidthValue;

  @override
  double get screenWidth => _context?.appSize.width ?? 0;

  @override
  void setContext(BuildContext context) => _context = context;
}
