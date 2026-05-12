import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const EducationSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    const educationList = [
      EducationItem(
        duration: '2023 – Present',
        degree: 'Bachelor of Business Administration (BBA)',
        institution: 'ZNRF University of Management Sciences (ZUMS), Dhaka',
      ),
      EducationItem(
        duration: '2020',
        degree: 'Higher Secondary Certificate (HSC)',
        institution: 'Pirgonj Government College, Pirgonj, Thakurgaon',
      ),
      EducationItem(
        duration: '2018',
        degree: 'Secondary School Certificate (SSC)',
        institution: 'Nakati Hat High School, Pirgonj, Thakurgaon',
      ),
    ];

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 90.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [
          SectionTitle(title: 'Education', isMobile: isMobile),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // ইন্ট্রিনসিক হাইট ব্যবহার করা হয়েছে যাতে টাইমলাইন লাইনটি টেক্সট অনুযায়ী বাড়ে
          Column(
            children: educationList
                .map((item) => EducationTimelineCard(
              item: item,
              isMobile: isMobile,
              isLast: educationList.last == item,
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class EducationItem {
  final String duration;
  final String degree;
  final String institution;

  const EducationItem({
    required this.duration,
    required this.degree,
    required this.institution,
  });
}

class EducationTimelineCard extends StatelessWidget {
  final EducationItem item;
  final bool isMobile;
  final bool isLast;

  const EducationTimelineCard({
    super.key,
    required this.item,
    required this.isMobile,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight( // এটি কন্টেন্ট অনুযায়ী বামের লাইনকে বড় করবে
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Timeline Indicator
          Column(
            children: [
              Container(
                width: isMobile ? 12.r : 14.r,
                height: isMobile ? 12.r : 14.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: Colors.blueAccent.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          SizedBox(width: isMobile ? 15.w : 22.w),

          /// Content Card
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 25.h),
              padding: EdgeInsets.all(isMobile ? 18.r : 26.r),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.duration,
                    style: TextStyle(
                      fontSize: isMobile ? 12.sp : 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    item.degree,
                    style: TextStyle(
                      fontSize: isMobile ? 16.sp : 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item.institution,
                    style: TextStyle(
                      fontSize: isMobile ? 13.sp : 14.sp,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isMobile;

  const SectionTitle({
    super.key,
    required this.title,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 28.sp : 34.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: isMobile ? 45.w : 56.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ],
    );
  }
}