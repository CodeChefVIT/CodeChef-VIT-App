import 'package:CCApp/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CCApp/screens/login.dart';
import 'package:CCApp/providers/reg.dart';

import 'loading_screen.dart';

void main() => runApp(
      RestartWidget(
        child: MyApp(),
      ),
    );

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  bool videoCall = false;
  
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Reg(),
        )
      ],
      child: Consumer<Reg>(
        builder: (context, reg, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: reg.isReg
                ? HomePage()
                : FutureBuilder(
                    future: reg.tryAutoLogin(),
                    builder: (context, res) {
                      if (res.connectionState == ConnectionState.waiting) {
                        return LoadingScreen();
                      } else {
                        if (res.data) {
                          return HomePage();
                        } else {
                          return LoginScreen();
                        }
                      }
                    })),
      ),
    );
  }
}
