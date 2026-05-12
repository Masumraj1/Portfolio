import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_network_image.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? playStoreUrl; // নতুন প্যারামিটার
  final String? appStoreUrl;  // নতুন প্যারামিটার

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.playStoreUrl, // কনস্ট্রাক্টরে যোগ করা হলো
    this.appStoreUrl,  // কনস্ট্রাক্টরে যোগ করা হলো
  });

  @override
  Widget build(BuildContext context) {
    bool isAsset = imageUrl.startsWith('assets/');

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        children: [
          /// Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: isAsset
                ? Image.asset(imageUrl, fit: BoxFit.cover)
                : CustomNetworkImage(
              imageUrl: imageUrl,
              height: double.infinity,
              width: double.infinity,
              boxShape: BoxShape.rectangle,
            ),
          ),

          /// Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.95),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),

          /// Content
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                SizedBox(height: 12.h),

                /// Tech Stack & Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.w,
                        runSpacing: 4.h,
                        children: techStack.map((tech) {
                          return Text(
                            '#$tech',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    /// স্টোর আইকন (যদি লিঙ্ক থাকে তবেই দেখাবে)
                    Row(
                      children: [
                        if (playStoreUrl != null && playStoreUrl!.isNotEmpty)
                          Icon(Icons.android, size: 18.sp, color: Colors.greenAccent),
                        if (appStoreUrl != null && appStoreUrl!.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Icon(Icons.apple, size: 20.sp, color: Colors.white),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}