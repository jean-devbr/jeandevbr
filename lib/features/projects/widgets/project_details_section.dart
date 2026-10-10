import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../models/project.dart';

class ProjectDetailsSection extends StatelessWidget {
  const ProjectDetailsSection({super.key, required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (project.longDescription case final description?) ...[
        const SizedBox(height: 38),
        _ProjectDescription(title: 'Sobre o projeto', description: description),
      ],
      if (project.technicalDescription case final description?) ...[
        const SizedBox(height: 28),
        _ProjectDescription(
          title: 'Detalhes técnicos',
          description: description,
        ),
      ],
    ],
  );
}

class _ProjectDescription extends StatelessWidget {
  const _ProjectDescription({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 780),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: PortfolioColors.text,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            color: PortfolioColors.muted,
            fontSize: 15,
            height: 1.75,
          ),
        ),
      ],
    ),
  );
}
