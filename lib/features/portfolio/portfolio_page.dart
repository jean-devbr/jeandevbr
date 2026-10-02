import 'package:flutter/material.dart';

import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/portfolio_footer.dart';
import 'widgets/portfolio_header.dart';
import 'widgets/portfolio_ui.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final targetContext = key.currentContext;
    if (targetContext == null) return;
    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: PortfolioWhatsAppButton(
      onPressed: () => openPortfolioUrl('https://wa.me/5521989365166'),
    ),
    body: SelectionArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PortfolioHeader(
              onAbout: () => _scrollTo(_aboutKey),
              onSkills: () => _scrollTo(_skillsKey),
              onProjects: () => _scrollTo(_projectsKey),
              onContact: () => _scrollTo(_contactKey),
            ),
          ),
          SliverToBoxAdapter(
            child: HeroSection(onProjects: () => _scrollTo(_projectsKey)),
          ),
          SliverToBoxAdapter(child: AboutSection(key: _aboutKey)),
          SliverToBoxAdapter(child: SkillsSection(key: _skillsKey)),
          SliverToBoxAdapter(child: ProjectsSection(key: _projectsKey)),
          SliverToBoxAdapter(child: ContactSection(key: _contactKey)),
          const SliverToBoxAdapter(child: PortfolioFooter()),
        ],
      ),
    ),
  );
}
