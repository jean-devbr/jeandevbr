class PortfolioProject {
  const PortfolioProject({
    required this.slug,
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    this.demoUrl,
    required this.icon,
    required this.category,
  });

  final String slug;
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final String? demoUrl;
  final String category;
  final String icon;

  static const items = <PortfolioProject>[
    PortfolioProject(
      slug: 'sistema-de-login',
      title: 'Sistema de Login',
      description:
          'Interface de autenticação feita com HTML e CSS, com foco em uma experiência simples e direta.',
      technologies: ['HTML', 'CSS'],
      githubUrl: 'https://github.com/jean-devbr/login',
      demoUrl: 'https://jean-devbr.github.io/login/',
      category: 'Web',
      icon: '01',
    ),
    PortfolioProject(
      slug: 'clone-spotify',
      title: 'Clone do Spotify',
      description:
          'Recriação da interface do Spotify para praticar composição visual e layout responsivo.',
      technologies: ['HTML', 'CSS'],
      githubUrl: 'https://github.com/jean-devbr/Copia_Spotify',
      demoUrl: 'https://jean-devbr.github.io/Copia_Spotify/',
      category: 'Web',
      icon: '02',
    ),
    PortfolioProject(
      slug: 'loja-jordan',
      title: 'Loja Jordan',
      description:
          'Página de loja online de tênis Jordan, com vitrine de produtos e identidade visual própria.',
      technologies: ['HTML', 'CSS'],
      githubUrl: 'https://github.com/jean-devbr/Loja-Jordan',
      demoUrl: 'https://jean-devbr.github.io/Loja-Jordan/',
      category: 'Web',
      icon: '03',
    ),
    PortfolioProject(
      slug: 'blog',
      title: 'Blog',
      description:
          'Blog construído para praticar estruturação de conteúdo e interações com JavaScript.',
      technologies: ['HTML', 'CSS', 'JavaScript'],
      githubUrl: 'https://github.com/jean-devbr/blog',
      demoUrl: 'https://jean-devbr.github.io/blog/',
      category: 'Web',
      icon: '04',
    ),
    PortfolioProject(
      slug: 'login-flutter',
      title: 'App de Login Flutter',
      description:
          'Aplicativo Flutter com cadastro e autenticação integrados a uma API backend.',
      technologies: ['Flutter', 'Dart', 'API REST'],
      githubUrl: 'https://github.com/jean-devbr/Login_flutter',
      demoUrl: 'https://login-flutter-ebon.vercel.app/',
      category: 'Flutter',
      icon: '05',
    ),
    PortfolioProject(
      slug: 'usuarios-api',
      title: 'API de Usuários',
      description:
          'API REST para cadastro e gerenciamento de usuários, desenvolvida com Spring Boot.',
      technologies: ['Java', 'Spring Boot', 'PostgreSQL'],
      githubUrl: 'https://github.com/jean-devbr/usuarios-api',
      category: 'Backend',
      icon: '06',
    ),
    PortfolioProject(
      slug: 'crud-clientes-produtos',
      title: 'CRUD de Clientes e Produtos',
      description:
          'Aplicativo Expo para gerenciar clientes e produtos com persistência local em SQLite.',
      technologies: ['React Native', 'Expo', 'TypeScript', 'SQLite'],
      githubUrl: 'https://github.com/jean-devbr/rn-client-product-crud',
      category: 'Mobile',
      icon: '07',
    ),
    PortfolioProject(
      slug: 'desafio-java',
      title: 'Desafio Java',
      description:
          'Projeto de estudo desenvolvido para praticar fundamentos da linguagem Java.',
      technologies: ['Java'],
      githubUrl: 'https://github.com/jean-devbr/DesafioJava',
      category: 'Backend',
      icon: '08',
    ),
    PortfolioProject(
      slug: 'desafio-python',
      title: 'Desafio Python',
      description:
          'Projeto de estudo desenvolvido com Python para exercitar lógica e resolução de problemas.',
      technologies: ['Python'],
      githubUrl: 'https://github.com/jean-devbr/desafio_python',
      category: 'Backend',
      icon: '09',
    ),
  ];
}
