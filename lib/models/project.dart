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
    this.longDescription,
    this.technicalDescription,
    this.stackGroups = const [],
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
  final String? longDescription;
  final String? technicalDescription;
  final List<ProjectStackGroup> stackGroups;

  static const items = <PortfolioProject>[
    PortfolioProject(
      slug: 'aodgram',
      title: 'Aodgram',
      description:
          'Plataforma de serviços para redes sociais, com área do cliente em React, CRM administrativo em Flutter e API em Java com Spring Boot.',
      technologies: [
        'React',
        'TypeScript',
        'Tailwind CSS',
        'Flutter',
        'Dart',
        'Java',
        'Spring Boot',
      ],
      stackGroups: [
        ProjectStackGroup(
          title: 'Área do cliente',
          technologies: ['React', 'TypeScript', 'Tailwind CSS'],
        ),
        ProjectStackGroup(
          title: 'CRM administrativo',
          technologies: ['Flutter', 'Dart'],
        ),
        ProjectStackGroup(
          title: 'Back-end',
          technologies: ['Java', 'Spring Boot'],
        ),
      ],
      longDescription:
          'O Aodgram é uma plataforma onde clientes contratam serviços para suas redes sociais. O projeto tem duas partes. A primeira é o site do cliente, onde ele escolhe o serviço, faz o pedido e acompanha o andamento. A segunda é um sistema interno, usado pela equipe para organizar vendas, acompanhar pedidos e atender os clientes. Desenvolvi a solução completa: o site, o sistema de gestão e o \'motor\' por trás que conecta tudo e guarda as informações com segurança.',
      technicalDescription:
          'Plataforma full stack composta por três camadas. A área do cliente é uma SPA em React com TypeScript e Tailwind CSS, focada em uma interface responsiva e componentizada. O CRM administrativo foi desenvolvido em Flutter/Dart e centraliza a gestão de vendas, pedidos e clientes. O back-end é uma API REST em Java com Spring Boot, responsável pelas regras de negócio, autenticação e persistência de dados, servindo tanto a área do cliente quanto o painel administrativo.',
      demoUrl: 'https://aodgram.com.br/',
      imagePath: 'assets/content/projects/aodgram.png',
      category: '',
      icon: '01',
    ),
  ];
}

class ProjectStackGroup {
  const ProjectStackGroup({required this.title, required this.technologies});

  final String title;
  final List<String> technologies;
}
