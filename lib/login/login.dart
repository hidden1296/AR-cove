import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home/home.dart';
import '../sign_up/sign_up.dart'; // Import your HomePage here
 // Import your SignUpPage here

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Simulate login logic
        print("User logged in with Email: ${_emailController.text}");
        // Navigate to the HomePage or show a success message
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildWelcomeSection(),
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  _buildLoginForm(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB46146), Color(0xFF000000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Welcome Back!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // Adjust width here
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTextField(_emailController, 'Email', validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            }),
            const SizedBox(height: 20.0),
            _buildTextField(_passwordController, 'Password', obscureText: true, validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            }),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB46146),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text(
                'Don\'t have an account? Sign Up!',
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Login with',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook, size: 30),
                  color: Colors.blue,
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.google, size: 30),
                  color: Colors.red,
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.apple, size: 30),
                  color: Colors.black,
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false, required String? Function(dynamic value) validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
