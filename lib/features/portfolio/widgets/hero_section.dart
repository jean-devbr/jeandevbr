import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onProjects});

  final VoidCallback onProjects;

  @override
  Widget build(BuildContext context) => PortfolioSectionFrame(
    verticalPadding: 94,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 760;
        final introduction = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const PortfolioEyebrow(
              label: 'DESENVOLVEDOR DE SOFTWARE',
              icon: Icons.circle,
              iconColor: PortfolioColors.cyan,
            ),
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Antic Didone',
                  fontSize: narrow ? 48 : 70,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2.2,
                ),
                children: const [
                  TextSpan(
                    text: 'Olá, eu sou\n',
                    style: TextStyle(color: PortfolioColors.text),
                  ),
                  TextSpan(
                    text: 'Jean Costa',
                    style: TextStyle(color: PortfolioColors.cyan),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(color: PortfolioColors.violet),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                'Crio aplicações e interfaces digitais com atenção à experiência de quem usa e à qualidade de quem mantém.',
                style: TextStyle(
                  color: PortfolioColors.muted,
                  fontSize: 18,
                  height: 1.75,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                PortfolioPrimaryButton(
                  label: 'Conheça meus projetos',
                  icon: Icons.arrow_downward_rounded,
                  onPressed: onProjects,
                ),
                PortfolioSocialButton(
                  label: 'GitHub',
                  icon: Icons.code_rounded,
                  url: 'https://github.com/jean-devbr',
                ),
                PortfolioSocialButton(
                  label: 'LinkedIn',
                  icon: Icons.work_outline_rounded,
                  url: 'https://www.linkedin.com/in/jean-costa-0040962b8/',
                ),
              ],
            ),
            const SizedBox(height: 34),
            const Wrap(
              spacing: 22,
              runSpacing: 10,
              children: [
                PortfolioAvailabilityLabel(
                  label: 'Disponível para oportunidades',
                ),
                PortfolioPlainLabel(
                  label: 'Rio de Janeiro, Brasil',
                  icon: Icons.location_on_outlined,
                ),
              ],
            ),
          ],
        );

        final portrait = _PortraitCard(compact: narrow);
        if (narrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              introduction,
              const SizedBox(height: 52),
              Center(child: portrait),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 6, child: introduction),
            const SizedBox(width: 36),
            Expanded(flex: 4, child: Center(child: portrait)),
          ],
        );
      },
    ),
  );
}

class _PortraitCard extends StatelessWidget {
  const _PortraitCard({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: compact ? 280 : 350,
    height: compact ? 330 : 410,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          left: 18,
          top: 18,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  PortfolioColors.cyan.withValues(alpha: 0.2),
                  PortfolioColors.violet.withValues(alpha: 0.13),
                ],
              ),
              border: Border.all(
                color: PortfolioColors.cyan.withValues(alpha: 0.35),
              ),
            ),
          ),
        ),
        Positioned.fill(
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              'assets/images/foto-profissional.jpeg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) => const ColoredBox(
                color: PortfolioColors.surface,
                child: Icon(
                  Icons.person_rounded,
                  size: 120,
                  color: PortfolioColors.cyan,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: -8,
          bottom: 24,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: PortfolioColors.surfaceRaised,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: PortfolioColors.border),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.terminal_rounded, color: PortfolioColors.cyan),
                  SizedBox(width: 8),
                  Text(
                    'Construindo com propósito',
                    style: TextStyle(
                      color: PortfolioColors.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
