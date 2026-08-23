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

<<<<<<< HEAD
  // লঞ্চার ফাংশন (Uri কনফিগারেশন সহ)
  Future<void> _launch(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint("Error launching URL: $e");
=======
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
>>>>>>> gh-pages
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
<<<<<<< HEAD
        vertical: 100.h,
        horizontal: isMobile ? 24.w : 120.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E12), // ডার্ক থিম হলে এটি খুব সুন্দর লাগবে
=======
        vertical: isMobile ? 60.h : 100.h,
        horizontal: isMobile ? 24.w : 120.w,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.02),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
>>>>>>> gh-pages
      ),
      child: Column(
        children: [
          // Section Title with Subtitle
          Text(
            "Get In Touch",
            style: TextStyle(
<<<<<<< HEAD
              fontSize: isMobile ? 28.sp : 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: 60.w,
=======
              fontSize: isMobile ? 28.sp : 34.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 50.w,
>>>>>>> gh-pages
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
<<<<<<< HEAD
          SizedBox(height: 16.h),
          Text(
            "Feel free to reach out for collaborations or just a friendly hello!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 80.h),
=======
          SizedBox(height: isMobile ? 40.h : 80.h),
>>>>>>> gh-pages

          // Layout Handling
          isMobile
              ? Column(
            children: [
<<<<<<< HEAD
              // Left Side: Contact Cards
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  children: [
                    _buildContactCard(
                      icon: Icons.alternate_email_rounded,
                      label: "Email Me",
                      value: "masumrna927@gmail.com",
                      onTap: () => _launch('mailto:masumrna927@gmail.com'),
                    ),
                    _buildContactCard(
                      icon: Icons.phone_iphone_rounded,
                      label: "Call Me",
                      value: "+880 1731090564",
                      onTap: () => _launch('tel:+8801731090564'),
                    ),
                    _buildContactCard(
                      icon: Icons.location_on_rounded,
                      label: "Location",
                      value: "Pallabi, Section 12, Dhaka",
                      onTap: () => _launch('https://maps.google.com/?q=Pallabi,Dhaka'),
                    ),
                  ],
                ),
              ),

              if (!isMobile) SizedBox(width: 100.w),
              if (isMobile) SizedBox(height: 60.h),

              // Right Side: CTA Section
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Container(
                  padding: EdgeInsets.all(40.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.rocket_launch_rounded, color: Colors.blueAccent, size: 50.sp),
                      SizedBox(height: 20.h),
                      Text(
                        "Have a project in mind?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Let's turn your idea into a digital masterpiece.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white60),
                      ),
                      SizedBox(height: 35.h),
                      _buildWhatsAppButton(),
                    ],
                  ),
                ),
              ),
=======
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
>>>>>>> gh-pages
            ],
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  // কন্টাক্ট কার্ড তৈরি করার হেল্পার উইজেট
  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: Colors.blueAccent, size: 24.sp),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: TextStyle(color: Colors.white54, fontSize: 12.sp)),
                    Text(value, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // প্রফেশনাল হোয়াটসঅ্যাপ বাটন
  Widget _buildWhatsAppButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 22.h),
        backgroundColor: const Color(0xFF25D366),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      ),
      onPressed: () => _launch('https://wa.me/8801731090564?text=Hi%20Masum!'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.chat_bubble_rounded, size: 20),
          SizedBox(width: 12.w),
          Text(
            "Chat on WhatsApp",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
=======

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
            value: "Mirpur 12, Section 12, Dhaka",
          ),
        ),
      ],
    );
  }

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
>>>>>>> gh-pages
      ),
    );
  }
}