import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const ProjectsSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'Ans Music',
        'desc': 'Global music distribution & publishing platform. Reach Spotify, Apple Music, and YouTube while retaining 100% copyrights with AI-powered tools.',
        'imageUrl': 'assets/images/ans_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.ansmusiclimited.ansmusic',
        'appStore': '',
      },
      {
        'title': 'Up A Level K9 Academy',
        'desc': 'Comprehensive dog training app that helps owners build better behavior and stronger bonds. Offers step-by-step training foundations and challenges.',
        'imageUrl': 'assets/images/k9academy_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API', "Stripe"],
        'playStore': 'https://play.google.com/store/apps/details?id=com.karen.upalevelk9academy&hl=en',
        'appStore': 'https://apps.apple.com/us/app/up-a-level-k9-academy/id6581483580',
      },
      {
        'title': 'PROTIPPZ',
        'desc': 'The \'Venmo for Athletes\'—a fan-to-player tipping platform providing athletes with a direct revenue stream through exclusive rewards.',
        'imageUrl': 'assets/images/protippz_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.coryrains.protppz&hl=en',
        'appStore': '',
      },
      {
        'title': 'Qorum',
        'desc': 'Expense management software that simplifies and automates the entire expense voucher lifecycle for finance teams and employees.',
        'imageUrl': 'assets/images/qorum_banner.png',
        'tech': ['Flutter', 'Firebase', 'Provider', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.aerogon.flutter_3_0_app&hl=en',
        'appStore': '',
      },
      {
        'title': 'Ilera',
        'desc': 'Telehealth platform connecting users globally with UK-based medical specialists for seamless video consultations and care.',
        'imageUrl': 'assets/images/ilera_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.medical.rebecca&hl=en',
        'appStore': '',
      },
      {
        'title': 'Carenes',
        'desc': 'All-in-one booking platform for beauty and wellness. Discover top-rated salons and book appointments 24/7 with secure prepayments.',
        'imageUrl': 'assets/images/carenes_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.mmemmo.careness&hl=en',
        'appStore': '',
      },
      {
        'title': 'The Cultured Ninja',
        'desc': 'Premium movie discovery platform designed for cinema enthusiasts. Sleek UI for browsing trending titles and personalized watchlists.',
        'imageUrl': 'assets/images/culter_ninja_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': '',
        'appStore': '',
      },
      {
        'title': 'Track Booking',
        'desc': 'Logistics solution featuring dedicated User and Driver apps with real-time GPS tracking and route optimization.',
        'imageUrl': 'assets/images/track_booking_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': '',
        'appStore': '',
      },
    ];

    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 90.h,
        horizontal: isMobile ? 24.w : 120.w,
      ),
      child: Column(
        children: [
          Text(
            "Selected Projects",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 34.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
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

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 30.w,
              mainAxisSpacing: 30.h,
              // ওয়েব ভিউতে ডেসক্রিপশন বেশি থাকলে childAspectRatio বাড়াতে হতে পারে (যেমন: 1.2)
              childAspectRatio: isMobile ? 1.05 : 1.3,
            ),
            itemBuilder: (context, i) {
              final p = projects[i];
              return ProjectCard(
                title: p['title'],
                description: p['desc'],
                imageUrl: p['imageUrl'], // এখানে p['image'] এর বদলে p['imageUrl'] ফিক্স করা হয়েছে
                techStack: List<String>.from(p['tech']),
                playStoreUrl: p['playStore'],
                appStoreUrl: p['appStore'],
              );
            },
          ),
        ],
      ),
    );
  }
}