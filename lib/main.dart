import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedapps/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    if (newuser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MyDashboard()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(" Shared Preferences"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: username_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              onPressed: () {
                String username = username_controller.text;
                String password = password_controller.text;
                if (username == 'test@gmail.com' && password == '123456789') {
                  logindata.setBool('login', false);
                  logindata.setString('username', username);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDashboard()));
                }
              },
              child: const Text("Log-In"),
            )
          ],
        ),
      ),
    );
  }
}
