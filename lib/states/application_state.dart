import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comboindica/domain/game.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class ApplicationState extends ChangeNotifier {
  List<Game>? _games;

  List<Game>? get games => _games;

  Game? _randomGame;

  Game? get randomGame => _randomGame;

  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();
    await _getgames();
  }

  Future<void> _getgames() async {
    FirebaseFirestore.instance
        .collection('games')
        .snapshots()
        .listen((snapshot) async {
      _games = [];
      for (final document in snapshot.docs) {
        _games!.add(
          Game(document.data()['name'] as String,
              document.data()['image'] as String),
        );
      }
      notifyListeners();
      generateRandomGame();
    });
  }

  void generateRandomGame() {
    var random = Random().nextInt(_games!.length);
    _randomGame = _games![random];
    notifyListeners();
  }
}
