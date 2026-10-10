import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../models/project.dart';
import '../../portfolio/widgets/portfolio_ui.dart';

class ProjectHero extends StatelessWidget {
  const ProjectHero({super.key, required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (project.imagePath case final imagePath?) ...[
        _ProjectCover(imagePath: imagePath, demoUrl: project.demoUrl),
        const SizedBox(height: 32),
      ],
      if (project.category.isNotEmpty) ...[
        Text(
          project.category.toUpperCase(),
          style: const TextStyle(
            color: PortfolioColors.cyan,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
      ],
      Text(
        project.title,
        style: TextStyle(
          color: PortfolioColors.text,
          fontSize: MediaQuery.sizeOf(context).width < 600 ? 36 : 46,
          height: 1.15,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.5,
        ),
      ),
      const SizedBox(height: 18),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Text(
          project.description,
          style: const TextStyle(
            color: PortfolioColors.muted,
            fontSize: 18,
            height: 1.75,
          ),
        ),
      ),
    ],
  );
}

class _ProjectCover extends StatelessWidget {
  const _ProjectCover({required this.imagePath, required this.demoUrl});

  final String imagePath;
  final String? demoUrl;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(18),
    child: AspectRatio(
      aspectRatio: 16 / 7,
      child: MouseRegion(
        cursor: demoUrl == null ? MouseCursor.defer : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: switch (demoUrl) {
            final demo? => () => openPortfolioUrl(demo),
            null => null,
          },
          child: Image.asset(
            imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
