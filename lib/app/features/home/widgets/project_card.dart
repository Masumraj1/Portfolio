import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_network_image.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;
  final List<String> techStack;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? rating;
  final String? downloads;
  final bool isMobile;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.techStack,
    this.playStoreUrl,
    this.appStoreUrl,
    this.rating,
    this.downloads,
    required this.isMobile,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  Future<void> _openUrl(String? urlString) async {
    if (urlString == null || urlString.isEmpty) return;
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildSingleImage(String imagePath) {
    bool isAsset = imagePath.startsWith('assets/');
    return Container(
      color: const Color(0xFF0D1117),
      padding: EdgeInsets.all(6.r),
      child: isAsset
          ? Image.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      )
          : CustomNetworkImage(
        imageUrl: imagePath,
        height: double.infinity,
        width: double.infinity,
        boxShape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isHovered
                ? Colors.blueAccent.withValues(alpha: 0.6)
                : Colors.white.withValues(alpha: 0.08),
            width: 1.2,
          ),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: Colors.blueAccent.withValues(alpha: 0.2),
              blurRadius: 25,
              spreadRadius: 2,
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                    child: AnimatedScale(
                      scale: isHovered ? 1.02 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: widget.images.length > 1
                          ? Row(
                        children: widget.images.map((img) {
                          return Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.05),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: _buildSingleImage(img),
                            ),
                          );
                        }).toList(),
                      )
                          : _buildSingleImage(widget.images.first),
                    ),
                  ),

                  /// Floating Stats Chips
                  Positioned(
                    top: 12.h,
                    left: 12.w,
                    right: 12.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.rating != null && widget.rating!.isNotEmpty)
                          _buildHeaderChip(
                            icon: Icons.star_rounded,
                            iconColor: Colors.amber,
                            label: widget.rating!,
                          ),
                        if (widget.downloads != null && widget.downloads!.isNotEmpty)
                          _buildHeaderChip(
                            icon: Icons.download_rounded,
                            iconColor: Colors.blueAccent,
                            label: widget.downloads!,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// 2. Clean Text Details & Actions Section
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(18.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: widget.isMobile ? 18.sp : 21.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          widget.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: widget.isMobile ? 12.sp : 13.sp,
                            color: const Color(0xFF8B949E),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),

                    /// Tech Stack
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 6.h,
                      children: widget.techStack.map((tech) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: Colors.blueAccent.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    /// Store Buttons
                    Row(
                      children: [
                        _buildStoreButton(
                          label: 'Play Store',
                          icon: Icons.android_rounded,
                          color: Colors.greenAccent,
                          url: widget.playStoreUrl,
                        ),
                        SizedBox(width: 10.w),
                        _buildStoreButton(
                          label: 'App Store',
                          icon: Icons.apple_rounded,
                          color: Colors.white,
                          url: widget.appStoreUrl,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderChip({
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: iconColor),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton({
    required String label,
    required IconData icon,
    required Color color,
    required String? url,
  }) {
    final bool hasUrl = url != null && url.isNotEmpty;

    return Expanded(
      child: InkWell(
        onTap: hasUrl ? () => _openUrl(url) : null,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: hasUrl
                ? color.withValues(alpha: 0.12)
                : Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: hasUrl
                  ? color.withValues(alpha: 0.4)
                  : Colors.white.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15.sp,
                color: hasUrl ? color : Colors.grey.shade600,
              ),
              SizedBox(width: 6.w),
              Flexible(
                child: Text(
                  hasUrl ? label : 'Soon',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: hasUrl ? color : Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}