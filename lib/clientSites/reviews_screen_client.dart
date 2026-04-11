import 'package:flutter/material.dart';
import 'dart:ui';

class ClientReviewsScreen extends StatefulWidget {
  const ClientReviewsScreen({super.key});

  @override
  State<ClientReviewsScreen> createState() => _ClientReviewsScreenState();
}

class _ClientReviewsScreenState extends State<ClientReviewsScreen> {
  String selectedFilter = 'All Reviews';
  final List<String> filters = ['All Reviews', '5 Stars', '4 Stars', '3 Stars'];

  final List<Map<String, dynamic>> allReviews = [
    {'name': 'Elena Grace', 'timeAgo': '2 Days Ago', 'review': 'Sarah Did an amazing job with my bridal makeup! She was punctual, professional and understood exactly the look I wanted.', 'stars': 5, 'avatar': 'assets/images/review2.png'},
    {'name': 'Sofia Malik', 'timeAgo': '5 Days Ago', 'review': 'Really loved the experience! The makeup lasted all day and I got so many compliments.', 'stars': 5, 'avatar': 'assets/images/review2.png'},
    {'name': 'Ayesha Khan', 'timeAgo': '1 Week Ago', 'review': 'Good service overall. The look was nice but took a little longer than expected.', 'stars': 4, 'avatar': 'assets/images/review2.png'},
    {'name': 'Nadia Hussain', 'timeAgo': '2 Weeks Ago', 'review': 'Decent work. I had some specific requests that were mostly met.', 'stars': 4, 'avatar': 'assets/images/review2.png'},
    {'name': 'Zara Ahmed', 'timeAgo': '3 Weeks Ago', 'review': 'Average experience. The makeup was okay but not exactly what I had in mind.', 'stars': 3, 'avatar': 'assets/images/review2.png'},
    {'name': 'Hina Baig', 'timeAgo': '1 Month Ago', 'review': 'It was fine. Nothing exceptional but the service was polite and on time.', 'stars': 3, 'avatar': 'assets/images/review2.png'},
  ];

  List<Map<String, dynamic>> get filteredReviews {
    if (selectedFilter == 'All Reviews') return allReviews;
    if (selectedFilter == '5 Stars') return allReviews.where((r) => r['stars'] == 5).toList();
    if (selectedFilter == '4 Stars') return allReviews.where((r) => r['stars'] == 4).toList();
    if (selectedFilter == '3 Stars') return allReviews.where((r) => r['stars'] == 3).toList();
    return allReviews;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    final double avatarSize = w * 0.155;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top Bar ──
                Row(
                  children: [
                    Container(
                      width: avatarSize,
                      height: avatarSize,
                      padding: EdgeInsets.all(w * 0.006),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: w * 0.004),
                      ),
                      child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/home2.jpg')),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.012),
                Text('Good Morning!',
                    style: TextStyle(color: Colors.white70, fontSize: 10)),
                Text('Scarlet Jhonson',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: baseSize * 0.065)),
                SizedBox(height: h * 0.018),

                // ── Rating Summary — Glass Card ──
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      height: h * 0.118,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: h * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.25), width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Average Rating',
                                  style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontSize: baseSize * 0.033)),
                              const Spacer(),
                              Text('Total Reviews',
                                  style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontSize: baseSize * 0.033)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('4.9',
                                  style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: baseSize * 0.065)),
                              SizedBox(width: w * 0.015),
                              Row(
                                children: List.generate(
                                    5,
                                        (_) => Icon(Icons.star,
                                        color: Colors.amber,
                                        size: baseSize * 0.05)),
                              ),
                              const Spacer(),
                              Text('128',
                                  style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: baseSize * 0.065)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ── Filter Chips ──
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filters.map((filter) {
                      final bool isSelected = selectedFilter == filter;
                      return Padding(
                        padding: EdgeInsets.only(right: w * 0.02),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => selectedFilter = filter),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: BackdropFilter(
                              filter:
                              ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: h * 0.045,
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.045),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withOpacity(0.28)
                                      : Colors.white.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.3),
                                      width: isSelected ? 1.5 : 1.0),
                                ),
                                child: Center(
                                    child: Text(filter,
                                        style: TextStyle(
                                            fontFamily: 'A',
                                            color: Colors.white,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            fontSize: baseSize * 0.033))),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ── Review Cards ──
                Expanded(
                  child: filteredReviews.isEmpty
                      ? Center(
                      child: Text('No reviews found',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: baseSize * 0.04)))
                      : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: h * 0.02),
                    itemCount: filteredReviews.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: h * 0.015),
                    itemBuilder: (context, index) {
                      final r = filteredReviews[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 12, sigmaY: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                  color:
                                  Colors.white.withOpacity(0.25),
                                  width: 1.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  w * 0.035,
                                  h * 0.012,
                                  w * 0.035,
                                  h * 0.016),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: baseSize * 0.06,
                                        backgroundImage:
                                        AssetImage(r['avatar']),
                                      ),
                                      SizedBox(width: w * 0.03),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(r['name'],
                                              style: TextStyle(
                                                  fontFamily: 'A',
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  fontSize: baseSize *
                                                      0.037)),
                                          Text(r['timeAgo'],
                                              style: TextStyle(
                                                  color:
                                                  Colors.white70,
                                                  fontSize: baseSize *
                                                      0.028)),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: List.generate(
                                            r['stars'],
                                                (_) => Icon(Icons.star,
                                                color: Colors.amber,
                                                size:
                                                baseSize * 0.042)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: h * 0.01),
                                  Text(r['review'],
                                      style: TextStyle(
                                          fontFamily: 'A',
                                          color: Colors.white
                                              .withOpacity(0.85),
                                          fontSize:
                                          baseSize * 0.032)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}