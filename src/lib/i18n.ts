import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

// the translations
// (tip: move them in a JSON file and import them,
// or even better, manage them separated from your code: https://react.i18next.com/guides/multiple-translation-files)
const resources = {
  en: {
    translation: {
      "pageTitle": "Jean Costa - Full-Stack Developer",
      // Hero
      "fullStackDeveloper": "Full-Stack Developer",
      "downloadResume": "Download Resume",
      "contactMe": "Contact Me",
      "heroDescription": "Full-Stack developer focused on modern web applications, robust APIs, and best practices.",

      // About
      "getToKnow": "Get to know",
      "aboutMe": "About Me",
      "aboutDescription": "Hello! My name is Jean, I'm 22 years old and I'm from Rio de Janeiro. I'm a curious person, constantly learning, and I like to challenge myself to grow personally and professionally. I'm always looking for new opportunities and experiences that help me evolve and contribute to projects in a meaningful way.",
      "yearsOfExperience": "Years of Experience",
      "completedProjects": "Completed Projects",

      // Technologies
      "techStack": "Tech Stack",
      "technologiesTools": "Technologies & Tools",
      "techDescription": "Strong experience with core technologies used in the industry",
      "techJavaSpring": "Java & Spring Boot",
      "techJavaSpringDesc": "Robust and scalable backend",
      "techPostgresMysql": "PostgreSQL & MySQL",
      "techPostgresMysqlDesc": "Data modeling and optimization",
      "techDockerK8s": "Docker & Kubernetes",
      "techDockerK8sDesc": "Containerization and orchestration",
      "techAwsAzure": "AWS & Azure",
      "techAwsAzureDesc": "Cloud computing and DevOps",
      "techGitCicd": "Git & CI/CD",
      "techGitCicdDesc": "Version control and automation",
      "techPython": "Python",
      "techPythonDesc": "Scripting and data analysis",
      "techFlutterDart": "Flutter & Dart",
      "techFlutterDartDesc": "Cross-platform mobile and web development",
      "techLinux": "Linux",
      "techLinuxDesc": "System administration and development",

      // Projects
      "projects": "Projects",
      "featuredProjectsTitle": "Featured Projects",
      "featuredProjectsDescription": "Some of the projects I have worked on throughout my career",
      "apiIntegration": "API Integration",
      "all": "All",
      "pureHtmlCss": "Pure HTML + CSS",
      "viewDemo": "View Demo",
      "viewCode": "View Code",

      // Project titles and descriptions
      "loginSystem": "Login System",
      "loginSystemDesc": "Login system developed using pure HTML and CSS, without the need for an API.",
      "spotifyClone": "Spotify Clone",
      "spotifyCloneDesc": "Spotify app clone developed using pure HTML and CSS.",
      "javaChallenge": "Java Challenge",
      "javaChallengeDesc": "Challenge project developed in Java.",
      "pythonChallenge": "Python Challenge",
      "pythonChallengeDesc": "Challenge project developed in Python.",
      "jordanStore": "Jordan Store",
      "jordanStoreDesc": "Online Jordan sneakers store developed with HTML and CSS.",
      "blog": "Blog",
      "blogDesc": "Professional blog developed with HTML, CSS and JavaScript.",
      "flutterLoginApp": "Flutter Login App",
      "flutterLoginAppDesc": "Flutter app with user login and registration, integrated with a backend API for authentication.",
      "usuariosApi": "Users API",
      "usuariosApiDesc": "REST API for user registration and management built with Spring Boot.",
      "rnClientProductCrud": "RN Client & Product CRUD",
      "rnClientProductCrudDesc": "React Native (Expo) app for managing clients and their products with local SQLite persistence.",

      // Contact
      "letsTalk": "Let's Talk",
      "contactMeTitle": "Contact Me",
      "contactDescription": "I'm always open to new projects and opportunities",
      "contactInformation": "Contact Information",
      "email": "Email",
      "whatsapp": "WhatsApp",
      "location": "Location",
      "locationValue": "Brazil - Rio de Janeiro",

      // Footer
      "footerDescription": "Full-Stack Developer specialized in building robust and scalable solutions.",
      "quickLinks": "Quick Links",
      "about": "About",
      "technologies": "Technologies",
      "contact": "Contact",
      "socials": "Socials",

      // WhatsApp
      "talkOnWhatsapp": "Talk to me on WhatsApp",

      // Not Found
      "pageNotFound": "Oops! Page not found",
      "returnHome": "Return to Home",
      "madeWith": "Made with ❤️"
    }
  },
  pt: {
    translation: {
      "pageTitle": "Jean Costa - Desenvolvedor Full Stack",
      // Hero
      "fullStackDeveloper": "Desenvolvedor Full-Stack",
      "downloadResume": "Baixar Currículo",
      "contactMe": "Entre em Contato",
      "heroDescription": "Desenvolvedor Full-Stack focado em aplicações web modernas, APIs robustas e melhores práticas.",

      // About
      "getToKnow": "Conheça",
      "aboutMe": "Sobre Mim",
      "aboutDescription": "Olá! Meu nome é Jean, tenho 22 anos e sou do Rio de Janeiro. Sou uma pessoa curiosa, sempre aprendendo, e gosto de me desafiar para crescer pessoalmente e profissionalmente. Estou sempre em busca de novas oportunidades e experiências que me ajudem a evoluir e contribuir de forma significativa para projetos.",
      "yearsOfExperience": "Anos de Experiência",
      "completedProjects": "Projetos Concluídos",

      // Technologies
      "techStack": "Stack Tecnológica",
      "technologiesTools": "Tecnologias & Ferramentas",
      "techDescription": "Experiência sólida com tecnologias principais usadas na indústria",
      "techJavaSpring": "Java & Spring Boot",
      "techJavaSpringDesc": "Backend robusto e escalável",
      "techPostgresMysql": "PostgreSQL & MySQL",
      "techPostgresMysqlDesc": "Modelagem e otimização de dados",
      "techDockerK8s": "Docker & Kubernetes",
      "techDockerK8sDesc": "Containerização e orquestração",
      "techAwsAzure": "AWS & Azure",
      "techAwsAzureDesc": "Computação em nuvem e DevOps",
      "techGitCicd": "Git & CI/CD",
      "techGitCicdDesc": "Controle de versão e automação",
      "techPython": "Python",
      "techPythonDesc": "Script e análise de dados",
      "techFlutterDart": "Flutter & Dart",
      "techFlutterDartDesc": "Desenvolvimento mobile e web multiplataforma",
      "techLinux": "Linux",
      "techLinuxDesc": "Administração de sistemas e desenvolvimento",

      // Projects
      "projects": "Projetos",
      "featuredProjectsTitle": "Projetos em Destaque",
      "featuredProjectsDescription": "Alguns dos projetos em que trabalhei ao longo da minha carreira",
      "apiIntegration": "Integração com API",
      "all": "Todos",
      "pureHtmlCss": "HTML + CSS Puro",
      "viewDemo": "Ver Demo",
      "viewCode": "Ver Código",

      // Project titles and descriptions
      "loginSystem": "Sistema de Login",
      "loginSystemDesc": "Sistema de login desenvolvido usando HTML e CSS puro, sem necessidade de API.",
      "spotifyClone": "Clone do Spotify",
      "spotifyCloneDesc": "Clone do aplicativo Spotify desenvolvido usando HTML e CSS puro.",
      "javaChallenge": "Desafio Java",
      "javaChallengeDesc": "Projeto de desafio desenvolvido em Java.",
      "pythonChallenge": "Desafio Python",
      "pythonChallengeDesc": "Projeto de desafio desenvolvido em Python.",
      "jordanStore": "Loja Jordan",
      "jordanStoreDesc": "Loja online de tênis Jordan desenvolvida com HTML e CSS.",
      "blog": "Blog",
      "blogDesc": "Blog profissional desenvolvido com HTML, CSS e JavaScript.",
      "flutterLoginApp": "App de Login Flutter",
      "flutterLoginAppDesc": "App Flutter com login e registro de usuário, integrado a uma API backend para autenticação.",
      "usuariosApi": "Usuários API",
      "usuariosApiDesc": "API REST para cadastro e gerenciamento de usuários, desenvolvida com Spring Boot.",
      "rnClientProductCrud": "CRUD de Clientes e Produtos (RN)",
      "rnClientProductCrudDesc": "App React Native (Expo) para cadastro de clientes e produtos com persistência local em SQLite.",

      // Contact
      "letsTalk": "Vamos Conversar",
      "contactMeTitle": "Entre em Contato",
      "contactDescription": "Estou sempre aberto a novos projetos e oportunidades",
      "contactInformation": "Informações de Contato",
      "email": "Email",
      "whatsapp": "WhatsApp",
      "location": "Localização",
      "locationValue": "Brasil - Rio de Janeiro",

      // Footer
      "footerDescription": "Desenvolvedor Full-Stack especializado em construir soluções robustas e escaláveis.",
      "quickLinks": "Links Rápidos",
      "about": "Sobre",
      "technologies": "Tecnologias",
      "contact": "Contato",
      "socials": "Redes Sociais",

      // WhatsApp
      "talkOnWhatsapp": "Fale comigo no WhatsApp",

      // Not Found
      "pageNotFound": "Ops! Página não encontrada",
      "returnHome": "Voltar ao Início",
      "madeWith": "Feito com ❤️"
    }
  }
};

i18n
  // pass the i18n instance to react-i18next.
  .use(initReactI18next)
  // init i18next
  // for all options read: https://www.i18next.com/overview/configuration-options
  .init({
    resources,
    lng: 'pt',
    // you can use the i18n.changeLanguage function to change the language manually: https://www.i18next.com/overview/api#changelanguage
    // if you're using a language detector, do not define the lng option

    interpolation: {
      escapeValue: false // react already does escaping
    }
  });

export default i18n;
