import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme.dart';
import '../../../models/project.dart';
import 'portfolio_ui.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) => PortfolioSectionFrame(
    background: PortfolioColors.surface.withValues(alpha: 0.55),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const PortfolioEyebrow(label: 'PORTFÓLIO'),
        const SizedBox(height: 14),
        const PortfolioSectionTitle(first: 'Projetos em ', accent: 'destaque'),
        const SizedBox(height: 14),
        const Text(
          'Uma seleção de projetos pessoais e estudos práticos.',
          textAlign: TextAlign.center,
          style: TextStyle(color: PortfolioColors.muted, fontSize: 16),
        ),
        const SizedBox(height: 38),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 850
                ? 3
                : constraints.maxWidth >= 560
                ? 2
                : 1;
            const gap = 18.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final project in PortfolioProject.items)
                  SizedBox(
                    width: width,
                    child: _ProjectCard(project: project),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) => Material(
    color: PortfolioColors.background,
    borderRadius: BorderRadius.circular(18),
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => context.go('/projetos/${project.slug}'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: PortfolioColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 155,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF132A3B),
                    Color(0xFF171A30),
                    Color(0xFF101521),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -15,
                    top: -50,
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PortfolioColors.cyan.withValues(alpha: 0.08),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 22,
                    child: PortfolioTechPill(label: project.category),
                  ),
                  Center(
                    child: Text(
                      project.icon,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: PortfolioColors.cyan.withValues(alpha: 0.58),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 22,
                    bottom: 17,
                    child: Icon(
                      Icons.north_east_rounded,
                      color: PortfolioColors.muted,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      color: PortfolioColors.text,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: PortfolioColors.muted,
                      fontSize: 13,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final technology in project.technologies.take(3))
                        PortfolioTechPill(label: technology),
                    ],
                  ),
                  const SizedBox(height: 13),
                  const Row(
                    children: [
                      Text(
                        'Ver projeto',
                        style: TextStyle(
                          color: PortfolioColors.cyan,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 15,
                        color: PortfolioColors.cyan,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
