import 'package:flutter/material.dart';
import 'package:navigation_tests/chat_list.dart';
import 'package:navigation_tests/chat_messages.dart';
import 'package:navigation_tests/models/chat.dart';
import 'package:navigation_tests/models/user.dart';
import 'package:navigation_tests/navigator_service.dart';
import 'package:navigation_tests/spotlight_feed.dart';
import 'package:navigation_tests/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersModel>(create: (_) => UsersModel()),
        ChangeNotifierProvider<ChatModel>(create: (_) => ChatModel()),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.rootKey,
        title: 'Flutter Navigation Tests',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            switch (settings.name) {
              case '/':
              case '/chat':
                return HomeScreen();
              default:
                return ErrorScreen('In root: ${settings.name}');
            }
          });
        },
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String message;

  ErrorScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error!'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Something went wrong:',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: NavigatorService.currentIndex,
        builder: (context, snapshot) {
          final index = snapshot.data ?? 2;
          return Scaffold(
            body: IndexedStack(
              index: index,
              children: [
                SearchScreen(),
                ChatScreen(),
                SpotlightScreen(),
                NotificationsScreen(),
                ProfileScreen()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                onTap: (index) {
                  NavigatorService.newIndex = index;
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), title: Text('Search')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat), title: Text('Chat')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star), title: Text('Spotlight')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications),
                      title: Text('Notifications')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text('Profile')),
                ]),
          );
        });
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Search screen',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center));
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorService.chatKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return ChatList();
            case '/chat':
              return ChatMessages(settings.arguments as Chat);
            default:
              return ErrorScreen('In Chat: ${settings.name}');
          }
        });
      },
    );
  }
}

class SpotlightScreen extends StatefulWidget {
  @override
  _SpotlightScreenState createState() => _SpotlightScreenState();
}

class _SpotlightScreenState extends State<SpotlightScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorService.spotlightKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case '/':
              return SpotlightFeed();
            case '/user':
              return UserDetails(settings.arguments as User);
            default:
              return ErrorScreen('In spotlight: ${settings.name}');
          }
        });
      },
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Notifications screen',
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.center,
    ));
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Profile screen',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center));
  }
}
