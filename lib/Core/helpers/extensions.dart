import 'package:flutter/material.dart';


extension Navigation on BuildContext {

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(
      String routeName, {
        dynamic result,
        Object? arguments,
      }) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName,
      bool Function(Route<dynamic>) predicate, {
        Object? arguments,
      }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop([dynamic result]) {
    Navigator.pop(this, result);
  }
}