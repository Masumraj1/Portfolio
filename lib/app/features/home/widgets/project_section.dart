import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
<<<<<<< HEAD
        'title': 'Ans Music',
        'desc': 'Global music distribution & publishing platform. Reach Spotify, Apple Music, and YouTube while retaining 100% copyrights with AI-powered tools.',
        'imageUrl': 'assets/images/ans_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.ansmusiclimited.ansmusic',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },

      {
        'title': 'Up A Level K9 Academy',
        'desc': 'Up A Level K9 Academy is a comprehensive dog training app that helps owners build better behavior and stronger bonds with their dogs. Designed for both puppies and adult dogs, it offers step-by-step training foundations, on-leash and off-leash guidance, and challenges.',
        'imageUrl': 'assets/images/k9academy_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API', "Stripe"],
        'playStore': 'https://play.google.com/store/apps/details?id=com.karen.upalevelk9academy&hl=en',
        'appStore': 'https://apps.apple.com/us/app/up-a-level-k9-academy/id6581483580',
        'apkLink': '',
        'videoDemo': '',
      },
      {
        'title': 'PROTIPPZ',
        'desc': 'The \'Venmo for Athletes\'—a fan-to-player tipping platform providing professional and college athletes with a direct revenue stream through exclusive rewards, specifically designed to bridge the income gap in women’s sports.',
        'imageUrl': 'assets/images/protippz_banner.png',
        'tech': ['Flutter', 'Firebase', 'GetX', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.coryrains.protppz&hl=en',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },
      {
        'title': 'Qorum',
        'desc': 'Qorum is an expense management software that simplifies and automates the entire expense voucher lifecycle. Designed for both finance teams and employees, it replaces manual processes by accurately tracking expenses and enforcing company policies.',
        'imageUrl': 'assets/images/qorum_banner.png',
        'tech': ['Flutter', 'Firebase', 'provider', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.aerogon.flutter_3_0_app&hl=en',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },
      {
        'title': 'Ilera',
        'desc': 'Ilera is a revolutionary telehealth platform connecting users globally with UK-based medical specialists. It enables seamless video consultations, treatments, and follow-up care from home, bringing world-class healthcare directly to your fingertips.',
        'imageUrl': 'assets/images/ilera_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.medical.rebecca&hl=en',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },

      {
        'title': 'Carenes',
        'desc': 'The ultimate all-in-one booking platform for beauty and wellness. Discover top-rated hair salons, nail studios, and spas near you, and book your appointments 24/7 with secure prepayments and exclusive local deals.',
        'imageUrl': 'assets/images/carenes_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': 'https://play.google.com/store/apps/details?id=com.mmemmo.careness&hl=en',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },

      {
        'title': 'The Cultured Ninja',
        'desc': 'Screen Delights is a premium movie discovery and streaming platform designed for cinema enthusiasts. It features a sleek, dark-themed UI for browsing trending titles, personalized watchlists',
        'imageUrl': 'assets/images/culter_ninja_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': '',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
      },

      {
        'title': 'Track Booking',
        'desc': 'A comprehensive logistics solution featuring dedicated User and Driver apps with real-time GPS tracking, smart route optimization, and secure booking management.',
        'imageUrl': 'assets/images/track_booking_banner.png',
        'tech': ['Flutter', 'Firebase', 'Getx', 'Rest API'],
        'playStore': '',
        'appStore': '',
        'apkLink': '',
        'videoDemo': '',
=======
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
>>>>>>> gh-pages
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
<<<<<<< HEAD
          Text(
            "Selected Work",
            style: TextStyle(
              fontSize: isMobile ? 30.sp : 40.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 50.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 60.h),
=======
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
>>>>>>> gh-pages
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 30.w,
<<<<<<< HEAD
              mainAxisSpacing: 40.h,
              childAspectRatio: isMobile ? 0.65 : 1.1,
=======
              mainAxisSpacing: 35.h,
              mainAxisExtent: isMobile
                  ? 540.h
                  : 580.h,
>>>>>>> gh-pages
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
<<<<<<< HEAD
                imageUrl: p['imageUrl'],
                techStack: List<String>.from(p['tech']),
                playStoreUrl: p['playStore'],
                appStoreUrl: p['appStore'],
                apkUrl: p['apkLink'],
                videoUrl: p['videoDemo'],
=======
                images: imageList,
                techStack: List<String>.from(p['tech']),
                playStoreUrl: p['playStore'],
                appStoreUrl: p['appStore'],
                rating: p['rating'],
                downloads: p['downloads'],
>>>>>>> gh-pages
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class ProjectCard extends StatelessWidget {
  final String title, description, imageUrl;
  final List<String> techStack;
  final String? playStoreUrl, appStoreUrl, apkUrl, videoUrl;
  final bool isMobile;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.playStoreUrl,
    this.appStoreUrl,
    this.apkUrl,
    this.videoUrl,
    required this.isMobile,
  });

  // Dynamic Messaging Logic
  void _handleLinkAction(BuildContext context, String? url, String platformType) async {
    if (url == null || url.isEmpty) {
      String message;
      IconData icon;

      // Custom message based on what user clicked
      switch (platformType) {
        case "App Store":
          message = "iOS version is currently in development. Stay tuned!";
          icon = Icons.apple;
          break;
        case "APK":
          message = "The direct APK file is being prepared for secure download.";
          icon = Icons.android;
          break;
        case "Video Demo":
          message = "We are recording a high-quality demo for you. Coming soon!";
          icon = Icons.play_circle_fill;
          break;
        case "Play Store":
          message = "Play Store link is currently being updated. Please check back later.";
          icon = Icons.shop;
          break;
        default:
          message = "This link will be available soon. Thank you for your patience!";
          icon = Icons.info_outline;
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF2C2C2C),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        _handleLinkAction(context, null, platformType);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              child: Container(
                width: double.infinity,
                color: const Color(0xFF0D0D0D),
                child: _buildImage(imageUrl),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: const Color(0xFF2D2D2D)),
                      ),
                      _buildStatusBadge(),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black54, height: 1.5),
                  ),
                  const Spacer(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: techStack.map((tech) => _buildTechTag(tech)).toList(),
                    ),
                  ),
                  const Divider(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 15.w,
                        children: [
                          _buildActionBtn(context, Icons.shop_two_rounded, "Play", Colors.blue, playStoreUrl, "Play Store"),
                          _buildActionBtn(context, Icons.apple_rounded, "Store", Colors.black, appStoreUrl, "App Store"),
                          _buildActionBtn(context, Icons.install_mobile_rounded, "APK", Colors.green, apkUrl, "APK"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => _handleLinkAction(context, videoUrl, "Video Demo"),
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), shape: BoxShape.circle),
                          child: Icon(Icons.play_arrow_rounded, color: Colors.red, size: 24.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- UI Components ---
  Widget _buildImage(String path) {
    return path.endsWith('.svg')
        ? SvgPicture.asset(path, fit: BoxFit.contain)
        : Image.asset(path, fit: BoxFit.contain, alignment: Alignment.center);
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.green, Colors.teal]),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text("LIVE", style: TextStyle(fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTechTag(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(8.r)),
      child: Text(label, style: TextStyle(fontSize: 11.sp, color: Colors.blueAccent, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildActionBtn(BuildContext context, IconData icon, String label, Color color, String? url, String type) {
    return InkWell(
      onTap: () => _handleLinkAction(context, url, type),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18.sp),
          SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
=======
>>>>>>> gh-pages
