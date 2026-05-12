import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const ExperienceSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // ডাটাগুলোকে টাইপ কাস্ট করে নিলে ভালো
    final List<Map<String, String>> experiences = [
      {
        'role': 'Mobile Application Developer (Flutter)',
        'company': 'ASL Systems Limited',
        'duration': 'Jan 2026 - Present',
        'logo': 'data:image/png;base64,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', // Base64 এর বদলে URL ব্যবহার করা ভালো
        'link': 'https://aslsystems.ltd/'
      },
      {
        'role': 'Mobile Application Developer',
        'company': 'Yuma Technology',
        'duration': 'Sep 2025 - Dec 2025',
        'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ho-r7cgSmO02XSQzYNgTRMDwFTtPTQIQBA&s',
        'link': 'https://yuma-technology.co.uk/'
      },
      {
        'role': 'Software Engineer',
        'company': 'Sparktech Agency',
        'duration': 'Jan 2024 - Aug 2025',
        'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYKhrVGGuX5aC5NnvvqcxbfcGPVzhev6qo2A&s',
        'link': 'https://www.sparktech.agency/'
      },
    ];

    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 100.h, // মোবাইলে প্যাডিং একটু কম
        horizontal: isMobile ? 24.w : 150.w,
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            "Experience",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 34.sp, // রেসপন্সিভ সাইজ
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 50.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // Timeline List
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900.w), // ওয়েব ভিউতে কার্ড যাতে খুব চওড়া না হয়
            child: Column(
              children: List.generate(experiences.length, (index) {
                final exp = experiences[index];
                return ExperienceCard(
                  role: exp['role']!,
                  company: exp['company']!,
                  duration: exp['duration']!,
                  isMobile: isMobile,
                  isLast: index == experiences.length - 1,
                  logoUrl: exp['logo']!,
                  companyUrl: exp['link']!,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}