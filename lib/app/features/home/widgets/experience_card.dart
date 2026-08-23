import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatefulWidget {
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
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  Future<void> _launchCompanyUrl() async {
    final Uri url = Uri.parse(widget.companyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========== Timeline Node & Vertical Bar ===========
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.isMobile ? 32.r : 40.r,
                height: widget.isMobile ? 32.r : 40.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHovered ? Colors.blueAccent : const Color(0xFF161B22),
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withValues(alpha: isHovered ? 0.5 : 0.2),
                      blurRadius: isHovered ? 12 : 6,
                      spreadRadius: isHovered ? 2 : 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.business_center_rounded,
                  size: widget.isMobile ? 16.sp : 18.sp,
                  color: isHovered ? Colors.white : Colors.blueAccent,
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.withValues(alpha: 0.5),
                          Colors.blueAccent.withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: widget.isMobile ? 16.w : 24.w),

          // =========== Interactive Content Card ===========
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _launchCompanyUrl,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(bottom: 30.h),
                  padding: EdgeInsets.all(widget.isMobile ? 18.r : 24.r),
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.blueAccent.withValues(alpha: 0.08)
                        : const Color(0xFF161B22).withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: isHovered
                          ? Colors.blueAccent.withValues(alpha: 0.4)
                          : Colors.white.withValues(alpha: 0.08),
                      width: 1.2,
                    ),
                    boxShadow: isHovered
                        ? [
                      BoxShadow(
                        color: Colors.blueAccent.withValues(alpha: 0.15),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                        : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Company Logo Container
                          Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Image.network(
                                widget.logoUrl,
                                height: widget.isMobile ? 32.r : 40.r,
                                width: widget.isMobile ? 32.r : 40.r,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.apartment_rounded, size: 26.r, color: Colors.grey.shade700),
                              ),
                            ),
                          ),
                          SizedBox(width: 14.w),

                          // Role & Company Title
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.role,
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 15.sp : 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  widget.company,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: widget.isMobile ? 13.sp : 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Icon(
                            Icons.arrow_outward_rounded,
                            size: 18.sp,
                            color: isHovered ? Colors.blueAccent : Colors.grey.shade600,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Duration Badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          widget.duration,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: widget.isMobile ? 11.sp : 12.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
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
}