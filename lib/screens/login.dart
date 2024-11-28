import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:projek_akhir/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _correctUsername = 'mobile';
  final String _correctPassword = 'mobile';

  bool _showPassword = false; // State variable for password visibility
  bool _rememberMe = false; // State variable for "Remember Me" checkbox

  final _key = encrypt.Key.fromUtf8('my 32 length key................');
  final _iv = encrypt.IV.fromLength(16);

  late encrypt.Encrypter
      _encrypter; // Use 'late' to ensure it's initialized before use

  @override
  void initState() {
    super.initState();
    _encrypter = encrypt.Encrypter(encrypt.AES(_key));
  }

  void _login() async {
    final username = _usernameController.text;
    final encryptedUsername =
        _encrypter.encrypt(username, iv: _iv).base64; // Encrypt username
    print('Original username: $username');
    print('Encrypted username: $encryptedUsername'); // Print encrypted username

    final password = _passwordController.text;

    if (encryptedUsername ==
            _encrypter.encrypt(_correctUsername, iv: _iv).base64 &&
        password == _correctPassword) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString(
          'username', encryptedUsername); // Store encrypted username
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Username or Password is incorrect'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
        backgroundColor: const Color.fromARGB(255, 114, 174, 209),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/logo2.png',
                    height: 400), // Replace with your logo path
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(), // Outlined border
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0), // Padding
                ),
                style: GoogleFonts.poppins(), // Change font to Poppins
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(), // Outlined border
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0), // Padding
                ),
                obscureText: !_showPassword, // Toggle password visibility
                style: GoogleFonts.poppins(), // Change font to Poppins
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) =>
                            setState(() => _rememberMe = value!),
                      ),
                      Text('Remember Me',
                          style:
                              GoogleFonts.poppins()), // Change font to Poppins
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
