import 'package:flutter/material.dart';

class MyWidget {
  static SizedBox mySizedBox({required double size, required String type}) {
    if (type == 'h') {
      return SizedBox(
        height: size,
      );
    } else {
      return SizedBox(
        width: size,
      );
    }
  }
}

class WidgetCheckExpanded extends StatelessWidget {
  final Widget child;
  final double? maxSize;

  const WidgetCheckExpanded({
    Key? key,
    required this.child,
    this.maxSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= (maxSize ?? 768)) {
      return Expanded(child: child);
    } else {
      return child;
    }
    //return ;
  }
}

class OrientationSwitcher extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? maxSize;

  const OrientationSwitcher(
      {Key? key, required this.children, this.crossAxisAlignment, this.maxSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return size < (maxSize ?? 768)
        ? Column(children: children) /*Column(children: children)*/
        : Row(
            children: children,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          );
  }
}
