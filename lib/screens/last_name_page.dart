import 'package:demo_provider/provider/registration_provider.dart';
import 'package:demo_provider/screens/email_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    final formkey = GlobalKey<FormState>();
    final TextEditingController lname =
        TextEditingController(text: provider.registrationData.lastName);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Last Name"),
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
                  controller: lname,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  decoration: const InputDecoration(labelText: 'last Name'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a last name!';
                    }
                    if (value.length < 3) {
                      return 'last name must be at least 3 character long.';
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
                      provider.updateLastName(lname.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EmailPage()),
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
