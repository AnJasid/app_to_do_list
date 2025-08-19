import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_to_do_list/screens/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _goToSignUpScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue[800],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Enter a beautiful world',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Your Email',
                            hintText: 'example@email.com',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outline),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            print('Hello');
                          },
                          child: Text(
                            'forget password',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: "Don't Have An Account? "),
                              TextSpan(
                                text: 'Sign Up Now',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _goToSignUpScreen(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
