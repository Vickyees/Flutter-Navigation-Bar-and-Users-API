import 'package:flutter/material.dart';

import 'package:vignesh/screens/user_details_screen.dart';

class UserCard extends StatelessWidget {
  final Map user;
  const UserCard(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (user['id'] == 1) {
          Navigator.of(context).push(_createRoute(user['name']));
        }
      },
      child: Card(
        child: ListTile(
          leading: Image.asset("assets/images/${user['id']}.png"),
          title: Text(
            user["name"],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("@${user['username']}"),
          trailing: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.7),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            child: const Text(
              "View",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute(String name) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          UserDetailsScreen(name: name),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
