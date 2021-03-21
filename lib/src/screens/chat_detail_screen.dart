import 'package:chat_ui/src/models/message.dart';
import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/shared/k_avatar.dart';
import 'package:chat_ui/src/shared/k_shared.dart';
import 'package:chat_ui/src/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ChatDetailScreen extends StatefulWidget {
  final User user;
  const ChatDetailScreen({Key key, this.user}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _formOpen = false;

  void _toggleFormOpen() => setState(() => _formOpen = !_formOpen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.user.name),
        elevation: 2.0,
        actions: [
          IconButton(
            icon: Icon(Feather.phone_call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Feather.video),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: Icon(Feather.alert_circle),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Shared Media'),
                ),
                PopupMenuItem(
                  child: Text('Delete conversations'),
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          IgnorePointer(
            ignoring: _formOpen,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          KAvatar(
                            height: 100,
                            width: 100,
                            image: widget.user.avatar,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.user.name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.user.online ? "Online" : "Offline",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 60),
                      primary: false,
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, i) {
                        final _message = messages.reversed.toList()[i];
                        return ChatListItem(
                          message: _message,
                          isSent: i % 2 == 1,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (_formOpen)
                    KRoundedContainer(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // child: Wrap(
                        //   children: [
                        //     FormImagePreview(),
                        //     FormImagePreview(),
                        //     FormImagePreview(),
                        //   ],
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                icon: Icon(Feather.camera), onPressed: () {}),
                            SizedBox(width: 10),
                            IconButton(
                                icon: Icon(Feather.video), onPressed: () {}),
                            SizedBox(width: 10),
                            IconButton(
                                icon: Icon(Feather.mic), onPressed: () {}),
                            SizedBox(width: 10),
                            IconButton(
                                icon: Icon(Feather.file), onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  KRoundedContainer(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(_formOpen
                              ? Feather.x_circle
                              : Feather.plus_circle),
                          onTap: _toggleFormOpen,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Enter some messages...',
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Icon(Feather.send),
                          onTap: _toggleFormOpen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormImagePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, right: 20),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                'https://enterprise.affle.com/blog/wp-content/uploads/2020/07/Design-Thinking-Process.png',
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
              icon: Icon(Feather.x_circle, color: Colors.red),
              onPressed: () {}),
        ),
      ],
    );
  }
}
