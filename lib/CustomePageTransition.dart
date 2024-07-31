import 'package:flutter/material.dart';

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  final bool Function(String?) condition;
  final Duration duration;

  const CustomPageTransitionsBuilder({
    required this.condition,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (condition(route.settings.name)) {
      final Animation<double> customAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(customAnimation),
        child: child,
      );
    }
    return child;
  }
}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  final Duration customDuration;

  CustomPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.customDuration = const Duration(milliseconds: 500),
  }) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => customDuration;
}
