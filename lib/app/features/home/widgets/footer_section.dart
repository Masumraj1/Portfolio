import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scroll_controller_provider.dart';

class FooterSection extends ConsumerWidget {
  const FooterSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h),

          /// Middle Section: Brand, Links & Socials
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Wrap(
              spacing: 40.w,
              runSpacing: 30.h,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                /// Brand & Info
                SizedBox(
                  width: 280.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Md. Masum Rana",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Senior Mobile Application Developer specializing in Flutter, Native Android & Clean Architecture.",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[400],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Social Media Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CONNECT WITH ME",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _socialSvgIcon(
                          asset: 'assets/icons/linkedin.svg',
                          tooltip: 'LinkedIn',
                          onTap: () => _openUrl('https://www.linkedin.com/in/flutterapp/'),
                        ),
                        _socialSvgIcon(
                          asset: 'assets/icons/github_new.svg',
                          tooltip: 'GitHub',
                          onTap: () => _openUrl('https://github.com/Masumraj1'),
                        ),
                        _socialSvgIcon(
                          asset: 'assets/icons/facebook.svg',
                          tooltip: 'Facebook',
                          onTap: () => _openUrl('https://www.facebook.com/sadibestu/'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 40.h),
          Divider(color: Colors.white.withValues(alpha: 0.05)),
          SizedBox(height: 20.h),

          /// Bottom Copyright & Scroll to Top (FIXED WITH LAYOUTBUILDER)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 500;

                return Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
                  children: [
                    Text(
                      "© 2026 Md. Masum Rana. All Rights Reserved.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12.sp,
                      ),
                    ),
                    if (isMobile) SizedBox(height: 16.h),

                    /// Back to Top Button
                    InkWell(
                      onTap: () {
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeInOut,
                        );
                      },
                      borderRadius: BorderRadius.circular(8.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.03),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Back to Top",
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 14.sp,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _socialSvgIcon({
    required String asset,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            width: 42.w,
            height: 42.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white.withValues(alpha: 0.04),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: SvgPicture.asset(
              asset,
              fit: BoxFit.contain,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}