class PortfolioProject {
  const PortfolioProject({
    required this.slug,
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.demoUrl,
    this.imagePath,
    required this.icon,
    required this.category,
  });

  final String slug;
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? demoUrl;
  final String? imagePath;
  final String category;
  final String icon;

  static const items = <PortfolioProject>[
    PortfolioProject(
      slug: 'aodgram',
      title: 'Aodgram',
      description:
          'Plataforma de serviços para redes sociais, com área do cliente em React e CRM interno desenvolvido em Flutter para gerenciar vendas e pedidos.',
      technologies: ['Flutter', 'React'],
      demoUrl: 'https://aodgram.com.br/',
      imagePath: 'assets/content/projects/aodgram.png',
      category: '',
      icon: '01',
    ),
  ];
}
