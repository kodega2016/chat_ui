import 'package:chat_ui/src/models/user.dart';
import 'package:chat_ui/src/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/screens/auth_scrren.dart';
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
        primaryColor: Color(0xff50297A),
        accentColor: Color(0xff0C0B22),
        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
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
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.alef().fontFamily,
              ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ProfileScreen(),
              fullscreenDialog: true,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 8, 8, 8),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(users.first.avatar),
                fit: BoxFit.cover,
              ),
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
                    // height: 10,
                    // width: 10,
                    child: Text(
                      "10",
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
