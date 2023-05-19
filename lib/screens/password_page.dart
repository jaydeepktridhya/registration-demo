import 'package:demo_provider/provider/registration_provider.dart';
import 'package:demo_provider/screens/gender_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    final TextEditingController password =
        TextEditingController(text: provider.registrationData.password);
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            provider.updatePassword(password.text);
                            provider.updatePasswordVisible();
                          },
                          icon: Icon(provider.registrationData.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off))),
                  obscureText: provider.registrationData.passwordVisible,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'password must be at least 6 character long.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  child: const Text('Next'),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      provider.updatePassword(password.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GenderPage()),
                      );
                    }
                    return;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
