import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_info_tile.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const ContactSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  // URL লঞ্চ করার ফাংশন (উন্নত এরর হ্যান্ডেলিং সহ)
  Future<void> _launch(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60.h : 100.h,
        horizontal: isMobile ? 24.w : 120.w,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.02),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
      child: Column(
        children: [
          // Section Title
          Text(
            "Get In Touch",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 34.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 50.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 80.h),

          // Layout Handling
          isMobile
              ? Column(
            children: [
              _buildContactDetails(),
              SizedBox(height: 60.h),
              _buildCTASection(),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildContactDetails()),
              SizedBox(width: 50.w),
              Expanded(child: _buildCTASection()),
            ],
          ),
        ],
      ),
    );
  }

  // বাম পাশের কন্টাক্ট ডিটেইলস
  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _clickableTile(
          onTap: () => _launch('mailto:masumrna927@gmail.com'),
          child: const ContactInfoTile(
            icon: Icons.alternate_email_rounded,
            label: "Email Me",
            value: "masumrna927@gmail.com",
          ),
        ),
        SizedBox(height: 15.h),
        _clickableTile(
          onTap: () => _launch('tel:+8801731090564'),
          child: const ContactInfoTile(
            icon: Icons.phone_iphone_rounded,
            label: "Call Me",
            value: "+880 1731090564",
          ),
        ),
        SizedBox(height: 15.h),
        _clickableTile(
          onTap: () => _launch('https://maps.google.com/?q=Pollobi,Section12,Dhaka'),
          child: const ContactInfoTile(
            icon: Icons.location_on_rounded,
            label: "Location",
            value: "Pollobi, Section 12, Dhaka",
          ),
        ),
      ],
    );
  }

  // ডান পাশের CTA (Call to Action)
  Widget _buildCTASection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have a project in mind?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 18.sp : 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 25.h),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 30.w : 40.w,
              vertical: 22.h,
            ),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            elevation: 8,
            shadowColor: Colors.blueAccent.withValues(alpha: 0.3),
          ),
          onPressed: () => _launch('mailto:masumrna927@gmail.com?subject=Project Inquiry'),
          icon: Icon(Icons.send_rounded, size: 20.sp),
          label: Text(
            "Let's Build Something",
            style: TextStyle(
              fontSize: isMobile ? 14.sp : 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _clickableTile({required VoidCallback onTap, required Widget child}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}