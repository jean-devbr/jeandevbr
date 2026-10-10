import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../models/project.dart';

class ProjectStackSection extends StatelessWidget {
  const ProjectStackSection({super.key, required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    if (project.stackGroups.isEmpty) {
      return _TechnologyWrap(technologies: project.technologies);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final group in project.stackGroups) ...[
          Text(
            group.title,
            style: const TextStyle(
              color: PortfolioColors.text,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          _TechnologyWrap(technologies: group.technologies),
          if (group != project.stackGroups.last) const SizedBox(height: 18),
        ],
      ],
    );
  }
}

class _TechnologyWrap extends StatelessWidget {
  const _TechnologyWrap({required this.technologies});

  final List<String> technologies;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 10,
    runSpacing: 10,
    children: [for (final tech in technologies) _TechnologyBadge(label: tech)],
  );
}

class _TechnologyBadge extends StatelessWidget {
  const _TechnologyBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: PortfolioColors.surfaceRaised,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: PortfolioColors.cyan,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
