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
        // =========== Available Badge ===========
        _buildAvailableBadge(),
        SizedBox(height: 20.h),

        // =========== Gradient Title ===========
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFF90CAF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            "Mobile Application\nDeveloper (Flutter)",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 32.sp : 50.sp,
              fontWeight: FontWeight.w900,
              height: 1.15,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
        ),
        SizedBox(height: 20.h),

        // =========== Bio / Tagline ===========
        Text(
          "Specializing in Clean Architecture, Riverpod, and high-performance cross-platform apps with 3+ years of production experience.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 14.sp : 17.sp,
            color: const Color(0xFF8B949E),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 36.h),

        // =========== Action Buttons ===========
        Wrap(
          spacing: 16.w,
          runSpacing: 14.h,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _HoverActionButton(
              title: "Hire Me",
              onTap: onHireMeTap,
              isPrimary: true,
              isMobile: isMobile,
            ),
            _HoverActionButton(
              title: "Download CV",
              onTap: _downloadCV,
              isPrimary: false,
              icon: Icons.download_rounded,
              isMobile: isMobile,
            ),
          ],
        ),
      ],
    );
  }

  // Live Status Badge Component (FIXED HERE)
  Widget _buildAvailableBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.greenAccent.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent,
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              "AVAILABLE FOR FREELANCE & FULL-TIME",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isMobile ? 10.sp : 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.greenAccent,
                letterSpacing: isMobile ? 0.5 : 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Interactive Hover Action Button
class _HoverActionButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isPrimary;
  final IconData? icon;
  final bool isMobile;

  const _HoverActionButton({
    required this.title,
    required this.onTap,
    required this.isPrimary,
    this.icon,
    required this.isMobile,
  });

  @override
  State<_HoverActionButton> createState() => _HoverActionButtonState();
}

class _HoverActionButtonState extends State<_HoverActionButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = widget.isMobile ? double.infinity : 170.w;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.isMobile ? double.infinity : null,
          constraints: BoxConstraints(minWidth: buttonWidth),
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
            vertical: widget.isMobile ? 16.h : 18.h,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (isHovered ? Colors.blueAccent.shade700 : Colors.blueAccent)
                : (isHovered ? Colors.blueAccent.withValues(alpha: 0.1) : Colors.transparent),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.blueAccent
                  : (isHovered ? Colors.blueAccent : Colors.white24),
              width: 1.5,
            ),
            boxShadow: widget.isPrimary && isHovered
                ? [
              BoxShadow(
                color: Colors.blueAccent.withValues(alpha: 0.4),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: widget.isMobile ? 15.sp : 16.sp,
                  fontWeight: FontWeight.bold,
                  color: widget.isPrimary
                      ? Colors.white
                      : (isHovered ? Colors.blueAccent : Colors.white),
                ),
              ),
              if (widget.icon != null) ...[
                SizedBox(width: 8.w),
                Icon(
                  widget.icon,
                  size: 18.sp,
                  color: widget.isPrimary
                      ? Colors.white
                      : (isHovered ? Colors.blueAccent : Colors.white),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}