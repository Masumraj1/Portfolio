import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String logoUrl;
  final String companyUrl;
  final bool isMobile;
  final bool isLast;

  const ExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.logoUrl,
    required this.companyUrl,
    required this.isMobile,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Indicator
          Column(
            children: [
              Container(
                width: isMobile ? 12.r : 14.r,
                height: isMobile ? 12.r : 14.r,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withValues(alpha: 0.3),
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: Colors.blueAccent.withValues(alpha: 0.15),
                  ),
                ),
            ],
          ),
          SizedBox(width: isMobile ? 15.w : 25.w),

          // Content Card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(companyUrl);
                  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                    debugPrint('Could not launch $url');
                  }
                },
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 16.r : 20.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFF161B22),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                    // হোভার ইফেক্ট দেওয়ার জন্য হালকা শ্যাডো
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // কোম্পানি লোগো - সাদা ব্যাকগ্রাউন্ডে ফিট করা হয়েছে
                          Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Image.network(
                                logoUrl,
                                height: isMobile ? 35.r : 45.r,
                                width: isMobile ? 35.r : 45.r,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.business, size: 30.r, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),

                          // টেক্সট কন্টেন্ট
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  role,
                                  style: TextStyle(
                                    fontSize: isMobile ? 15.sp : 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  company,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: isMobile ? 13.sp : 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // এক্সটারনাল লিঙ্ক আইকন (শুধুমাত্র ডেক্সটপে সুন্দর দেখায়)
                          if (!isMobile)
                            Icon(Icons.open_in_new, size: 16.sp, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: 15.h),

                      // ডুরেশন ব্যাজ
                      _buildDurationBadge(duration),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationBadge(String duration) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.1)),
      ),
      child: Text(
        duration,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: isMobile ? 11.sp : 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}