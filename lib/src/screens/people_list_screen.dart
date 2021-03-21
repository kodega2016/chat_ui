import 'package:chat_ui/src/models/user.dart';
import 'package:flutter/material.dart';

class PeopleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        final _user = users[i];
        return ListTile(
          title: Text(_user.name),
          subtitle: Text('${_user.name} is active'),
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(_user.avatar),
              ),
              if (_user.online)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
