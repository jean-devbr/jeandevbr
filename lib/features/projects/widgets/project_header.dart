import 'package:flutter/material.dart';

import '../../../app/theme.dart';

class ProjectHeader extends StatelessWidget {
  const ProjectHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: PortfolioColors.background,
      border: Border(
        bottom: BorderSide(color: PortfolioColors.border, width: 0.7),
      ),
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Row(
            children: [
              IconButton(
                tooltip: 'Voltar ao portfólio',
                onPressed: onBack,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: PortfolioColors.text,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Jean Costa',
                style: TextStyle(
                  color: PortfolioColors.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
