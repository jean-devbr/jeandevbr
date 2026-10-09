import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme.dart';

const portfolioContentWidth = 1120.0;

class PortfolioSectionFrame extends StatelessWidget {
  const PortfolioSectionFrame({
    super.key,
    required this.child,
    this.background,
    this.verticalPadding = 78,
  });

  final Widget child;
  final Color? background;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: background ?? Colors.transparent,
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: portfolioContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: verticalPadding,
          ),
          child: child,
        ),
      ),
    ),
  );
}

class PortfolioSectionTitle extends StatelessWidget {
  const PortfolioSectionTitle({
    super.key,
    required this.first,
    required this.accent,
    this.centered = true,
  });

  final String first;
  final String accent;
  final bool centered;

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: first,
          style: const TextStyle(color: PortfolioColors.text),
        ),
        TextSpan(
          text: accent,
          style: const TextStyle(color: PortfolioColors.cyan),
        ),
      ],
    ),
    textAlign: centered ? TextAlign.center : TextAlign.start,
    style: const TextStyle(
      fontFamily: 'Antic Didone',
      fontWeight: FontWeight.w800,
      fontSize: 34,
      letterSpacing: -1,
      height: 1.2,
    ),
  );
}

class PortfolioEyebrow extends StatelessWidget {
  const PortfolioEyebrow({
    super.key,
    required this.label,
    this.icon,
    this.iconColor = PortfolioColors.cyan,
  });

  final String label;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (icon != null) ...[
        Icon(icon, size: 9, color: iconColor),
        const SizedBox(width: 9),
      ],
      Text(
        label,
        style: const TextStyle(
          color: PortfolioColors.cyan,
          fontSize: 11,
          letterSpacing: 2.1,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

class PortfolioPlainLabel extends StatelessWidget {
  const PortfolioPlainLabel({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 15, color: PortfolioColors.muted),
      const SizedBox(width: 7),
      Text(
        label,
        style: const TextStyle(color: PortfolioColors.muted, fontSize: 12),
      ),
    ],
  );
}

class PortfolioAvailabilityLabel extends StatelessWidget {
  const PortfolioAvailabilityLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Color(0xFF5CE1A5),
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(width: 8),
      Text(
        label,
        style: const TextStyle(color: PortfolioColors.text, fontSize: 12),
      ),
    ],
  );
}

class PortfolioTechPill extends StatelessWidget {
  const PortfolioTechPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: PortfolioColors.cyan.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: PortfolioColors.cyan.withValues(alpha: 0.14)),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: PortfolioColors.cyan,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class PortfolioPrimaryButton extends StatelessWidget {
  const PortfolioPrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FilledButton.icon(
    onPressed: onPressed,
    icon: Icon(icon, size: 17),
    label: Text(label),
    style: FilledButton.styleFrom(
      backgroundColor: PortfolioColors.cyan,
      foregroundColor: PortfolioColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}

class PortfolioOutlineButton extends StatelessWidget {
  const PortfolioOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      foregroundColor: PortfolioColors.cyan,
      side: const BorderSide(color: PortfolioColors.cyan),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    child: Text(label),
  );
}

class PortfolioSocialButton extends StatelessWidget {
  const PortfolioSocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: () => openPortfolioUrl(url),
    icon: Icon(icon, size: 17),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: PortfolioColors.text,
      side: const BorderSide(color: PortfolioColors.border),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    ),
  );
}

class PortfolioSocialIcon extends StatelessWidget {
  const PortfolioSocialIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
  });

  final IconData icon;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: label,
    onPressed: () => openPortfolioUrl(url),
    icon: Icon(icon, color: PortfolioColors.muted, size: 19),
  );
}

class PortfolioWhatsAppButton extends StatelessWidget {
  const PortfolioWhatsAppButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: onPressed,
    tooltip: 'Conversar pelo WhatsApp',
    backgroundColor: const Color(0xFF25D366),
    foregroundColor: Colors.white,
    shape: const CircleBorder(),
    elevation: 6,
    child: Image.asset(
      'assets/images/whatsapp.webp',
      width: 52,
      height: 52,
      color: Colors.white,
      colorBlendMode: BlendMode.srcIn,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.chat_rounded),
    ),
  );
}

Future<void> openPortfolioUrl(String value) async {
  final uri = Uri.tryParse(value);
  if (uri == null) return;
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
