import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> isLiked = List.generate(8, (_) => false);

  // ─── Filter State ───
  double _distanceValue = 25;
  RangeValues _priceRange = const RangeValues(40, 200);
  final List<String> _serviceTypes = ['Make Up', 'Wig', 'Nails', 'Hairs', 'Face Wash', 'Skin Care'];
  final Set<String> _selectedServices = {};

  void _toggleService(String title) {
    setState(() {
      _selectedServices.contains(title)
          ? _selectedServices.remove(title)
          : _selectedServices.add(title);
    });
  }

  // ─── Filter Bottom Sheet ───
  void _showFilterSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // ✅ blur
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05,
                    vertical: h * 0.025,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1), // ✅ bottom sheet bg
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // ─── Handle bar ───
                      Container(
                        width: w * 0.1,
                        height: 4,
                        margin: EdgeInsets.only(bottom: h * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      // ─── Header ───
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(Icons.close, color: Colors.white, size: 22),
                          ),
                          const Spacer(),
                          Text(
                            'Filter Results',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: baseSize * 0.05,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'A',
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(width: 22),
                        ],
                      ),

                      SizedBox(height: h * 0.025),

                      // ─── Distance Slider ───
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04,
                          vertical: h * 0.018,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3), // ✅ 0.3
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Distance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: baseSize * 0.04,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'A',
                                  ),
                                ),
                                Text(
                                  '${_distanceValue.toInt()} miles',
                                  style: TextStyle(
                                    color: Color(0xFF46151A),
                                    fontSize: baseSize * 0.040,
                                   fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: const Color(0xFF46151A),
                                inactiveTrackColor: Colors.white.withOpacity(0.25),
                                thumbColor: const Color(0xFF46151A),
                                overlayColor: const Color(0xFF46151A).withOpacity(0.2),
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 10),
                                trackHeight: 3,
                              ),
                              child: Slider(
                                value: _distanceValue,
                                min: 1,
                                max: 100,
                                onChanged: (val) {
                                  setModalState(() => _distanceValue = val);
                                  setState(() => _distanceValue = val);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.015),

                      // ─── Price Range Slider ───
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04,
                          vertical: h * 0.018,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3), // ✅ 0.3
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 0.8,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price Range',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: baseSize * 0.04,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'A',
                                  ),
                                ),
                                Text(
                                  '${_priceRange.start.toInt()}\$-${_priceRange.end.toInt()}\$',
                                  style: TextStyle(
                                    color: Color(0xFF46151A),
                                    fontSize: baseSize * 0.040,
                                    fontWeight: FontWeight.w700,


                                  ),
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: const Color(0xFF46151A),
                                inactiveTrackColor: Colors.white.withOpacity(0.25),
                                thumbColor: const Color(0xFF46151A),
                                overlayColor: const Color(0xFF46151A).withOpacity(0.2),
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 10),
                                rangeThumbShape:
                                const RoundRangeSliderThumbShape(
                                    enabledThumbRadius: 10),
                                trackHeight: 3,
                              ),
                              child: RangeSlider(
                                values: _priceRange,
                                min: 0,
                                max: 500,
                                onChanged: (val) {
                                  setModalState(() => _priceRange = val);
                                  setState(() => _priceRange = val);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.015),

                      // ─── Service Type ───
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04,
                          vertical: h * 0.018,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3), // ✅ 0.3
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Service Type',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: baseSize * 0.04,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'A',
                              ),
                            ),
                            SizedBox(height: h * 0.012),
                            Wrap(
                              spacing: w * 0.02,
                              runSpacing: h * 0.01,
                              children: _serviceTypes.map((service) {
                                final selected =
                                _selectedServices.contains(service);
                                return GestureDetector(
                                  onTap: () => setModalState(
                                          () => _toggleService(service)),
                                  child: AnimatedContainer(
                                    duration:
                                    const Duration(milliseconds: 200),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.045,
                                      vertical: h * 0.012,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: selected
                                          ? Colors.white.withOpacity(0.85)
                                          : Colors.white.withOpacity(0.15),
                                      border: Border.all(
                                        color: selected
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.3),
                                        width: selected ? 1.5 : 0.5,
                                      ),
                                    ),
                                    child: Text(
                                      service,
                                      style: TextStyle(
                                        color: selected
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'A',
                                        fontSize: baseSize * 0.035,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.03),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ─── Product Card ───
  Widget _productCard(double h, double w, String imagePath, int index) {
    final baseSize = MediaQuery.of(context).size.shortestSide;
    return Container(
      width: w * 0.45,
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF5C4A4A).withOpacity(0.7),
            const Color(0xFFB8B1A8).withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: h * 0.1,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Axis Y',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.04,
                fontWeight: FontWeight.w600,
                fontFamily: 'A',
              ),
            ),
            subtitle: Text(
              'The Mini Glow Set',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: w * 0.028,
                fontFamily: 'A',
              ),
            ),
            trailing: GestureDetector(
              onTap: () =>
                  setState(() => isLiked[index] = !isLiked[index]),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF46151A).withOpacity(0.3),
                ),
                child: Icon(
                  isLiked[index] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: baseSize * 0.045,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            image: AssetImage('assets/images/home1.png'),
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

              // ─── Top Row ───
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/homeicon.png'),
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
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),

              SizedBox(height: h * 0.03),

              // ─── Search Row ───
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            'assets/images/homeicon1.png',
                            width: baseSize * 0.05,
                            height: baseSize * 0.05,
                          ),
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: baseSize * 0.04,
                          fontFamily: 'A',
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: baseSize * 0.02,
                          horizontal: baseSize * 0.04,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'A'),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // ─── Filter Button — original search2.png icon ✅ ───
                  GestureDetector(
                    onTap: () => _showFilterSheet(context),
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/homeicon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(baseSize * 0.03),
                        child: Image.asset(
                          'assets/images/search2.png', // ✅ original icon
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.03),

              // ─── Product Grid ───
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: h * 0.12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(
                              h, w, 'assets/images/homeicon4.jpg', 0),
                          _productCard(
                              h, w, 'assets/images/homeicon5.jpg', 1),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 2),
                          _productCard(
                              h, w, 'assets/images/homeicon6.jpg', 3),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 4),
                          _productCard(
                              h, w, 'assets/images/homeicon6.jpg', 5),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 6),
                          _productCard(
                              h, w, 'assets/images/homeicon6.jpg', 7),
                        ],
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