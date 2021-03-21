import 'package:chat_ui/src/models/message.dart';
import 'package:chat_ui/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ChatDetailScreen extends StatelessWidget {
  final User user;
  const ChatDetailScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(user.name),
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
          Container(
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          user.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user.online ? "Online" : "Offline",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: 50),
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
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey[200],
                    offset: Offset(0.2, 0.2),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Enter some messages...',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Send",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.black,
                          ),
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

class ChatListItem extends StatelessWidget {
  final bool isSent;
  final Message message;

  const ChatListItem({Key key, @required this.message, this.isSent})
      : super(key: key);

  _getContent(BuildContext context) {
    switch (message.messageType) {
      case MessageType.Text:
        return Text(
          message.content,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: isSent ? Colors.black : Colors.white),
        );

      case MessageType.Image:
        return Image.network(message.content, fit: BoxFit.cover);

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSent)
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/29916949?s=460&u=f854682a6880c61418e25f122e0a7f904e97190b&v=4',
                  ),
                ),
              const SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                child: _getContent(context),
                decoration: BoxDecoration(
                  color: isSent
                      ? Colors.grey[100]
                      : Theme.of(context).primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
