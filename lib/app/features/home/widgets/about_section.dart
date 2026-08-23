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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 80.w,
        vertical: isMobile ? 60.h : 100.h,
      ),
      child: Column(
        children: [

          SizedBox(height: 12.h),

          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFF90CAF9)],
            ).createShader(bounds),
            child: Text(
              "About Me",
              style: TextStyle(
                fontSize: isMobile ? 28.sp : 38.sp,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40.h),

          // =========== Bio Highlight Box ===========
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900.w),
            child: Text(
              "I am Md. Masum Rana, a Mobile Application Developer at ASL Systems Ltd. My journey began with a year of dedicated self-learning, paving the way for 3+ years of professional experience building high-quality Flutter apps. I bridge business logic with technical excellence, thriving on Clean Architecture, discipline, and building scalable digital solutions.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 15.sp : 18.sp,
                color: const Color(0xFF8B949E),
                height: 1.6,
                letterSpacing: 0.3,
              ),
            ),
          ),
          SizedBox(height: 40.h),


        ],
      ),
    );
  }
}

