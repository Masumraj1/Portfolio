import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scroll_controller_provider.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/project_section.dart';
import '../widgets/skill_section.dart';
import '../widgets/stats_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);
    final isMobile = MediaQuery.of(context).size.width < 768;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // Keys for Scrolling
    final aboutKey = GlobalKey();
    final educationKey = GlobalKey();
    final skillsKey = GlobalKey();
    final expKey = GlobalKey();
    final projectsKey = GlobalKey();
    final contactKey = GlobalKey();

    void scrollTo(GlobalKey key) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: isMobile
          ? MobileDrawer(
              scrollTo: scrollTo,
              aboutKey: aboutKey,
              educationKey: educationKey,
              skillsKey: skillsKey,
              expKey: expKey,
              projectsKey: projectsKey,
              contactKey: contactKey,
            )
          : null,
      body: Column(
        children: [
          // ===========>>Navbar <<=============
          CustomNavbar(
            isMobile: isMobile,
            onMenuPressed: () => scaffoldKey.currentState?.openDrawer(),
            scrollTo: scrollTo,
            aboutKey: aboutKey,
            skillsKey: skillsKey,
            expKey: expKey,
            projectsKey: projectsKey,
            contactKey: contactKey,
            educationKey: educationKey,
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  //============Hero Section===========
                  HeroSection(
                    isMobile: isMobile,
                    scrollTo: scrollTo,
                    contactKey: contactKey,
                  ),

                  //=============Stats Section===========
                  StatsSection(isMobile: isMobile),

                  //===============About Section===========
                  AboutSection(sectionKey: aboutKey, isMobile: isMobile),

                  //=============Education Section============
                  EducationSection(
                    sectionKey: educationKey,
                    isMobile: isMobile,
                  ),
                  // //===============Skill Section===========
                  SkillsSection(sectionKey: skillsKey, isMobile: isMobile),
                  //=================ExperienceSection ===========
                  ExperienceSection(sectionKey: expKey, isMobile: isMobile),
                  //=================ProjectsSection ===========
                  ProjectsSection(sectionKey: projectsKey, isMobile: isMobile),
                  //================Contact Section===============
                  ContactSection(sectionKey: contactKey, isMobile: isMobile),

                  //=============Footer Section==========
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
