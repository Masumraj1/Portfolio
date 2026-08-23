import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsSection extends StatelessWidget {
  final bool isMobile;

  const StatsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40.h : 60.h,
        horizontal: isMobile ? 20.w : 60.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117).withValues(alpha: 0.6),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: isMobile ? 30.w : 80.w,
          runSpacing: 30.h,
          children: const [
            _StatItem(value: "3+", label: "Years Experience"),
            _StatItem(value: "1+", label: "Self Learning"),
            _StatItem(value: "15+", label: "Projects Completed"),
            _StatItem(value: "3", label: "Companies"),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatefulWidget {
  final String value;
  final String label;

  const _StatItem({
    required this.value,
    required this.label,
  });

  @override
  State<_StatItem> createState() => _StatItemState();
}

class _StatItemState extends State<_StatItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isHovered
              ? Colors.blueAccent.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isHovered
                ? Colors.blueAccent.withValues(alpha: 0.3)
                : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isHovered
                    ? [Colors.cyanAccent, Colors.blueAccent]
                    : [Colors.blueAccent, Colors.lightBlueAccent],
              ).createShader(bounds),
              child: Text(
                widget.value,
                style: TextStyle(
                  fontSize: isSmallScreen ? 32.sp : 44.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              widget.label.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 11.sp : 13.sp,
                fontWeight: FontWeight.w700,
                color: isHovered ? Colors.white : const Color(0xFF8B949E),
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}