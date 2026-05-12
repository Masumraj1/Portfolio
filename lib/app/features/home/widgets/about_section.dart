import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const AboutSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      // মোবাইলে ২০ প্যাডিং ঠিক আছে, কিন্তু ওয়েবে ১৫০ অনেক সময় বেশি হয়ে যায়, তাই ১০০.w ভালো
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.w : 100.w,
        vertical: isMobile ? 60.h : 100.h,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            "About Me",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 36.sp, // রেসপন্সিভ সাইজ
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),

          // Decorative Underline
          Container(
            width: isMobile ? 50.w : 70.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: 40.h),

          // About Description
          ConstrainedBox(
            // ডেসক্রিপশন যাতে খুব বেশি ছড়িয়ে না যায় (পড়তে সুবিধা হয়)
            constraints: BoxConstraints(maxWidth: 900.w),
            child: Text(
              "I am Md. Masum Rana, a Mobile Application Developer at ASL Systems Ltd. My journey began with a year of dedicated self-learning, which paved the way for my 2+ years of professional experience in building high-quality Flutter apps. Currently pursuing a BBA at ZNRF University (ZUMS), I bridge the gap between business logic and technical excellence. Beyond the code, I am a passionate bike rider who thrives on logic, discipline, and the open road.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 15.sp : 18.sp, // মোবাইল অনুযায়ী সাইজ ফিক্স
                color: Colors.grey.shade400,
                height: 1.6,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}