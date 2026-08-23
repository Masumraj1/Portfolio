import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_button.dart';

class CustomNavbar extends StatelessWidget {
  final bool isMobile;
  final void Function(GlobalKey) scrollTo;
  final VoidCallback? onMenuPressed;
  final GlobalKey aboutKey;
  final GlobalKey educationKey;
  final GlobalKey skillsKey;
  final GlobalKey expKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  const CustomNavbar({
    super.key,
    required this.isMobile,
    required this.scrollTo,
    required this.aboutKey,
    required this.educationKey,
    required this.skillsKey,
    required this.expKey,
    required this.projectsKey,
    required this.contactKey,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.w : 60.w,
            vertical: 14.h,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // =========== Brand / Logo ===========
              GestureDetector(
                onTap: () => scrollTo(aboutKey),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent],
                    ).createShader(bounds),
                    child: Text(
                      'MASUM.',
                      style: TextStyle(
                        fontSize: isMobile ? 20.sp : 24.sp,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // =========== Desktop Navigation ===========
              if (!isMobile)
                Row(
                  children: [
                    NavButton(title: "About", onTap: () => scrollTo(aboutKey)),
                    NavButton(title: "Education", onTap: () => scrollTo(educationKey)),
                    NavButton(title: "Skills", onTap: () => scrollTo(skillsKey)),
                    NavButton(title: "Experience", onTap: () => scrollTo(expKey)),
                    NavButton(title: "Projects", onTap: () => scrollTo(projectsKey)),
                    SizedBox(width: 24.w),

                    // Modern Animated Contact Button
                    _ContactButton(onTap: () => scrollTo(contactKey)),
                  ],
                )
              // =========== Mobile Menu Button ===========
              else
                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  color: Colors.white,
                  iconSize: 26.sp,
                  splashRadius: 24,
                  onPressed: onMenuPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Styled Contact Button with Glow/Hover Animation
class _ContactButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ContactButton({required this.onTap});

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isHovered
                  ? [Colors.blueAccent, Colors.blue]
                  : [Colors.blueAccent.withValues(alpha: 0.8), Colors.blue.withValues(alpha: 0.8)],
            ),
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: Colors.blueAccent.withValues(alpha: 0.4),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ]
                : [],
          ),
          child: Text(
            "Contact",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}