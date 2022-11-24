import "package:flutter/material.dart";

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.access_alarm_outlined,
              ),
            ),
            DrawerListTile(
              title: "Inventario",
              icons: const Icon(Icons.accessible_sharp, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Facturas",
              icons:
                  const Icon(Icons.accessibility_sharp, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Productos",
              icons: const Icon(Icons.account_balance, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Usuario",
              icons:
                  const Icon(Icons.account_circle_sharp, color: Colors.white54),
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icons,
    required this.press,
  });

  final String title;
  final Icon icons;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icons,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
