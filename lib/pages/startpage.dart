import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

final login = TextEditingController();
final password = TextEditingController();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Hive.box("UserInfo");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          elevation: 3,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: height - 170,
              width: width - 50,
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onBackground,
                        BlendMode.srcIn),
                  ),
                ),
                Text(
                    style: Theme.of(context).textTheme.titleLarge,
                    'Авторизация'),
                Card(
                  margin: EdgeInsets.all(10),
                  elevation: 0,
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_4_outlined),
                          labelText: 'Логин'),
                      controller: login,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Пароль'),
                      controller: password,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Не зарегистрированы?'),
                          TextButton(onPressed: () {}, child: Text('Sign up'))
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          user.put('id', login.text);
                          context.go('/');
                        },
                        child: Text('Sign in'),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextButton(
                      onPressed: () {}, child: Text('Забыли пароль?',), ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}


    // return Scaffold(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   body: Container(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
    //       child: Card(
    //         semanticContainer: false,
    //         elevation: 3,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             SizedBox(
    //               width: 150,
    //               height: 150,
    //               child: SvgPicture.asset(
    //                 'assets/images/logo.svg',
    //                 colorFilter: ColorFilter.mode(
    //                     Theme.of(context).colorScheme.onBackground,
    //                     BlendMode.srcIn),
    //               ),
    //             ),
    //             Text(
    //                 style: Theme.of(context).textTheme.titleLarge,
    //                 'Authorization'),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 25),
    //               child: Card(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                       right: 12, left: 12, bottom: 14),
    //                   child: Column(
    //                     children: [
    //                       TextField(
    //                         decoration: InputDecoration(
    //                             prefixIcon: Icon(Icons.person_4_outlined),
    //                             labelText: 'Login'),
    //                         controller: login,
    //                       ),
    //                       TextField(
    //                         decoration: InputDecoration(
    //                             prefixIcon: Icon(Icons.lock_outline),
    //                             labelText: 'Password'),
    //                         controller: password,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 10),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Text('No account?'),
    //                       TextButton(onPressed: () {}, child: Text('Sign up'))
    //                     ],
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       user.put('id', login.text);
    //                       context.go('/');
    //                     },
    //                     child: Text('Sign in'),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
