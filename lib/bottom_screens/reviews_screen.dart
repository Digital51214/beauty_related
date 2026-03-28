import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.055,
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.118, // 👈 add this
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/helper3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.05,
                    right: w * 0.05,
                    top: h * 0.017,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Average Rating',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: baseSize * 0.035,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Total Reviews',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: baseSize * 0.035,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '4.9',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: baseSize * 0.06,
                            ),
                          ),

                          SizedBox(width: 5), // 👈 thoda gap

                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: baseSize * 0.06,
                              ),
                            ),
                          ),

                          Spacer(),

                          Text(
                            '128',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: baseSize * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.025), // ✅ vertical gap before the row
              Row(
                mainAxisSize: MainAxisSize.min,
                // Row ka height strictly children ke height tak rahe
                children: [
                  Container(
                    height: h * 0.05,
                    width: w * 0.26,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'All Reviews',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.05,
                    width: w * 0.21,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        '5 Stars',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.05,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        '4 Stars',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.05,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        '3 Stars',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.025),
              Container(
                height: h * 0.19,
                // 👈 thoda zyada height, taake text fit ho jaye
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/review.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: w*0.035,right: w*0.07), // 👈 thoda padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        // 👈 taake ListTile ke sides padding na le
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/review2.png',
                          ),
                        ),
                        title: Text(
                          'Elena Grace',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          '2 Days Ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (index) =>
                                Icon(Icons.star, color: Colors.amber, size: 20),
                          ),
                        ),
                      ),
                      Text(
                        'Sarah Did an amazing job with my bridal makeup!\nShe was punctual, professional and understood\nexactly the look I wanted.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: baseSize * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              Container(
                height: h * 0.19,
                // 👈 thoda zyada height, taake text fit ho jaye
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/review.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: w*0.035,right: w*0.07), // 👈 thoda padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        // 👈 taake ListTile ke sides padding na le
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/review2.png',
                          ),
                        ),
                        title: Text(
                          'Elena Grace',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          '2 Days Ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (index) =>
                                Icon(Icons.star, color: Colors.amber, size: 20),
                          ),
                        ),
                      ),
                      Text(
                        'Sarah Did an amazing job with my bridal makeup!\nShe was punctual, professional and understood\nexactly the look I wanted.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: baseSize * 0.035,
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
