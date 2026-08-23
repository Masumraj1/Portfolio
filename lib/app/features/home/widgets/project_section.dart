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
        'title': 'প্রত্যয়ন - সকল সনদ এক ঠিকানায়',
        'desc':
            'Easily apply for and receive Bangladeshi citizen certificates using the Prottoyon app.',
        'imageUrl': ['assets/images/p1.png', 'assets/images/p2.png'],
        'tech': ['Flutter', 'GetX', 'Rest API'],
        'playStore':
            'https://play.google.com/store/apps/details?id=prottoyon.gov.bd.app&hl=en',
        'appStore': '',
        'rating': '4.1',
        'downloads': '100K+',
      },
      {
        'title': 'Qorum',
        'desc':
        'Expense management software that simplifies and automates the entire expense voucher lifecycle.',
        'imageUrl': 'assets/images/qorum_banner.png',
        'tech': ['Flutter', 'Riverpod', 'Clean Arch', 'Rest API'],
        'playStore':
        'https://play.google.com/store/apps/details?id=com.aerogon.app.qorum&pcampaignid=web_share',
        'appStore': 'https://apps.apple.com/us/app/qorum/id1596500164',
        'rating': '4.6',
        'downloads': '5K+',
      },
      {
        'title': 'Up A Level K9 Academy',
        'desc':
        'Comprehensive dog training app that helps owners build better behavior with step-by-step training challenges.',
        'imageUrl': 'assets/images/k9academy_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Stripe'],
        'playStore':
        'https://play.google.com/store/apps/details?id=com.karen.upalevelk9academy&hl=en',
        'appStore':
        'https://apps.apple.com/us/app/up-a-level-k9-academy/id6581483580',
        'rating': '4.9',
        'downloads': '5K+',
      },
      {
        'title': 'Ans Music',
        'desc':
            'Global music distribution & publishing platform. Reach Spotify, Apple Music, and YouTube with AI-powered tools.',
        'imageUrl': ['assets/images/ans_banner.png'],
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore':
            'https://play.google.com/store/apps/details?id=com.ansmusiclimited.ansmusic',
        'appStore': '',
        'rating': '4.8',
        'downloads': '10K+',
      },

      {
        'title': 'PROTIPPZ',
        'desc':
            'Fan-to-player tipping platform providing athletes with a direct revenue stream through exclusive rewards.',
        'imageUrl': 'assets/images/protippz_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore':
            'https://play.google.com/store/apps/details?id=com.coryrains.protppz&hl=en',
        'appStore': '',
        'rating': '4.7',
        'downloads': '1+',
      },

      {
        'title': 'Ilera',
        'desc':
            'Telehealth platform connecting users globally with UK-based medical specialists for video consultations.',
        'imageUrl': 'assets/images/ilera_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'WebRTC'],
        'playStore':
            'https://play.google.com/store/apps/details?id=com.medical.rebecca&hl=en',
        'appStore': '',
        'rating': '4.5',
        'downloads': '10+',
      },
      {
        'title': 'Carenes',
        'desc':
            'All-in-one booking platform for beauty and wellness. Discover top-rated salons and book 24/7.',
        'imageUrl': 'assets/images/carenes_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore':
            'https://play.google.com/store/apps/details?id=com.mmemmo.careness&hl=en',
        'appStore': '',
        'rating': '4.8',
        'downloads': '1+',
      },
      {
        'title': 'The Cultured Ninja',
        'desc':
            'Premium movie discovery platform designed for cinema enthusiasts with personalised watchlists.',
        'imageUrl': 'assets/images/culter_ninja_banner.png',
        'tech': ['Flutter', 'Riverpod', 'TMDB API'],
        'playStore': '',
        'appStore': '',
        'rating': 'Coming Soon',
        'downloads': 'Beta',
      },
      {
        'title': 'Track Booking',
        'desc':
            'Logistics solution featuring dedicated User and Driver apps with real-time GPS tracking and route optimization.',
        'imageUrl': 'assets/images/track_booking_banner.png',
        'tech': ['Flutter', 'Google Maps', 'WebSockets'],
        'playStore': '',
        'appStore': '',
        'rating': 'Internal Test',
        'downloads': 'Enterprise',
      },
    ];

    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 90.h,
        horizontal: isMobile ? 16.w : 100.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),

          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFF90CAF9)],
            ).createShader(bounds),
            child: Text(
              "Featured Projects",
              style: TextStyle(
                fontSize: isMobile ? 28.sp : 38.sp,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // Grid View with Prominent Card Heights
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 30.w,
              mainAxisSpacing: 35.h,
              mainAxisExtent: isMobile
                  ? 540.h
                  : 580.h,
            ),
            itemBuilder: (context, i) {
              final p = projects[i];
              List<String> imageList = [];
              if (p['imageUrl'] is List) {
                imageList = List<String>.from(p['imageUrl']);
              } else if (p['imageUrl'] is String) {
                imageList = [p['imageUrl'] as String];
              }

              return ProjectCard(
                title: p['title'],
                description: p['desc'],
                images: imageList,
                techStack: List<String>.from(p['tech']),
                playStoreUrl: p['playStore'],
                appStoreUrl: p['appStore'],
                rating: p['rating'],
                downloads: p['downloads'],
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}
