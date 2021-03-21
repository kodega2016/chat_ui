import 'package:meta/meta.dart';

class Message {
  final String content;
  final MessageType messageType;
  final DateTime date;
  final String senderId;

  Message({
    @required this.content,
    @required this.messageType,
    @required this.date,
    @required this.senderId,
  });
}

enum MessageType { Text, Image, Video, Voice }

var messages = <Message>[
  Message(
    content: '''Hello ;

Getting back to you regarding the gig you responded to

Looking For App Developers The Brief ----------- We would like to soft launch an app for Farming produce -The app should allow users to choose their produce and make a purchase online . One thing that is important we do not want to launch on google play store or app store as yet ?Is it possible to have the app on the phone as we would like to test it amongst our close colleagues first . We can share more about the brief once we choose to work together if this is up your ally respond firstly with the words "App Development " and then you may pitch''',
    messageType: MessageType.Text,
    date: DateTime.now().subtract(Duration(minutes: 15)),
    senderId: '1',
  ),
  Message(
    content: '''Hello
How can i help you?''',
    messageType: MessageType.Text,
    date: DateTime.now().subtract(Duration(minutes: 15)),
    senderId: '1',
  ),
  Message(
    content:
        'I have shortlisted yourself and 2 others wanted to just make a few queries before deciding is that ok ?',
    messageType: MessageType.Text,
    date: DateTime.now().subtract(Duration(minutes: 15)),
    senderId: '1',
  ),
];
