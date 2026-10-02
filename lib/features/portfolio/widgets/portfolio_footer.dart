import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: PortfolioColors.border, width: 0.7),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: portfolioContentWidth),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final narrow = constraints.maxWidth < 500;
            final copyright = const Text(
              '© 2026 Jean Costa. Feito com cuidado.',
              style: TextStyle(color: PortfolioColors.muted, fontSize: 12),
            );
            final social = Wrap(
              spacing: 12,
              children: [
                PortfolioSocialIcon(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  url: 'https://github.com/jean-devbr',
                ),
                PortfolioSocialIcon(
                  icon: Icons.work_outline_rounded,
                  label: 'LinkedIn',
                  url: 'https://www.linkedin.com/in/jean-costa-0040962b8/',
                ),
                PortfolioSocialIcon(
                  icon: Icons.camera_alt_outlined,
                  label: 'Instagram',
                  url: 'https://www.instagram.com/jeanooficial12/',
                ),
              ],
            );
            if (narrow) {
              return Column(
                children: [copyright, const SizedBox(height: 12), social],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [copyright, social],
            );
          },
        ),
      ),
    ),
  );
}
