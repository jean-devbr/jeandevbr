import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: Color(0xF2080B12),
      border: Border(
        bottom: BorderSide(color: PortfolioColors.border, width: 0.7),
      ),
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: portfolioContentWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 650;
              return Row(
                mainAxisAlignment: isCompact
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  if (isCompact)
                    PopupMenuButton<int>(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: PortfolioColors.text,
                      ),
                      color: PortfolioColors.surfaceRaised,
                      onSelected: (value) =>
                          [onAbout, onSkills, onProjects, onContact][value](),
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 0, child: Text('Sobre')),
                        PopupMenuItem(value: 1, child: Text('Tecnologias')),
                        PopupMenuItem(value: 2, child: Text('Projetos')),
                        PopupMenuItem(value: 3, child: Text('Contato')),
                      ],
                    )
                  else ...[
                    _NavText('Sobre', onPressed: onAbout),
                    _NavText('Tecnologias', onPressed: onSkills),
                    _NavText('Projetos', onPressed: onProjects),
                    const SizedBox(width: 10),
                    PortfolioOutlineButton(
                      label: 'Vamos conversar',
                      onPressed: onContact,
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
}

class _NavText extends StatelessWidget {
  const _NavText(this.label, {required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: PortfolioColors.muted,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      textStyle: const TextStyle(fontSize: 18),
    ),
    child: Text(label),
  );
}
