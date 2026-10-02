import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/theme.dart';
import '../../models/project.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({required this.slug, super.key});

  final String slug;

  @override
  Widget build(BuildContext context) {
    PortfolioProject? project;
    for (final item in PortfolioProject.items) {
      if (item.slug == slug) {
        project = item;
        break;
      }
    }
    if (project == null) return const _ProjectNotFound();

    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _ProjectHeader(onBack: () => context.go('/')),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 960),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 64, 24, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.category.toUpperCase(),
                          style: const TextStyle(
                            color: PortfolioColors.cyan,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          project.title,
                          style: const TextStyle(
                            color: PortfolioColors.text,
                            fontSize: 46,
                            height: 1.15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 720),
                          child: Text(
                            project.description,
                            style: const TextStyle(
                              color: PortfolioColors.muted,
                              fontSize: 18,
                              height: 1.75,
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (final tech in project.technologies)
                              _TechnologyBadge(label: tech),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            if (project.demoUrl case final demo?)
                              _ProjectAction(
                                label: 'Abrir demonstração',
                                icon: Icons.open_in_new_rounded,
                                primary: true,
                                onPressed: () => _openUrl(demo),
                              ),
                            _ProjectAction(
                              label: 'Ver código no GitHub',
                              icon: Icons.code_rounded,
                              onPressed: () => _openUrl(project!.githubUrl),
                            ),
                          ],
                        ),
                        const SizedBox(height: 54),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: PortfolioColors.border),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF14283A),
                                Color(0xFF131725),
                                PortfolioColors.surface,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.layers_outlined,
                                size: 34,
                                color: PortfolioColors.cyan,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                project.title,
                                style: const TextStyle(
                                  color: PortfolioColors.text,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Este projeto explora ${project.technologies.join(', ')} em uma interface pensada para ser clara e fácil de usar.',
                                style: const TextStyle(
                                  color: PortfolioColors.muted,
                                  height: 1.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 38),
                        OutlinedButton.icon(
                          onPressed: () => context.go('/'),
                          icon: const Icon(Icons.arrow_back_rounded),
                          label: const Text('Voltar ao portfólio'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  const _ProjectHeader({required this.onBack});

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

class _TechnologyBadge extends StatelessWidget {
  const _TechnologyBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: PortfolioColors.surfaceRaised,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(color: PortfolioColors.border),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: PortfolioColors.cyan,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
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

class _ProjectNotFound extends StatelessWidget {
  const _ProjectNotFound();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Projeto não encontrado',
            style: TextStyle(
              color: PortfolioColors.text,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.go('/'),
            child: const Text('Voltar ao portfólio'),
          ),
        ],
      ),
    ),
  );
}

Future<void> _openUrl(String value) async {
  final uri = Uri.tryParse(value);
  if (uri == null) return;
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
