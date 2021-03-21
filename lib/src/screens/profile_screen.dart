import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/auth_screen.dart';
import 'package:chat_ui/src/shared/k_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        elevation: 2.0,
      ),
      body: KRoundedContainer(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(users.first.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Khadga Bahadur Shrestha"),
                      Text("khadgalovecoding2016@gmail.com"),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Feather.edit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Sign Out'),
              trailing: Icon(Icons.exit_to_app),
              dense: true,
              onTap: () async {
                final _isYes = await KHelper.showConfirmDialog(
                      context: context,
                      title: 'Are you sure to sign out?',
                      content: 'You will be loggout from the app.',
                    ) ??
                    false;

                if (_isYes)
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => AuthScreen()),
                      (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
