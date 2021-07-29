import 'package:flutter/material.dart';
import 'package:flutter_image_detection/pages/login/login_provider.dart';
import 'package:flutter_image_detection/pages/login/widgets/side_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This way you can access the page state
    final state = ref.watch(loginNotifierProvider);

    // This way cou can access the page provider
    final provider = ref.watch(loginNotifierProvider.notifier);

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: Text(
                  'MWAY Challenge',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
