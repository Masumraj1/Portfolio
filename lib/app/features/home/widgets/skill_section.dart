import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const SkillsSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skillCategories = [
      {
        'title': 'Programming Languages',
        'icon': Icons.code_rounded,
        'skills': ['Dart (Expert)', 'Kotlin (Expert)', 'Java (Expert)'],
      },
      {
        'title': 'Mobile Development',
        'icon': Icons.phone_android_rounded,
        'skills': [
          'Flutter',
          'Android Native',
          'Platform Channels',
          'Clean Architecture',
          'SOLID Principles',
        ],
      },
      {
        'title': 'State Management',
        'icon': Icons.account_tree_rounded,
        'skills': ['Riverpod', 'Bloc', 'GetX', 'Provider']
      },
      {
        'title': 'Cloud & Database',
        'icon': Icons.cloud_done_rounded,
        'skills': ['Firebase', 'Firestore', 'Auth', 'Analytics', 'Crashlytics']
      },
      {
        'title': 'Payments',
        'icon': Icons.payments_rounded,
        'skills': ['Stripe', 'PayPal', 'SSLCommerz', 'bKash', 'Nagad']
      },
      {
        'title': 'Tools & PM',
        'icon': Icons.construction_rounded,
        'skills': ['Git', 'GitHub', 'Jira', 'Asana', 'Notion', 'CI/CD']
      },
    ];

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 90.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [
          // Section Title Component
          SectionTitle(title: "Technical Expertise", isMobile: isMobile),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // GridView.builder এর বদলে Wrap বা LayoutBuilder ব্যবহার করা হয়েছে
          // যাতে কার্ডের হাইট কন্টেন্ট অনুযায়ী অটোমেটিক বাড়ে।
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skillCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (constraints.maxWidth > 1200 ? 3 : 2),
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  // মোবাইলে হাইট ফিক্সড রাখা যাবে না, ডেক্সটপে ৩২০ মোটামুটি স্ট্যান্ডার্ড
                  mainAxisExtent: isMobile ? null : 320.h,
                ),
                itemBuilder: (context, index) {
                  return _buildCategoryCard(skillCategories[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 18.r : 24.r),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // কন্টেন্ট অনুযায়ী সাইজ হবে
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  category['icon'],
                  color: Colors.blueAccent,
                  size: isMobile ? 20.sp : 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  category['title'],
                  style: TextStyle(
                    fontSize: isMobile ? 16.sp : 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // স্কিল চিপস
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: (category['skills'] as List<String>).map((skill) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_rounded,
                        color: Colors.blueAccent.withValues(alpha: 0.6),
                        size: isMobile ? 10.sp : 12.sp),
                    SizedBox(width: 6.w),
                    Text(
                      skill,
                      style: TextStyle(
                        fontSize: isMobile ? 12.sp : 13.sp,
                        color: Colors.white.withValues(alpha: 0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isMobile;
  const SectionTitle({super.key, required this.title, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 28.sp : 34.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: isMobile ? 40.w : 56.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ],
    );
  }
}