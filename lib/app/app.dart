import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../features/portfolio/portfolio_page.dart';
import '../features/projects/project_page.dart';
import 'theme.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const PortfolioPage()),
    GoRoute(
      path: '/projetos/:slug',
      builder: (context, state) =>
          ProjectPage(slug: state.pathParameters['slug']!),
    ),
  ],
  errorBuilder: (context, state) => const PortfolioNotFoundPage(),
);

void configureUrlStrategy() => usePathUrlStrategy();

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Jean Costa | Desenvolvedor de Software',
    debugShowCheckedModeBanner: false,
    theme: portfolioTheme,
    routerConfig: _router,
  );
}

class PortfolioNotFoundPage extends StatelessWidget {
  const PortfolioNotFoundPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Página não encontrada'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.go('/'),
            child: const Text('Voltar ao início'),
          ),
        ],
      ),
    ),
  );
}
