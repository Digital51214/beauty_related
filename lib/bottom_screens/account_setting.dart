import 'package:beauty_related/bottom_screens/change_password_screen.dart';
import 'package:beauty_related/bottom_screens/edit_profile.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
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
                  GestureDetector(onTap: (){
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
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              SizedBox(height: h * 0.015),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Account Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.055,
                  ),
                ),
              ),
              SizedBox(height: h * 0.035),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Container(
                  height: h * 0.072,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/account1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.025,
                    ), // ✅ balanced padding
                    child: Row(
                      children: [
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: h * 0.055,
                          width: h * 0.055, // ✅ fixed (circle perfect)
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Icon(
                            Icons.north_east_outlined,
                            color: Colors.white,
                            size: baseSize * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
            );
          },
          child:
              Container(
                height: h * 0.072,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                // ✅ added (fix)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/account1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.025,
                  ), // ✅ balanced padding
                  child: Row(
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: h * 0.055,
                        width: h * 0.055, // ✅ fixed (circle perfect)
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(
                          Icons.north_east_outlined,
                          color: Colors.white,
                          size: baseSize * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(height: h * 0.015),
              Container(
                height: h * 0.072,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                // ✅ added (fix)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/account1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.025,
                  ), // ✅ balanced padding
                  child: Row(
                    children: [
                      Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: h * 0.055,
                        width: h * 0.055, // ✅ fixed (circle perfect)
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(
                          Icons.north_east_outlined,
                          color: Colors.white,
                          size: baseSize * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.025),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text('Logout', textAlign: TextAlign.center),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Color(0xFF692226)),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF692226),
                          ),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'SB',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  height: h * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/account2.png'),
                        height: h * 0.03,
                      ),
                      SizedBox(width: w * 0.01),
                      Text('Logout', style: TextStyle(color: Colors.white)),
                    ],
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
