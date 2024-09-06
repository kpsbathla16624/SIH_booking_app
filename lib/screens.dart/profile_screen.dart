import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage('assets/images/img_7.jpg'),  
                      backgroundColor: Colors.grey.shade300,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blueAccent,
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                          onPressed: () {
                            // Handle edit action
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditProfilePage()), // Navigate to edit profile page
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Profile Information
                const Text(
                  'John Doe',  // Replace with dynamic name
                  style:  TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'johndoe@example.com',  // Replace with dynamic email
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                // Menu Options
                ProfileMenuItem(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    // Handle settings action
                  },
                ),
                ProfileMenuItem(
                  title: 'Notification Preferences',
                  icon: Icons.notifications,
                  onTap: () {
                    // Handle notification preferences action
                  },
                ),
                ProfileMenuItem(
                  title: 'Terms and Conditions',
                  icon: Icons.description,
                  onTap: () {
                    // Handle terms and conditions action
                  },
                ),
                ProfileMenuItem(
                  title: 'User Management',
                  icon: Icons.manage_accounts,
                  onTap: () {
                    // Handle user management action
                  },
                ),
                ProfileMenuItem(
                  title: 'Logout',
                  icon: Icons.logout,
                  textColor: Colors.red,
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle logout action
                Navigator.of(context).pop(); // Dismiss dialog
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color textColor;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor = Colors.black,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      onTap: onTap,
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Text('Edit Profile Page'),
      ),
    );
  }
}
