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
    final List<Map<String, String>> experiences = [
      {
        'role': 'Mobile Application Developer (Flutter)',
        'company': 'ASL Systems Limited',
        'duration': 'Jan 2026 – Present',
        'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSknjRMQeERPFnIp1fHGrIqrtvUQduV5j4Bz68RxGePZV-6fTcdlSOz0pXP&s=10',
        'link': 'https://aslsystems.ltd/'
      },
      {
        'role': 'Mobile Application Developer',
        'company': 'Yuma Technology',
        'duration': 'Sep 2025 – Dec 2025',
        'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0ho-r7cgSmO02XSQzYNgTRMDwFTtPTQIQBA&s',
        'link': 'https://yuma-technology.co.uk/'
      },
      {
        'role': 'Software Engineer (Flutter)',
        'company': 'Betopia Group',
        'duration': 'Jan 2024 – Aug 2025',
        'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYKhrVGGuX5aC5NnvvqcxbfcGPVzhev6qo2A&s',
        'link': 'https://betopiagroup.com/'
      },
    ];

    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 90.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [

          SizedBox(height: 12.h),

          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFF90CAF9)],
            ).createShader(bounds),
            child: Text(
              "Work Experience",
              style: TextStyle(
                fontSize: isMobile ? 28.sp : 38.sp,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // =========== Timeline List ===========
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900.w),
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