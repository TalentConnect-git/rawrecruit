import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

/// A page shell that lays its children out from the TOP (not vertically
/// centered) and scrolls when the content is taller than the screen.
///
/// Drop-in replacement for `Wrapper` — same `title` + `children` API.
class TopScrollWrapper extends StatelessWidget {
  final String title;
  final List<Widget> children;

  /// Outer padding around the content.
  final EdgeInsetsGeometry padding;

  const TopScrollWrapper({
    super.key,
    this.title = "",
    required this.children,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secBorder,
      appBar: title.isEmpty
          ? null
          : AppBar(
              backgroundColor: AppColors.kBg,
              elevation: 0,
              title: Text(title, style: const TextStyle(color: Colors.white)),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            // 🔥 pins content to the top-left instead of centering it
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}
