import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/profile_screen.dart';
import 'package:chat_ui/src/shared/k_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/screens/auth_screen.dart';
import 'src/screens/chat_list_screen.dart';
import 'src/screens/people_list_screen.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff000F02),
        accentColor: Color(0xff523200),
        fontFamily: GoogleFonts.padauk().fontFamily,
      ),
      home: AuthScreen(),
    );
  }
}

class PageItem {
  final String title;
  final Widget page;

  PageItem(this.title, this.page);
}

class PageSetup extends StatefulWidget {
  @override
  _PageSetupState createState() => _PageSetupState();
}

class _PageSetupState extends State<PageSetup> {
  int _currentScreen = 0;
  void _changeScreen(i) => setState(() => _currentScreen = i);
  var pages = <PageItem>[
    PageItem(
      'Chats',
      ChatListScreen(),
    ),
    PageItem(
      'People',
      PeopleListScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          "${pages[_currentScreen].title}",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ProfileScreen(),
              fullscreenDialog: true,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: KAvatar(
              image: users.first.avatar,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentScreen,
        elevation: 4.0,
        onTap: _changeScreen,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Icon(Feather.message_circle),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "6",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.users),
            label: 'People',
          ),
        ],
      ),
      body: pages[_currentScreen].page,
    );
  }
}
