import 'package:fefu_fitness/okno.dart';
import 'package:fefu_fitness/pages/abon.dart';
import 'package:fefu_fitness/pages/homepage.dart';
import 'package:fefu_fitness/pages/startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';

import 'package:go_router/go_router.dart';

var user;

Future<void> main() async {
  await Hive.initFlutter();
  user = await Hive.openBox('UserInfo');
  return runApp(MyApp());
}

// GoRouter configuration

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final _router = GoRouter(
      redirect: (context, state) {
        return user.get('id') == null ? '/signin' : null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MainPage(),
        ),
        GoRoute(path: '/signin', builder: (context, state) => LoginPage())
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 197, 199, 206),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Color.fromRGBO(65, 46, 254, 1),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page = 0.obs();
    return Observer(builder: (_) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: page.value,
          onDestinationSelected: (value) =>
              runInAction(() => page.value = value),
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Расписание',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.local_atm),
              icon: Icon(Icons.local_atm_outlined),
              label: 'Абонимент',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: 'Профиль',
            ),
          ],
        ),
        body: [
          HomePage(),
          Scaffold(),
          AbonPage(),
          ProfilePage(),
        ][page.value],
      );
    });
  }
}
