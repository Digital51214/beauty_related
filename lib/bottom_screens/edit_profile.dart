import 'package:flutter/material.dart';

import 'image_picker_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
            image: AssetImage('assets/images/editprofile1.png'),
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
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.055,
                  ),
                ),
              ),
              SizedBox(height: h * 0.055),
              ImagePickerScreen(
                onPickImage: (pickedImage) {
                  setState(() {});
                },
              ),
              SizedBox(height: h * 0.115),
              Container(
                height: h * 0.055,
                width: w * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: w*0.05,top: h*0.01),
                  child: Text('Scarlet Jhonson', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: h * 0.01),
              Container(
                height: h * 0.055,
                width: w * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: w*0.05,top: h*0.01),
                  child: Text('Scarletjhonson@gmail.com', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: h * 0.018),
              Container(
                height: h * 0.058,
                width: w * 0.83,
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
