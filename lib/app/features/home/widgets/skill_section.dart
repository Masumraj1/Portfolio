import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsSection extends StatefulWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const SkillsSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // ১.৫ সেকেন্ডে স্মুথ অ্যানিমেশন
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    // পেজ লোড বা সেকশনে আসার সাথে সাথে অ্যানিমেশন স্টার্ট হবে
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skillCategories = [
      {
        'title': 'Core Languages & Framework',
        'icon': Icons.code_rounded,
        'skills': [
          {'name': 'Flutter', 'percent': 0.95},
          {'name': 'Dart', 'percent': 0.90},
          {'name': 'Kotlin', 'percent': 0.75},
        ],
      },
      {
        'title': 'Architecture & State',
        'icon': Icons.architecture_rounded,
        'skills': [
          {'name': 'Clean Architecture', 'percent': 0.90},
          {'name': 'Riverpod', 'percent': 0.85},
          {'name': 'GetX', 'percent': 0.80},
        ],
      },
      {
        'title': 'Native & Core Features',
        'icon': Icons.phone_android_rounded,
        'skills': [
          {'name': 'Platform Channels', 'percent': 0.70},
          {'name': 'Background Services', 'percent': 0.75},
          {'name': 'Google Maps', 'percent': 0.85},
        ],
      },
      {
        'title': 'Networking & Backend',
        'icon': Icons.alt_route_rounded,
        'skills': [
          {'name': 'API (Dio / Http)', 'percent': 0.95},
          {'name': 'Firebase', 'percent': 0.85},
          {'name': 'REST & WebSockets', 'percent': 0.80},
        ],
      },
    ];

    return Container(
      key: widget.sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 60.h : 90.h,
        horizontal: widget.isMobile ? 16.w : 100.w,
      ),
      child: Column(
        children: [
          SectionTitle(title: "Technical Expertise", isMobile: widget.isMobile),
          SizedBox(height: widget.isMobile ? 40.h : 60.h),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = widget.isMobile ? 1 : 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skillCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24.w,
                  mainAxisSpacing: 24.h,
                  mainAxisExtent: widget.isMobile ? 290.h : 310.h,
                ),
                itemBuilder: (context, index) {
                  return _buildSkillCard(skillCategories[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> category) {
    return Container(
      padding: EdgeInsets.all(widget.isMobile ? 20.r : 24.r),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Card Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  category['icon'],
                  color: Colors.blueAccent,
                  size: widget.isMobile ? 22.sp : 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  category['title'],
                  style: TextStyle(
                    fontSize: widget.isMobile ? 16.sp : 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),
          const Divider(color: Colors.white10, height: 1),
          SizedBox(height: 20.h),

          /// Animated Progress Bars
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (category['skills'] as List<Map<String, dynamic>>).map((skill) {
                return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final double currentPercent = skill['percent'] * _animation.value;
                    return _buildProgressBar(
                      name: skill['name'],
                      percent: currentPercent,
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar({required String name, required double percent}) {
    int percentageValue = (percent * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: widget.isMobile ? 13.sp : 14.sp,
                color: Colors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "$percentageValue%",
              style: TextStyle(
                fontSize: widget.isMobile ? 12.sp : 13.sp,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontFamily: 'Monospace',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Stack(
          children: [
            // Background Track
            Container(
              height: 6.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF0D1117),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
            ),
            // Animated Foreground Progress
            FractionallySizedBox(
              widthFactor: percent.clamp(0.0, 1.0),
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withValues(alpha: 0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
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
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFF90CAF9)],
          ).createShader(bounds),
          child: Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 36.sp,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: isMobile ? 40.w : 60.w,
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