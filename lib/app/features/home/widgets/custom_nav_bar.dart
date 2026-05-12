import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_button.dart';

class CustomNavbar extends StatelessWidget {
  final bool isMobile;
  final void Function(GlobalKey) scrollTo;
  final VoidCallback? onMenuPressed; // এটি যোগ করুন
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
    required this.contactKey, this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Logo
          GestureDetector(
            onTap: () => scrollTo(aboutKey),
            child: Text(
              'MASUM.',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: Colors.blueAccent,
              ),
            ),
          ),

          /// Desktop Navigation
          if (!isMobile)
            Row(
              children: [
                NavButton(title: "About", onTap: () => scrollTo(aboutKey)),
                NavButton(title: "Education", onTap: () => scrollTo(educationKey)),
                NavButton(title: "Skills", onTap: () => scrollTo(skillsKey)),
                NavButton(title: "Experience", onTap: () => scrollTo(expKey)),
                NavButton(title: "Projects", onTap: () => scrollTo(projectsKey)),
                SizedBox(width: 20.w),

                /// CTA Button
                ElevatedButton(
                  onPressed: () => scrollTo(contactKey),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 14.h,
                    ),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )

          else
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              color: Colors.white,
              onPressed: onMenuPressed
            ),
        ],
      ),
    );
  }
}
