import 'package:employed_view_page/screens/shared/side_menu.dart';
import 'package:employed_view_page/screens/views/inventary_view/inventario_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Expanded(
                //default flex = 1
                child: SideMenu()),
            const Expanded(
                //it takes 5/6 parts pf the screen
                flex: 5,
                child: Inventary())
          ]),
    ));
  }
}
