import 'package:flutter/material.dart';

class Navigate {
  final BuildContext context;

  const Navigate(this.context);

  Future to(WidgetBuilder builder) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: builder));
  }
}