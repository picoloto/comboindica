import 'package:comboindica/states/application_state.dart';
import 'package:comboindica/utils/theme_utils.dart';
import 'package:comboindica/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/game.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeUtils.getThemeData(context),
    );
  }
}

List<Game>? _games = [];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApplicationState>(context);

    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(provider),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/LOGO_INDICA.png',
            fit: BoxFit.contain,
            height: 72,
          ),
        ],
      ),
      backgroundColor: BACKGROUND_COLOR,
      elevation: 0,
      centerTitle: true,
    );
  }

  Center _getBody(ApplicationState provider) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ApplicationState>(
              builder: (context, appState, _) {
                if (appState.randomGame!.image.isNotEmpty) {
                  return _getImageClip(
                    Image.network(
                      appState.randomGame!.image,
                      fit: BoxFit.cover,
                      height: 340,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) return CustomLoading();
                        return child;
                      },
                    ),
                  );
                } else {
                  return _getImageClip(
                    Image.asset(
                      "images/control.png",
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                }
              },
            ),
            Consumer<ApplicationState>(
              builder: (context, appState, _) {
                return Text(
                  appState.randomGame!.name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                );
              },
            ),
            ElevatedButton(
              onPressed: provider.generateRandomGame,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16))),
              child: Text(
                'ME INDICA UM JOGO AE COMBO!',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _getImageClip(Image image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: image,
    );
  }
}
