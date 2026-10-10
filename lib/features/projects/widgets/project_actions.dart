import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../../../models/project.dart';
import '../../portfolio/widgets/portfolio_ui.dart';

class ProjectActions extends StatelessWidget {
  const ProjectActions({
    super.key,
    required this.project,
    required this.onBack,
  });

  final PortfolioProject project;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          if (project.demoUrl case final demo?)
            _ProjectAction(
              label: 'Abrir demonstração',
              icon: Icons.open_in_new_rounded,
              primary: true,
              onPressed: () => openPortfolioUrl(demo),
            ),
          if (project.githubUrl case final github?)
            _ProjectAction(
              label: 'Ver código no GitHub',
              icon: Icons.code_rounded,
              onPressed: () => openPortfolioUrl(github),
            ),
        ],
      ),
      const SizedBox(height: 38),
      OutlinedButton.icon(
        onPressed: onBack,
        icon: const Icon(Icons.arrow_back_rounded),
        label: const Text('Voltar ao portfólio'),
      ),
    ],
  );
}

class _ProjectAction extends StatelessWidget {
  const _ProjectAction({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.primary = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool primary;

  @override
  Widget build(BuildContext context) => primary
      ? FilledButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 17),
          label: Text(label),
          style: FilledButton.styleFrom(
            backgroundColor: PortfolioColors.cyan,
            foregroundColor: PortfolioColors.background,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          ),
        )
      : OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 17),
          label: Text(label),
          style: OutlinedButton.styleFrom(
            foregroundColor: PortfolioColors.text,
            side: const BorderSide(color: PortfolioColors.border),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          ),
        );
}
