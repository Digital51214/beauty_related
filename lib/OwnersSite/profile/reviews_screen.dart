import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  String selectedFilter = 'All Reviews';

  final List<String> filters = ['All Reviews', '5 Stars', '4 Stars', '3 Stars'];

  // ✅ Review data list with star ratings
  final List<Map<String, dynamic>> allReviews = [
    {
      'name': 'Elena Grace',
      'timeAgo': '2 Days Ago',
      'review': 'Sarah Did an amazing job with my bridal makeup! She was punctual, professional and understood exactly the look I wanted.',
      'stars': 5,
      'avatar': 'assets/images/review2.png',
    },
    {
      'name': 'Sofia Malik',
      'timeAgo': '5 Days Ago',
      'review': 'Really loved the experience! The makeup lasted all day and I got so many compliments. Will definitely come back.',
      'stars': 5,
      'avatar': 'assets/images/review2.png',
    },
    {
      'name': 'Ayesha Khan',
      'timeAgo': '1 Week Ago',
      'review': 'Good service overall. The look was nice but took a little longer than expected. Would recommend though.',
      'stars': 4,
      'avatar': 'assets/images/review2.png',
    },
    {
      'name': 'Nadia Hussain',
      'timeAgo': '2 Weeks Ago',
      'review': 'Decent work. I had some specific requests that were mostly met. The overall result was satisfying.',
      'stars': 4,
      'avatar': 'assets/images/review2.png',
    },
    {
      'name': 'Zara Ahmed',
      'timeAgo': '3 Weeks Ago',
      'review': 'Average experience. The makeup was okay but not exactly what I had in mind. Could be improved.',
      'stars': 3,
      'avatar': 'assets/images/review2.png',
    },
    {
      'name': 'Hina Baig',
      'timeAgo': '1 Month Ago',
      'review': 'It was fine. Nothing exceptional but the service was polite and on time. Three stars from me.',
      'stars': 3,
      'avatar': 'assets/images/review2.png',
    },
  ];

  // ✅ Filter logic
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

    final bool isTablet = baseSize > 600;
    final double topPadding = isTablet ? h * 0.045 : h * 0.055;
    final double horizontalPadding = isTablet ? w * 0.05 : w * 0.025;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: w*0.035,
              right: w*0.035

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---- Top Bar ----
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: baseSize * 0.12,
                        width: baseSize * 0.12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/helper2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: w * 0.015),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: baseSize * 0.05,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.018),

                // ---- Reviews Title ----
                Text(
                  'Reviews',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: baseSize * 0.065,
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ---- Rating Summary Card ----
                Container(
                  height: h * 0.118,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.05,
                      right: w * 0.05,
                      top: h * 0.017,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Average Rating',
                              style: TextStyle(
                                fontFamily: 'A',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: baseSize * 0.035,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Total Reviews',
                              style: TextStyle(
                                fontFamily: 'A',
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
                                fontFamily: 'A',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: baseSize * 0.065,
                              ),
                            ),
                            SizedBox(width: w * 0.015),
                            Row(
                              children: List.generate(
                                5,
                                    (index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: baseSize * 0.055,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '128',
                              style: TextStyle(
                                fontFamily: 'A',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: baseSize * 0.065,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.025),

                // ---- Filter Chips Row ----
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filters.map((filter) {
                      final bool isSelected = selectedFilter == filter;
                      return Padding(
                        padding: EdgeInsets.only(right: w * 0.02),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          child: Container(
                            height: h * 0.045,
                            padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.45)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.6),
                                width: 1.2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                filter,
                                style: TextStyle(
                                  fontFamily: 'A',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: baseSize * 0.033,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: h * 0.025),

                // ---- Review Cards (Filtered + Scrollable) ----
                Expanded(
                  child: filteredReviews.isEmpty
                      ? Center(
                    child: Text(
                      'No reviews found',
                      style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white.withOpacity(0.6),
                        fontSize: baseSize * 0.04,
                      ),
                    ),
                  )
                      : ListView.separated(
                    padding: EdgeInsets.only(bottom: h * 0.02),
                    itemCount: filteredReviews.length,
                    separatorBuilder: (_, __) => SizedBox(height: h * 0.015),
                    itemBuilder: (context, index) {
                      final review = filteredReviews[index];
                      return _buildReviewCard(
                        context: context,
                        h: h,
                        w: w,
                        baseSize: baseSize,
                        name: review['name'],
                        timeAgo: review['timeAgo'],
                        review: review['review'],
                        stars: review['stars'],
                        avatarAsset: review['avatar'],
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

  Widget _buildReviewCard({
    required BuildContext context,
    required double h,
    required double w,
    required double baseSize,
    required String name,
    required String timeAgo,
    required String review,
    required int stars,
    required String avatarAsset,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.35),
            width: 1.2,
          ),
          // ✅ Background image
          image: const DecorationImage(
            image: AssetImage('assets/images/review.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          // ✅ White overlay on top of background image
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(w * 0.035, h * 0.008, w * 0.035, h * 0.018),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundImage: AssetImage(avatarAsset),
                    ),
                    SizedBox(width: w * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'A',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: baseSize * 0.038,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: TextStyle(

                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w300,
                            fontSize: baseSize * 0.03,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        stars,
                            (index) => Icon(Icons.star, color: Colors.amber, size: baseSize * 0.045),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.01),
                Text(
                  review,
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: baseSize * 0.033,
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