import 'dart:math';

import 'package:flutter/material.dart';
import 'package:website/styles.dart';

class WelcomePageLayout {
  final BuildContext context;
  late final double _widthPx;
  late final double columnBreakPt;
  late final bool _twoColumnMode;
  late double _contentWidth;
  late final ButtonStyle style;

  WelcomePageLayout(this.context) {
    _widthPx = MediaQuery.of(context).size.width;
    columnBreakPt = PageBreaks.TabletLandscape - 100;
    _twoColumnMode = _widthPx > columnBreakPt;
    _contentWidth = _twoColumnMode ? 300 : double.infinity;

    if (_twoColumnMode) {
      // For every 100px > the PageBreak add some panel width. Cap at some max width.
      double maxWidth = 700;
      _contentWidth += min(maxWidth, _widthPx * .15);
    }

    style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  }

  bool get twoColumnMode => _twoColumnMode;

  double get contentWidth => twoColumnMode ? _contentWidth : _widthPx;
}
