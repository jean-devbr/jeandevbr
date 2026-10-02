import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import 'portfolio_ui.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) => PortfolioSectionFrame(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PortfolioColors.surfaceRaised,
            PortfolioColors.surface,
            PortfolioColors.surface.withValues(alpha: 0.7),
          ],
        ),
        border: Border.all(color: PortfolioColors.border),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final narrow = constraints.maxWidth < 700;
          final details = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PortfolioEyebrow(label: 'CONTATO'),
              const SizedBox(height: 15),
              const Text(
                'Vamos construir\nalgo juntos?',
                style: TextStyle(
                  color: PortfolioColors.text,
                  fontSize: 38,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Estou aberto a novas oportunidades, projetos e boas conversas.',
                style: TextStyle(
                  color: PortfolioColors.muted,
                  fontSize: 15,
                  height: 1.7,
                ),
              ),
            ],
          );
          final links = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContactLink(
                icon: Icons.email_outlined,
                label: 'E-mail',
                value: 'costajean1005@gmail.com',
                url: 'mailto:costajean1005@gmail.com',
              ),
              const SizedBox(height: 15),
              _ContactLink(
                icon: Icons.phone_outlined,
                label: 'WhatsApp',
                value: '+55 21 98936-5166',
                url: 'https://wa.me/5521989365166',
              ),
              const SizedBox(height: 15),
              _ContactLink(
                icon: Icons.location_on_outlined,
                label: 'Localização',
                value: 'Rio de Janeiro, Brasil',
              ),
              const SizedBox(height: 15),
              _ContactLink(
                icon: Icons.link_rounded,
                label: 'LinkedIn',
                value: 'linkedin.com/in/jean-costa',
                url: 'https://www.linkedin.com/in/jean-costa-0040962b8/',
              ),
            ],
          );
          if (narrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [details, const SizedBox(height: 32), links],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: details),
              const SizedBox(width: 45),
              Expanded(child: links),
            ],
          );
        },
      ),
    ),
  );
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({
    required this.icon,
    required this.label,
    required this.value,
    this.url,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? url;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: url == null ? null : () => openPortfolioUrl(url!),
    borderRadius: BorderRadius.circular(12),
    child: Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: PortfolioColors.cyan.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: PortfolioColors.cyan),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: PortfolioColors.muted,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: PortfolioColors.text,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (url != null)
          const Icon(
            Icons.open_in_new_rounded,
            size: 15,
            color: PortfolioColors.muted,
          ),
      ],
    ),
  );
}
