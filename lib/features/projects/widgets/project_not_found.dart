import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme.dart';

class ProjectNotFound extends StatelessWidget {
  const ProjectNotFound({super.key});

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
