import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const groups = <(String, IconData, List<String>)>[
    (
      'Front-end',
      Icons.devices_rounded,
      ['Dart/Flutter', 'Vue3', 'React', 'TypeScript', 'Tailwind', 'HTML/CSS'],
    ),
    (
      'Back-end & APIs',
      Icons.account_tree_outlined,
      ['Java', 'Spring Boot', 'Python', 'FastAPI', 'REST'],
    ),
    (
      'Banco de Dados',
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
            const gap = 16.0;
            return Column(
              children: [
                for (
                  var start = 0;
                  start < groups.length;
                  start += columns
                ) ...[
                  if (start > 0) const SizedBox(height: gap),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var i = start; i < start + columns; i++) ...[
                          if (i > start) const SizedBox(width: gap),
                          Expanded(
                            child: i < groups.length
                                ? _SkillCard(
                                    title: groups[i].$1,
                                    icon: groups[i].$2,
                                    skills: groups[i].$3,
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
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
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: PortfolioColors.surface,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: PortfolioColors.cyan.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: PortfolioColors.cyan.withValues(alpha: 0.18),
                ),
              ),
              child: Icon(icon, color: PortfolioColors.cyan, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: PortfolioColors.text,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(height: 1, color: PortfolioColors.border),
        const SizedBox(height: 18),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final skill in skills) PortfolioTechPill(label: skill),
          ],
        ),
      ],
    ),
  );
}
