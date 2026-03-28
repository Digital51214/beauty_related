import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        decoration: const BoxDecoration(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: const BoxDecoration(
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
                  const Spacer(),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: baseSize * 0.055,
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              SizedBox(height: h * 0.03),

              // Notification Card
              Container(
                height: h * 0.141,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/notifications1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04,
                    vertical: h * 0.005,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListTile bilkul upar
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 0,
                        leading: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/review2.png'),
                        ),
                        title: Text(
                          'Special Offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.05,
                          ),
                        ),
                        trailing: Text(
                          '2 h Ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: baseSize * 0.03,
                          ),
                        ),
                      ),

                      // Text turant ListTile ke neeche
                      Padding(
                        padding: EdgeInsets.only(left: w*0.15),
                        child: Text(
                          'Someone just shared their experience at\nSarah’s Glow Studio',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: baseSize * 0.034,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),

              // Notification Card
              Container(
                height: h * 0.141,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/notifications1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04,
                    vertical: h * 0.005,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListTile bilkul upar
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 0,
                        leading: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/home2.jpg'),
                        ),
                        title: Text(
                          'Appointment  confirmed',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.045,
                          ),
                        ),
                        trailing: Text(
                          '2 h Ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: baseSize * 0.03,
                          ),
                        ),
                      ),

                      // Text turant ListTile ke neeche
                      Padding(
                        padding: EdgeInsets.only(left: w*0.15),
                        child: Text(
                          'Someone just shared their experience at\nSarah’s Glow Studio',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: baseSize * 0.034,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),

              // Notification Card
              Container(
                height: h * 0.141,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/notifications1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.04,
                    vertical: h * 0.005,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListTile bilkul upar
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 0,
                        leading: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/review2.png'),
                        ),
                        title: Text(
                          'Discover ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.05,
                          ),
                        ),
                        trailing: Text(
                          '2 h Ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: baseSize * 0.03,
                          ),
                        ),
                      ),

                      // Text turant ListTile ke neeche
                      Padding(
                        padding: EdgeInsets.only(left: w*0.15),
                        child: Text(
                          'Someone just shared their experience at\nSarah’s Glow Studio',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: baseSize * 0.034,
                          ),
                        ),
                      ),
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
