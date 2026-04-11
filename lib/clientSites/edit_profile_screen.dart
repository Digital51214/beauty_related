import 'dart:ui';
import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../OwnersSite/image_picker_screen.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/glass_effect.dart';
class ClientEditProfile extends StatefulWidget {
  const ClientEditProfile({super.key});
  @override
  State<ClientEditProfile> createState() => _ClientEditProfileState();
}

class _ClientEditProfileState extends State<ClientEditProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    final double fieldHeight = h * 0.06;
    final double fieldFontSize = baseSize * 0.037;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: w * 0.035, vertical: h * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: GlassCard(
                        borderRadius: 50,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white, size: baseSize * 0.055),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset('assets/images/MainLogo.png',
                        height: baseSize * 0.12, width: baseSize * 0.12),
                  ],
                ),
                SizedBox(height: h * 0.02),
                Text('Edit Profile',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: baseSize * 0.062)),
                SizedBox(height: h * 0.02),
                Center(
                  child: ImagePickerScreen(
                      onPickImage: (img) => setState(() {})),
                ),
                SizedBox(height: h * 0.025),

                // Main card
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/MainLogo.png"),
                      fit: BoxFit.contain)
                  ),
                  child: GlassCard1(
                    borderRadius: 35,
                    blurSigma: 5,
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.06, vertical: h * 0.03),
                    child: Column(
                      children: [
                        _buildField(hintText: 'Scarlet Jhonson',
                            keyboardType: TextInputType.name,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize, w: w),
                        SizedBox(height: h * 0.015),
                        _buildField(hintText: 'Scarletjhonson@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize, w: w),
                        SizedBox(height: h * 0.015),
                        _buildField(hintText: '07093753487',
                            keyboardType: TextInputType.phone,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize, w: w),
                        SizedBox(height: h * 0.015),
                        _buildField(hintText: 'Makeup',
                            keyboardType: TextInputType.text,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize, w: w),
                        SizedBox(height: h * 0.015),
                        GlassCard(
                          borderRadius: 20,
                          tintOpacity: 0.10,
                          child: SizedBox(
                            width: double.infinity,
                            height: h * 0.1,
                            child: TextFormField(
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fieldFontSize),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: w * 0.05,
                                    vertical: h * 0.015),
                                border: InputBorder.none,
                                hintText: 'Description...',
                                hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: fieldFontSize),
                              ),
                              cursorColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.025),
                        CustomButton(title: 'Update', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String hintText,
    required TextInputType keyboardType,
    required double fieldHeight,
    required double fieldFontSize,
    required double w,
  }) {
    return GlassCard(
      borderRadius: 30,
      tintOpacity: 0.10,
      child: SizedBox(
        height: fieldHeight,
        child: TextFormField(
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.white, fontSize: fieldFontSize),
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 0),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.white70, fontSize: fieldFontSize),
          ),
          cursorColor: Colors.white,
        ),
      ),
    );
  }
}
