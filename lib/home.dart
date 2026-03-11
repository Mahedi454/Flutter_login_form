import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
             children: [
               Image.network('https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
               height: 200,
               width: 200),
                Text('Welcome to Flutter Login App',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
               TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
            
                  ),
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
               ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter Your Password",
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  obscureText: true,
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Successful')),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(height: 16),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Don't have an account?",
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w500
                   ),

                     ),
                   TextButton(
                     style: TextButton.styleFrom(
                       overlayColor: Colors.transparent
                     ),
                     onPressed: () {},
                     child: Text('Sign Up',
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w500
                       ),),
                   ),
                 ],
               )

             ],
            ),
          ),
        ),
      ),
    );
  }
}
