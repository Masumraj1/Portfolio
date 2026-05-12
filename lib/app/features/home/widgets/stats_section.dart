import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsSection extends StatelessWidget {
  final bool isMobile;

  const StatsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 50.h : 80.h,
        horizontal: 20.w,
      ),
      // একটি হালকা ব্যাকগ্রাউন্ড কালার এবং বর্ডার দেওয়া হয়েছে প্রফেশনাল লুকের জন্য
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Center(
        child: Wrap(
          // মোবাইলে সেন্টারে থাকবে, আর পাশাপাশি এবং উপরে-নিচে গ্যাপ মেইনটেইন করবে
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: isMobile ? 40.w : 100.w, // পাশাপাশি গ্যাপ
          runSpacing: 40.h,                // মোবাইলে নিচে নিচে নামলে গ্যাপ
          children: const [
            StatItem(value: "2+", label: "Years Job Exp"),
            StatItem(value: "1+", label: "Self Learning"),
            StatItem(value: "15+", label: "Projects Done"),
            StatItem(value: "3", label: "Companies"),
          ],
        ),
      ),
    );
  }
}

/// আলাদা একটি উইজেট হিসেবে StatItem তৈরি করা হয়েছে কোড ক্লিন রাখার জন্য
class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // স্ক্রিন সাইজ অনুযায়ী ফন্ট সাইজ অ্যাডজাস্ট করার লজিক
    bool isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isSmallScreen ? 28.sp : 40.sp,
            fontWeight: FontWeight.w900,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isSmallScreen ? 12.sp : 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}