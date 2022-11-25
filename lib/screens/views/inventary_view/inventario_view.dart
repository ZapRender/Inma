import 'package:employed_view_page/constants.dart';
import 'package:employed_view_page/screens/views/inventary_view/components/inventary.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class Inventary extends StatefulWidget {
  const Inventary({super.key});

  @override
  State<Inventary> createState() => _InventaryState();
}

class _InventaryState extends State<Inventary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(children: const [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            showInventary()
          ])),
    );
  }
}
