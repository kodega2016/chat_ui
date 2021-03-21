import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/chat_detail_screen.dart';
import 'package:chat_ui/src/shared/k_avatar.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, i) => Divider(),
      itemCount: users.length,
      itemBuilder: (context, i) {
        final _user = users[i];
        return ListTile(
          title: Text(_user.name),
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
          subtitle: Text(
            _user.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            _user.lastActiveTimeStr,
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => ChatDetailScreen(
                        user: _user,
                      ))),
        );
      },
    );
  }
}
