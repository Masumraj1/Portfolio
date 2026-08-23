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
        icon: Icons.school_rounded,
      ),
      EducationItem(
        duration: '2020',
        degree: 'Higher Secondary Certificate (HSC)',
        institution: 'Pirgonj Government College, Pirgonj, Thakurgaon',
        icon: Icons.history_edu_rounded,
      ),
      EducationItem(
        duration: '2018',
        degree: 'Secondary School Certificate (SSC)',
        institution: 'Nakati Hat High School, Pirgonj, Thakurgaon',
        icon: Icons.menu_book_rounded,
      ),
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
              "Education",
              style: TextStyle(
                fontSize: isMobile ? 28.sp : 38.sp,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 60.h),

          // =========== Timeline Content ===========
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900.w),
            child: Column(
              children: educationList
                  .map((item) => EducationTimelineCard(
                item: item,
                isMobile: isMobile,
                isLast: educationList.last == item,
              ))
                  .toList(),
            ),
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
  final IconData icon;

  const EducationItem({
    required this.duration,
    required this.degree,
    required this.institution,
    required this.icon,
  });
}

class EducationTimelineCard extends StatefulWidget {
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
  State<EducationTimelineCard> createState() => _EducationTimelineCardState();
}

class _EducationTimelineCardState extends State<EducationTimelineCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.isMobile ? 32.r : 40.r,
                height: widget.isMobile ? 32.r : 40.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHovered
                      ? Colors.blueAccent
                      : const Color(0xFF161B22),
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
                  widget.item.icon,
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

          /// Content Card
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              cursor: SystemMouseCursors.click,
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
                    // Year Chip Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        widget.item.duration,
                        style: TextStyle(
                          fontSize: widget.isMobile ? 11.sp : 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    Text(
                      widget.item.degree,
                      style: TextStyle(
                        fontSize: widget.isMobile ? 16.sp : 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14.sp,
                          color: const Color(0xFF8B949E),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            widget.item.institution,
                            style: TextStyle(
                              fontSize: widget.isMobile ? 12.sp : 14.sp,
                              color: const Color(0xFF8B949E),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}