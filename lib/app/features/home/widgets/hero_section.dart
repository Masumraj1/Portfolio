import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/app/core/constants.dart';
import 'custom_network_image.dart';
import 'hero_content.dart';

class HeroSection extends StatefulWidget {
  final bool isMobile;
  final Function(GlobalKey) scrollTo;
  final GlobalKey contactKey;

  const HeroSection({
    super.key,
    required this.isMobile,
    required this.scrollTo,
    required this.contactKey,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 20.w : 80.w,
        vertical: widget.isMobile ? 40.h : 80.h,
      ),
      child: Flex(
        direction: widget.isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side Text Content
          widget.isMobile
              ? HeroContent(
                  isMobile: widget.isMobile,
                  onHireMeTap: () => widget.scrollTo(widget.contactKey),
                )
              : Expanded(
                  flex: 6,
                  child: HeroContent(
                    isMobile: widget.isMobile,
                    onHireMeTap: () => widget.scrollTo(widget.contactKey),
                  ),
                ),

          if (!widget.isMobile) SizedBox(width: 40.w),

          // Right Side Unique Image Frame
          widget.isMobile
              ? _buildUniqueProfileImage()
              : Expanded(
                  flex: 5,
                  child: Center(child: _buildUniqueProfileImage()),
                ),
        ],
      ),
    );
  }

  Widget _buildUniqueProfileImage() {
    double size = widget.isMobile ? 250.r : 320.r;

    return Padding(
      padding: EdgeInsets.only(top: widget.isMobile ? 40.h : 0),
      child: SizedBox(
        width: size + 60,
        height: size + 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. Background Rotating Tech Ring
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    width: size + 40,
                    height: size + 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.cyanAccent.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: size / 2,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.cyanAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // 2. Ambient Glow Filter
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: 0.25),
                    blurRadius: 40,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),

            // 3. Cyber Shield / Squircle Profile Box with Rotation Matrix
            Transform.rotate(
              angle: -0.04, // হালকা টিল্ট এফেক্ট
              child: Container(
                width: size,
                height: size,
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.cyanAccent,
                      Colors.purpleAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: Container(
                    color: const Color(0xFF0D1117),
                    child: CustomNetworkImage(
                      imageUrl: AppConstants.imageUrl,
                      height: size,
                      width: size,

                      backgroundColor: const Color(0xFF0D1117),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              right: 10,
              child: _buildBadge("Flutter Dev", Icons.code_rounded),
            ),
            Positioned(
              top: -8.h,
              left: -10.w,
              child: _buildBadge("Riverpod Expert", Icons.bolt_rounded),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 16.sp),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
