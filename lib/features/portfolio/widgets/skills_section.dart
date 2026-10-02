import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const groups = <(String, IconData, List<String>)>[
    (
      'Aplicações',
      Icons.devices_rounded,
      ['Flutter', 'Dart', 'React', 'TypeScript'],
    ),
    (
      'Backend e APIs',
      Icons.account_tree_outlined,
      ['Java', 'Spring Boot', 'Python', 'FastAPI', 'REST'],
    ),
    (
      'Dados',
      Icons.storage_rounded,
      ['PostgreSQL', 'MySQL', 'SQLite', 'Supabase'],
    ),
    ('Ferramentas', Icons.build_outlined, ['Git', 'Docker', 'Linux', 'CI/CD']),
  ];

  @override
  Widget build(BuildContext context) => PortfolioSectionFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const PortfolioEyebrow(label: 'TECNOLOGIAS E FERRAMENTAS'),
        const SizedBox(height: 14),
        const PortfolioSectionTitle(
          first: 'Minha ',
          accent: 'caixa de ferramentas',
        ),
        const SizedBox(height: 14),
        const Text(
          'Tecnologias que uso para transformar ideias em produtos.',
          textAlign: TextAlign.center,
          style: TextStyle(color: PortfolioColors.muted, fontSize: 16),
        ),
        const SizedBox(height: 38),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 850
                ? 4
                : constraints.maxWidth >= 560
                ? 2
                : 1;
            final gap = 15.0;
            final width =
                (constraints.maxWidth - gap * (columns - 1)) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final group in groups)
                  SizedBox(
                    width: width,
                    child: _SkillCard(
                      title: group.$1,
                      icon: group.$2,
                      skills: group.$3,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({
    required this.title,
    required this.icon,
    required this.skills,
  });

  final String title;
  final IconData icon;
  final List<String> skills;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(21),
    decoration: BoxDecoration(
      color: PortfolioColors.surface,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: PortfolioColors.cyan, size: 25),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            color: PortfolioColors.text,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 7,
          runSpacing: 8,
          children: [
            for (final skill in skills) PortfolioTechPill(label: skill),
          ],
        ),
      ],
    ),
  );
}
