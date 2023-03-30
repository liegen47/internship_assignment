import 'package:dio_blog/ui/home/new_user_page.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Active users',
        style: TextStyle(
          fontSize: 20, // Change font size
          fontWeight: FontWeight.bold, // Add bold font weight
          letterSpacing: 1.2, // Add letter spacing
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white, // Set text color
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewUserPage(),
              ),
            );
          },
          child: const Text(
            'New Users',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Add bold font weight
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
