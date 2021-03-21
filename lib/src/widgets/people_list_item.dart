import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/chat_detail_screen.dart';
import 'package:chat_ui/src/shared/k_shared.dart';
import 'package:flutter/material.dart';

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({
    Key key,
    @required User user,
  })  : _user = user,
        super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_user.name),
      subtitle: Text('${_user.name} is active'),
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => ChatDetailScreen(user: _user))),
      leading: Stack(
        children: [
          KAvatar(image: _user.avatar),
          if (_user.online)
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }
}
