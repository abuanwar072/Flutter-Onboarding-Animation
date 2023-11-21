import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create an account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.mail,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            const SizedBox(height: 200),
            Center(
              child: Text(
                "Already have an account? Sign in.",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade300),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool hidden;

  const _TextField({
    Key? key,
    required this.label,
    required this.icon,
    this.hidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.pink.shade400,
              obscureText: hidden,
              autocorrect: !hidden,
              enableSuggestions: !hidden,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18,
                ),
                suffixIcon: Icon(
                  icon,
                  color: Colors.grey.shade400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
