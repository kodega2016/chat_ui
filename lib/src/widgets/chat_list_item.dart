import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_ui/src/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (ctx) => Scaffold(
                  appBar: AppBar(),
                  body: Column(
                    children: [
                      Image.network(message.content),
                    ],
                  ),
                ),
              ),
            );
          },
          child: CachedNetworkImage(
              imageUrl: message.content,
              placeholder: (ctx, _) => Text('Loading...')),
        );

      case MessageType.Video:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: IconButton(
            icon: Icon(
              Feather.video,
              color: isSent ? Colors.black : Colors.white,
            ),
            onPressed: () {},
          ),
        );

      case MessageType.Voice:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            icon: Icon(
              Feather.mic,
              color: isSent ? Colors.black : Colors.white,
            ),
            onPressed: () {},
          ),
        );

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
                  backgroundColor: Colors.grey[100],
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
