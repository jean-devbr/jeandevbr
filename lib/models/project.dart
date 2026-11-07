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
    PortfolioProject(
      slug: 'redragon-battery-monitor',
      title: 'Redragon Battery Monitor',
      description:
          'App para Linux que mostra o nível real da bateria do mouse Redragon M719RGB-PRO no Ubuntu, com ícone na barra superior e aviso de bateria baixa.',
      technologies: [
        'Python',
        'PySide6 (Qt)',
        'Linux',
        'Ubuntu',
        'HID/hidraw',
        'USB',
        'Engenharia reversa',
        'Shell Script',
        'pytest',
      ],
      stackGroups: [
        ProjectStackGroup(
          title: 'Aplicativo desktop',
          technologies: ['Python', 'PySide6 (Qt)'],
        ),
        ProjectStackGroup(
          title: 'Hardware e sistema',
          technologies: [
            'Linux',
            'Ubuntu',
            'HID/hidraw',
            'USB',
            'Engenharia reversa',
          ],
        ),
        ProjectStackGroup(
          title: 'Instalação e testes',
          technologies: ['Shell Script', 'pytest'],
        ),
      ],
      longDescription:
          'O Ubuntu não mostra a bateria do mouse Redragon M719RGB-PRO porque ele não usa o padrão HID de bateria e não tem driver no kernel. Investiguei os descritores HID e descobri que o firmware responde a um comando proprietário do protocolo Compx (relatório 0x08). Com isso, ele informa a porcentagem, se está carregando e a tensão. Com base nisso, criei um app desktop em Python + PySide6 que lê esses dados pelo hidraw, tanto pelo receptor 2.4 GHz quanto pelo cabo USB-C.',
      technicalDescription:
          'O app mostra a porcentagem real informada pelo próprio mouse, com ícone na barra superior que indica quando está carregando e aviso de bateria baixa. Funciona pelo receptor 2.4 GHz e pelo cabo USB-C, tem opção de iniciar com o sistema, interface em português e inglês, aviso de nova versão com atualização pelo próprio app e também um modo de terminal (CLI). A instalação é feita com um único comando:\n\ncurl -fsSL https://raw.githubusercontent.com/jean-devbr/redragon-battery-monitor/main/get.sh | bash\n\nCódigo aberto sob a licença MIT.',
      githubUrl: 'https://github.com/jean-devbr/redragon-battery-monitor',
      imagePath: 'assets/content/projects/redragon-battery-monitor.png',
      category: '',
      icon: '02',
    ),
  ];
}

class ProjectStackGroup {
  const ProjectStackGroup({required this.title, required this.technologies});

  final String title;
  final List<String> technologies;
}
