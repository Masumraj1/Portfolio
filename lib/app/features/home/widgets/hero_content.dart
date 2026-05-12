import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroContent extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onHireMeTap;

  const HeroContent({
    super.key,
    required this.isMobile,
    required this.onHireMeTap,
  });

  Future<void> _downloadCV() async {
    final Uri url = Uri.parse(
        'https://drive.google.com/drive/folders/12cjod9r1fyHR_isC_amzPB4IJ5_nuBVO?usp=sharing');
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // সাব-টাইটেল: মোবাইলে একটু ছোট রাখা হয়েছে
        Text(
          "HIRE ME FOR YOUR NEXT PROJECT",
          style: TextStyle(
            fontSize: isMobile ? 14.sp : 16.sp, // ৩২ এর জায়গায় ১৪-১৬ রাখা হয়েছে
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 15.h),

        // মেইন টাইটেল: মোবাইলে ২৮-৩২ স্পেস অনুযায়ী ঠিক আছে
        Text(
          "Mobile Application Developer (Flutter)",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 28.sp : 48.sp, // মোবাইলে ২৮, ডেস্কটপে ৪৮
            fontWeight: FontWeight.w900,
            height: 1.2,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20.h),

        // শর্ট ডেসক্রিপশন: মোবাইলে ১৪-১৬ রিডিবিলিটির জন্য ভালো
        Text(
          "2 Years+ of professional experience in building 15+ high-quality mobile apps with a focus on clean architecture and smooth UX.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 14.sp : 18.sp,
            color: Colors.grey.shade400,
            height: 1.6,
          ),
        ),
        SizedBox(height: 45.h),

        // বাটন সেকশন
        Wrap(
          spacing: 20.w,
          runSpacing: 15.h,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildActionButton(
              context,
              title: "Hire Me",
              onTap: onHireMeTap,
              isPrimary: true,
            ),
            _buildActionButton(
              context,
              title: "Download CV",
              onTap: _downloadCV,
              isPrimary: false,
              icon: Icons.download_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, {
        required String title,
        required VoidCallback onTap,
        required bool isPrimary,
        IconData? icon,
      }) {
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: isPrimary
          ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: isMobile ? 18.h : 22.h, // মোবাইলে প্যাডিং একটু কমানো
          ),
          backgroundColor: Colors.blueAccent,
          elevation: 5,
          shadowColor: Colors.blueAccent.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 16.sp : 18.sp, // এখানে ১৬-১৮ পারফেক্ট
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      )
          : OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: isMobile ? 18.h : 22.h,
          ),
          side: const BorderSide(color: Colors.blueAccent, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 16.sp : 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 10.w),
              Icon(icon, size: 20.sp, color: Colors.blueAccent),
            ],
          ],
        ),
      ),
    );
  }
}
// class HeroContent extends StatelessWidget {
//   final bool isMobile;
//   final VoidCallback onHireMeTap;
//
//   const HeroContent({
//     super.key,
//     required this.isMobile,
//     required this.onHireMeTap,
//   });
//   Future<void> _downloadCV() async {
//     final Uri url = Uri.parse('https://drive.google.com/drive/folders/12cjod9r1fyHR_isC_amzPB4IJ5_nuBVO?usp=sharing');
//
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $url');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//       children: [
//
//         SizedBox(height: 20.h),
//         Text(
//           "Mobile Application Developer (Flutter)",
//           textAlign: isMobile ? TextAlign.center : TextAlign.start,
//           style: TextStyle(
//             fontSize: isMobile ? 30.sp : 50.sp,
//             fontWeight: FontWeight.w900,
//             height: 1.2,
//           ),
//         ),
//         SizedBox(height: 20.h),
//         Text(
//           "2 Years, 4 Days of professional experience in building 15+ high-quality mobile apps.",
//           textAlign: isMobile ? TextAlign.center : TextAlign.start,
//           style: TextStyle(fontSize: 18.sp, color: Colors.grey),
//         ),
//
//         SizedBox(height: 40.h),
//         // Button Container
//         Wrap( // Wrap use korle automatically screen size onujayi row/column hoye jabe
//           spacing: 20.w, // Button duitir majhe faka
//           runSpacing: 15.h, // Mobile-e niche niche namle gap
//           alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
//           children: [
//             // Hire Me Button
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//               ),
//               onPressed: onHireMeTap,
//               child: const Text("Hire Me"),
//             ),
//
//             // Download CV Button (Outline Style)
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//                 side: BorderSide(color: Theme.of(context).primaryColor), // Border color
//               ),
//               onPressed: _downloadCV,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text("Download CV"),
//                   SizedBox(width: 8.w),
//                   const Icon(Icons.download_rounded, size: 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }