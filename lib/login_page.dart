import 'package:flutter/material.dart';
import 'modalScreen.dart';
import 'Rounder_button.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = '';
  String enteredPassword = ''; // Track the entered password

  void updateEnteredPassword(String password) {
    setState(() {
      enteredPassword = password;
    });
  }

  void _showPasswordModal(BuildContext context) {
    final modalScreen = ModalScreen(
      updateEnteredPassword: updateEnteredPassword,
    );

    modalScreen.showPasswordModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade500,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100, left: 20, bottom: 20),
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Phone Number', 
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(
                                8.0), 
                            child: Image(
                              image: AssetImage('images/Flag_of_India.png'),
                              width: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Rounded_Button(
                      color: Colors.orange,
                      text: "Proceed",
                      onPressed: () {
                        if (phoneNumber.isNotEmpty) {
                          _showPasswordModal(context);
                        }
                      },
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
