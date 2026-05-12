import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(16.r),
      width: isMobile ? double.infinity : 350.w, // ডেসকটপে সুন্দর দেখানোর জন্য ফিক্সড উইডথ
      decoration: BoxDecoration(
        color: const Color(0xFF161B22), // আপনার থিমের সাথে ম্যাচিং কার্ড কালার
        borderRadius: BorderRadius.circular(15.r),
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
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}