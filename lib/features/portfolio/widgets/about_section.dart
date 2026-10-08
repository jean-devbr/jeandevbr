import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) => PortfolioSectionFrame(
    background: PortfolioColors.surface.withValues(alpha: 0.55),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 760;
        const biography =
            'Sou um desenvolvedor do Rio de Janeiro, curioso por natureza e sempre aprendendo. Gosto de transformar problemas em soluções digitais claras, úteis e bem construídas.\n\nTenho experiência criando aplicações web, APIs e projetos mobile. No meu trabalho, valorizo código organizado, colaboração e uma boa experiência para quem usa o produto.';
        final about = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PortfolioEyebrow(label: 'UM POUCO SOBRE MIM'),
            const SizedBox(height: 15),
            const PortfolioSectionTitle(
              first: 'Tecnologia com ',
              accent: 'propósito',
              centered: false,
            ),
            const SizedBox(height: 20),
            const Text(
              biography,
              style: TextStyle(
                color: PortfolioColors.muted,
                fontSize: 16,
                height: 1.9,
              ),
            ),
            const SizedBox(height: 26),
            const Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _StatCard(value: '2+', label: 'anos de experiência'),
                _StatCard(value: '30+', label: 'projetos concluídos'),
              ],
            ),
          ],
        );
        if (narrow) return about;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: about),
            const SizedBox(width: 70),
            const Expanded(child: _AboutQuoteCard()),
          ],
        );
      },
    ),
  );
}

class _AboutQuoteCard extends StatelessWidget {
  const _AboutQuoteCard();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      color: PortfolioColors.background,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.format_quote_rounded, color: PortfolioColors.cyan, size: 38),
        SizedBox(height: 14),
        Text(
          '“Aprender sempre, construir com cuidado e entregar algo que faça diferença.”',
          style: TextStyle(
            color: PortfolioColors.text,
            fontSize: 23,
            height: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'JEAN COSTA',
          style: TextStyle(
            color: PortfolioColors.cyan,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minWidth: 154),
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
    decoration: BoxDecoration(
      color: PortfolioColors.background,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: PortfolioColors.cyan,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: PortfolioColors.muted, fontSize: 12),
        ),
      ],
    ),
  );
}
