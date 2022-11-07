import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedapps/main.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  late SharedPreferences logindata;
  String? username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome\n$username',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLoginPage()));
              },
              child: const Text('LogOut'),
            )
          ],
        ),
      ),
    );
  }
}
