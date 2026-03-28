import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obsecurePassword = true;
  bool _obsecurenewPassword = true;
  bool _obsecureconfirmnewPassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/profile5.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.025,
            right: w * 0.025,
            top: h * 0.055,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/helper2.png'),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.02),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: baseSize * 0.055,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: baseSize * 0.055,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              Image(
                image: AssetImage('assets/images/changepassword.png'),
                height: baseSize * 0.6,
                width: w * 0.6,
              ),
              SizedBox(height: h * 0.06),
              Padding(
                padding: EdgeInsets.only(left: w * 0.075),
                child: Row(
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: baseSize * 0.055,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.075),
                child: Row(
                  children: [
                    Text(
                      'Enter New Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: baseSize * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.02),
              SizedBox(
                width: w * 0.8, // 👈 width kam kar di
                height: baseSize * 0.13, // 👈 height control
                child: TextFormField(
                  obscureText: _obsecurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter Old Password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: baseSize * 0.04,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: baseSize * 0.02, // 👈 height aur fine tune
                      horizontal: baseSize * 0.04,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecurenewPassword = !_obsecurenewPassword;
                        });
                      },
                      icon: Icon(
                        _obsecurenewPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: baseSize * 0.075,
                      ),
                      color: Color(0xFFbCDCDCD),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              SizedBox(
                width: w * 0.8, // 👈 width kam kar di
                height: baseSize * 0.13, // 👈 height control
                child: TextFormField(
                  obscureText: _obsecurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter New Password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: baseSize * 0.04,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: baseSize * 0.02, // 👈 height aur fine tune
                      horizontal: baseSize * 0.04,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecurePassword = !_obsecurePassword;
                        });
                      },
                      icon: Icon(
                        _obsecurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: baseSize * 0.075,
                      ),
                      color: Color(0xFFbCDCDCD),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              SizedBox(
                width: w * 0.8, // 👈 width kam kar di
                height: baseSize * 0.13, // 👈 height control
                child: TextFormField(
                  obscureText: _obsecurePassword,
                  decoration: InputDecoration(
                    hintText: 'Confirm New Password....',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: baseSize * 0.04,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: baseSize * 0.02, // 👈 height aur fine tune
                      horizontal: baseSize * 0.04,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecureconfirmnewPassword =
                              !_obsecureconfirmnewPassword;
                        });
                      },
                      icon: Icon(
                        _obsecureconfirmnewPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: baseSize * 0.075,
                      ),
                      color: Color(0xFFbCDCDCD),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 0.5,),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white,width: 0.5,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              Container(
                height: h * 0.06,
                width: w * 0.8,
                // ✅ added (fix)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/editprofile2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.025,
                  ), // ✅ balanced padding
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
