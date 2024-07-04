import 'package:flutter/material.dart';
import 'package:huhu/ui/beranda.dart';
import '../service/login_service.dart'; // Sesuaikan dengan path yang benar
import '../service/login_service.dart';
import 'ui/beranda.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Admin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _usernameTextField(),
                      SizedBox(height: 20),
                      _passwordTextField(),
                      SizedBox(height: 40),
                      _tombolLogin(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
      ),
      controller: _usernameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      controller: _passwordCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            bool loginSuccess = await LoginService().login(username, password);
            if (loginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text("Username atau Password Tidak Valid"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  )
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            }
          }
        },
      ),
    );
  }
}
