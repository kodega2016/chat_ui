import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/widgets/people_list_item.dart';
import 'package:flutter/material.dart';

class PeopleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, i) => Divider(),
      itemCount: users.length,
      itemBuilder: (context, i) {
        final _user = users[i];
        return PeopleListItem(user: _user);
      },
    );
  }
}
