import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import '../images.dart';
import 'spacing.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  final name = 'Sarah Abs';
  final email = 'sarah@abs.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
      ),
      child: Material(
        child: ListView(
          children: [
            buildHeader(
              urlImage: ImageNetworks.urlImage,
              name: name,
              email: email,
              onClicked: () {},
            ),
            const ExtraHeight(),
            buildSearchField(),
            const ExtraHeight(),
            buildMenuItem(
              // onClicked: () => AutoRouter.of(context).navigate(TodoRoute()),
              text: "Todo",
              icon: Icons.today_outlined,
            ),
            buildMenuItem(text: "favorite", icon: Icons.favorite),
            buildMenuItem(text: "settings", icon: Icons.settings),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.black54;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    VoidCallback? onClicked,
    required String text,
    required IconData icon,
  }) {
    const color = Colors.black54;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon),
      // title: Text(text, style: TextStyle(color: color)),
      title: Text(text),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PeoplePage(),
        // ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FavouritesPage(),
        // ));
        break;
    }
  }
}
