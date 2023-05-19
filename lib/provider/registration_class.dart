import 'package:shared_preferences/shared_preferences.dart';

class RegistrationData {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String gender = 'Male';
  bool passwordVisible = true;

  Future<void> saveToLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('gender', gender);
  }

  // Future<void> getFromLocalStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var firstName = prefs.getString('firstName');
  //   var lastName = prefs.getString('lastName');
  //   var emial = prefs.getString('email');
  //   var password = prefs.getString('password');
  //   var gender = prefs.getString('gender');
  // }
}
