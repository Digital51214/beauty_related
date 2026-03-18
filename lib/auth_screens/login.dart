import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:beauty_related/custom_widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.1, top: h * 0.3, right: w * 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'B',
                      fontSize: baseSize * 0.065,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.005),
              Row(
                children: [
                  Text(
                    'Welcome Back! Enter Your Account Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'R',
                      fontSize: baseSize * 0.037,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.01),
              CustomTextformfield(
                title: 'Email Address...',
                controller: _userNameController,
                KeyBoardType: TextInputType.text,
              ),
              SizedBox(height: h*0.01),
              CustomTextformfield(
                title: 'Password....',
                controller: _passwordController,
                KeyBoardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: h*0.01),
              Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                    value: checked,
                    onChanged: (value) {
                      setState(() {
                        checked = value!;
                      });
                    },
                    fillColor: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.selected)
                          ? const Color(0xFF000000)
                          : Colors.transparent,
                    ),
                    checkColor: Colors.white,
                  ),
                  Text(
                    "Remember Me",
                    style: TextStyle(
                      fontFamily: 'R',
                      fontWeight: FontWeight.w400,
                      fontSize: baseSize * 0.038,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ForgetPassword(),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: 'B',
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: baseSize * 0.038,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.025),
              CustomButton(title: 'Sign In', onPressed:(){

              } ),
              SizedBox(height: h*0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'R',
                      fontSize: baseSize * 0.038,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SignUp()),
                      // );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: baseSize * 0.045,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
