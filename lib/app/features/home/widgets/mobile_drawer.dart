import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileDrawer extends StatelessWidget {
  final void Function(GlobalKey) scrollTo;

  final GlobalKey aboutKey;
  final GlobalKey educationKey;
  final GlobalKey skillsKey;
  final GlobalKey expKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  const MobileDrawer({
    super.key,
    required this.scrollTo,
    required this.aboutKey,
    required this.educationKey,
    required this.skillsKey,
    required this.expKey,
    required this.projectsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0D1117),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Text(
                'MASUM.',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 40.h),

              _DrawerItem(
                title: 'About',
                onTap: () => _navigate(context, aboutKey),
              ),
              _DrawerItem(
                title: 'Education',
                onTap: () => _navigate(context, educationKey),
              ),
              _DrawerItem(
                title: 'Skills',
                onTap: () => _navigate(context, skillsKey),
              ),
              _DrawerItem(
                title: 'Experience',
                onTap: () => _navigate(context, expKey),
              ),
              _DrawerItem(
                title: 'Projects',
                onTap: () => _navigate(context, projectsKey),
              ),

              const Spacer(),

              /// CTA
              ElevatedButton(
                onPressed: () => _navigate(context, contactKey),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: const Text('Contact Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate(BuildContext context, GlobalKey key) {
    Navigator.pop(context);
    scrollTo(key);
  }
}
class _DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
