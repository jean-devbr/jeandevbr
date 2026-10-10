import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/project.dart';
import 'widgets/project_actions.dart';
import 'widgets/project_details_section.dart';
import 'widgets/project_header.dart';
import 'widgets/project_hero.dart';
import 'widgets/project_not_found.dart';
import 'widgets/project_stack_section.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({required this.slug, super.key});

  final String slug;

  @override
  Widget build(BuildContext context) {
    PortfolioProject? project;
    for (final item in PortfolioProject.items) {
      if (item.slug == slug) {
        project = item;
        break;
      }
    }
    if (project == null) return const ProjectNotFound();

    void goHome() => context.go('/');

    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProjectHeader(onBack: goHome)),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 960),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 64, 24, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectHero(project: project),
                        ProjectDetailsSection(project: project),
                        const SizedBox(height: 28),
                        ProjectStackSection(project: project),
                        const SizedBox(height: 36),
                        ProjectActions(project: project, onBack: goHome),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
