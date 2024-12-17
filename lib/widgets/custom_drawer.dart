import 'package:flutter/material.dart';

class ExpandableDrawerMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<DrawerSubmenuItem> submenuItems;
  final bool initiallyExpanded;

  const ExpandableDrawerMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.submenuItems,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: TextStyle(color: Colors.red),
      ),
      initiallyExpanded: initiallyExpanded,
      children: submenuItems,
    );
  }
}

class DrawerSubmenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerSubmenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 72.0, right: 16.0),
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.blue.shade900,
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.blue,
              ),
            ),
            accountName: Text(
              'Dwi Wijonarko',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text('dwi-wijonarko@gmail.com'),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.grey),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpandableDrawerMenu(
            icon: Icons.person,
            title: 'User Menu',
            initiallyExpanded: true,
            submenuItems: [
              DrawerSubmenuItem(
                icon: Icons.app_registration,
                title: 'Register',
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation to Register page
                },
              ),
              DrawerSubmenuItem(
                icon: Icons.subscriptions,
                title: 'Subscriptions',
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation to Subscriptions page
                },
              ),
              DrawerSubmenuItem(
                icon: Icons.task,
                title: 'Tasks',
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation to Tasks page
                },
              ),
              DrawerSubmenuItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  Navigator.pop(context);
                  // Add logout logic
                },
              ),
            ],
          ),
          ExpandableDrawerMenu(
            icon: Icons.mail,
            title: 'Mail',
            submenuItems: [
              DrawerSubmenuItem(
                icon: Icons.inbox,
                title: 'Inbox',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrawerSubmenuItem(
                icon: Icons.send,
                title: 'Sent',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrawerSubmenuItem(
                icon: Icons.delete,
                title: 'Trash',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
