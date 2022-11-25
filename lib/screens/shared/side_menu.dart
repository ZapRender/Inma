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
            DrawerHeader(
                child: Row(
              children: const [
                Icon(
                  Icons.sports_bar,
                  color: Colors.white,
                  size: 70,
                ),
                Text(
                  'INMA',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                )
              ],
            )),
            DrawerListTile(
              title: "Inventario",
              icons:
                  const Icon(Icons.inventory_outlined, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Facturas",
              icons: const Icon(Icons.keyboard_alt_outlined,
                  color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Productos",
              icons:
                  const Icon(Icons.sports_bar_outlined, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Cuadre",
              icons:
                  const Icon(Icons.local_atm_outlined, color: Colors.white54),
              press: () {},
            ),
            DrawerListTile(
              title: "Usuario",
              icons: const Icon(Icons.person_2_outlined, color: Colors.white54),
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
