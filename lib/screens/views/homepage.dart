import 'package:employed_view_page/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
    ));
  }
}
