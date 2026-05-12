import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/app/core/constants.dart';
import 'custom_network_image.dart';
import 'hero_content.dart';
class HeroSection extends StatelessWidget {
  final bool isMobile;
  final Function(GlobalKey) scrollTo;
  final GlobalKey contactKey;

  const HeroSection({
    super.key,
    required this.isMobile,
    required this.scrollTo,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // পুরো স্ক্রিন জুড়ে থাকবে
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.w : 100.w, // মোবাইলে একটু বেশি প্যাডিং
        vertical: isMobile ? 50.h : 100.h,   // মোবাইলে ভার্টিক্যাল গ্যাপ কমানো
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // সেন্টার অ্যালাইনমেন্ট
        children: [
          // Left Side / Top Side
          isMobile
              ? HeroContent( // মোবাইলে Expanded ছাড়া সরাসরি ইউজ করুন
            isMobile: isMobile,
            onHireMeTap: () => scrollTo(contactKey),
          )
              : Expanded( // ডেস্কটপে Expanded ঠিক আছে
            flex: 1,
            child: HeroContent(
              isMobile: isMobile,
              onHireMeTap: () => scrollTo(contactKey),
            ),
          ),

          if (!isMobile) SizedBox(width: 50.w),

          // Profile Image
          _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    // মোবাইলে রেডিয়াস (r) কমানো হয়েছে যাতে স্ক্রিনের বাইরে না যায়
    double size = isMobile ? 260.r : 350.r;
    return Padding(
      padding: EdgeInsets.only(top: isMobile ? 40.h : 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow Effect
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withValues(alpha: 0.2),
                  blurRadius: isMobile ? 30 : 50,
                  spreadRadius: isMobile ? 10 : 15,
                ),
              ],
            ),
          ),

          // Image Border & Image
          Container(
            padding: EdgeInsets.all(isMobile ? 3.r : 5.r),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: CustomNetworkImage(
              imageUrl: AppConstants.imageUrl,
              height: size - 20.r, // বর্ডার থেকে একটু ছোট
              width: size - 20.r,
              boxShape: BoxShape.circle,
              backgroundColor: const Color(0xFF161B22),
            ),
          ),
        ],
      ),
    );
  }
}
