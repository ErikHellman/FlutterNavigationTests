import 'package:flutter/material.dart';
import 'package:navigation_tests/models/chat.dart';
import 'package:rxdart/rxdart.dart';

class NavigatorService {
  // ignore: close_sinks
  static BehaviorSubject<int> _indexSubject = BehaviorSubject.seeded(2);

  static Stream<int> get currentIndex => _indexSubject;
  static set newIndex(int index) => _indexSubject.value = index;

  static final GlobalKey<NavigatorState> rootKey =
      GlobalKey<NavigatorState>(debugLabel: 'Root');
  static final GlobalKey<NavigatorState> searchKey =
      GlobalKey<NavigatorState>(debugLabel: 'Search');
  static final GlobalKey<NavigatorState> chatKey =
      GlobalKey<NavigatorState>(debugLabel: 'Chat');
  static final GlobalKey<NavigatorState> spotlightKey =
      GlobalKey<NavigatorState>(debugLabel: 'Spotlight');
  static final GlobalKey<NavigatorState> notificationsKey =
      GlobalKey<NavigatorState>(debugLabel: 'Notifications');
  static final GlobalKey<NavigatorState> profileKey =
      GlobalKey<NavigatorState>(debugLabel: 'Profile');

  static void showChat(Chat chat) {
    newIndex = 1;
    chatKey.currentState.pushNamed('/chat', arguments: chat);
  }
}
