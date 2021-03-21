import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/auth_scrren.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        elevation: 2.0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0.4, 0.2),
            )
          ],
        ),
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
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
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
