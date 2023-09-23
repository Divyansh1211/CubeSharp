import 'package:cubesharp_assignment/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'Rounder_button.dart';

class ModalScreen {
  final Function(String) updateEnteredPassword;

  ModalScreen({required this.updateEnteredPassword});
  void showPasswordModal(BuildContext context) {
    String enteredPassword = ''; // Track the entered password

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true, // To hide the password text
                onChanged: (value) {
                  enteredPassword = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Rounded_Button(
                  BR: 15,
                  mW: 150,
                  color: Colors.orange,
                  text: 'Verify Password',
                  onPressed: () {
                    if (enteredPassword == 'test@78563') {
                      updateEnteredPassword(enteredPassword);

                      Navigator.pushNamed(
                        context,
                        CatalogueScreen.id,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid Password'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
