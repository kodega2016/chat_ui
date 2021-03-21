class User {
  final String name;
  final String avatar;
  final String lastMessage;
  final DateTime lastActiveTime;
  final bool online;

  User({
    this.name,
    this.avatar,
    this.lastMessage,
    this.lastActiveTime,
    this.online,
  });

  String get lastActiveTimeStr =>
      '${DateTime.now().difference(lastActiveTime).inMinutes} minute ago';
}

var users = <User>[
  User(
    name: 'Khadga Bahadur Shrestha',
    avatar:
        'https://avatars.githubusercontent.com/u/29916949?s=460&u=f854682a6880c61418e25f122e0a7f904e97190b&v=4',
    lastActiveTime: DateTime.now().subtract(
      Duration(minutes: 10),
    ),
    lastMessage:
        'Hello How are you? Are you ready to get started with flutter.',
    online: true,
  ),
  User(
    name: 'Sakar Subedi',
    avatar: 'https://www.paailatechnologies.com/img/sakar.jpg',
    lastActiveTime: DateTime.now().subtract(
      Duration(minutes: 4),
    ),
    lastMessage: 'Hello bro,What is the status of the stoty MVP-123?',
    online: false,
  ),
];
