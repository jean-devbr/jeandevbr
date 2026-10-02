# Jean Costa — Portfólio Front-End (Flutter Web)

> Portfólio orientado a **evidências**: cada projeto mostra como a interface foi pensada, construída e validada: design, componentes, estado, acessibilidade e performance. Produção: [https://jeandevbr.vercel.app](https://jeandevbr.vercel.app)

Jean constrói interfaces de qualidade → aqui estão os projetos → aqui está como foram construídos

→ aqui estão as decisões que ele tomou → aqui está a experiência → aqui está o contato.

Essa narrativa orienta todas as decisões de layout e conteúdo deste repositório.

---

> **Status da migração:** a primeira versão funcional do portfólio já está em Flutter Web. As seções de arquitetura, SEO e deploy abaixo descrevem a evolução planejada.

## Sumário

1. [Objetivo do redesign](#1-objetivo-do-redesign)
2. [Por que Flutter — e o cuidado com SEO](#2-por-que-flutter--e-o-cuidado-com-seo)
3. [Stack](#3-stack)
4. [Como rodar](#4-como-rodar)
5. [Estrutura de pastas](#5-estrutura-de-pastas)
6. [Rotas](#6-rotas)
7. [Conteúdo e modelo de conteúdo](#7-conteúdo-e-modelo-de-conteúdo)
8. [Design system](#8-design-system)
9. [Componentes](#9-componentes)
10. [Projetos privados](#10-projetos-privados)
11. [Camada de SEO estático](#11-camada-de-seo-estático)
12. [Acessibilidade](#12-acessibilidade)
13. [Performance](#13-performance)
14. [Deploy na Vercel](#14-deploy-na-vercel)
15. [Analytics](#15-analytics)
16. [Roadmap](#16-roadmap)
17. [Checklist de QA](#17-checklist-de-qa)

---

## 1. Objetivo do redesign

Sair de uma página genérica de "Desenvolvedor" para uma **coleção de estudos de caso**:

| Antes | Depois |
| :---- | :---- |
| Uma página única com tudo | Home → Projetos → Projeto individual (URL própria) |
| Nuvem de logos de tecnologias | Stack front-end agrupada por área (UI, estado, estilo, testes) |
| Projetos privados omitidos ou com botão "Demo" morto | Badge "Projeto privado" + escada de evidências |
| Conteúdo invisível para crawlers | HTML estático por rota + Flutter por cima |

**Regra de curadoria:** só entra na seção principal o projeto que demonstra qualidade real de interface — responsividade, acessibilidade, performance e componentização. Projetos menores ou experimentais continuam no GitHub.

**MVP:** Home forte · 3 cases front-end excelentes · Experiência · Sobre curto · Contato · responsivo · acessível · metadata/OG/sitemap · boa performance.

---

## 2. Por que Flutter — e o cuidado com SEO

Flutter Web desenha a interface em `<canvas>` (CanvasKit/Skwasm). Isso traz fidelidade visual e reaproveitamento de código, mas **o texto não fica no HTML** — crawlers e previews de link (LinkedIn, WhatsApp) veem uma página vazia. A auditoria do site atual encontrou exatamente esse sintoma: o `<title>` responde, mas o corpo não tem conteúdo extraível.

Por isso este projeto usa uma arquitetura em **duas camadas**, ambas alimentadas pelo **mesmo JSON de conteúdo**:

assets/content/*.json

        │

        ├──► App Flutter (experiência visual, interações, dialogs)

        │

        └──► tool/build_seo.dart  ──► build/web/projetos/<slug>/index.html

                                      (title, description, OG, canonical,

                                       JSON-LD e o texto do case em HTML semântico)

Assim cada URL entrega HTML real no primeiro byte e o Flutter carrega em seguida. Como o conteúdo vem da mesma fonte, o HTML e a UI nunca divergem (requisito do Google para structured data e conteúdo visível).

> Alternativa considerada: Next.js + TypeScript (recomendação original da auditoria). Flutter foi escolhido para demonstrar domínio da stack; a camada estática compensa a principal fraqueza dele na web.

---

## 3. Stack

| Camada | Implementação |
| :---- | :---- |
| UI | Flutter 3.x (stable), Dart 3, Material 3 com tema próprio |
| Rotas | `go_router` + `usePathUrlStrategy()` (URLs sem `#`) |
| Estado | Estado local dos widgets; navegação e URLs gerenciadas pelo `go_router` |
| Conteúdo | Dados tipados em Dart em `lib/models/project.dart` |
| Tipografia | Fonte de sistema com fallback do navegador |
| Links externos | `url_launcher` |
| Vídeo | Planejado para cases que tenham demonstração gravada |
| SEO | Metadados iniciais em `web/index.html`; geração por rota planejada |
| Build | `flutter build web --release` |
| Deploy | Vercel; automação de build e deploy ainda planejada |
| Testes | Flutter Test (cobertura automatizada ainda planejada) |

---

## 4. Como rodar

O projeto usa Dev Containers como ambiente de desenvolvimento. Instale Docker, VS Code e a extensão **Dev Containers** (`ms-vscode-remote.remote-containers`).

1. Abra a pasta do projeto no VS Code.
2. Pressione F1 e selecione **Dev Containers: Reopen in Container**.
3. Aguarde o Flutter instalar as dependências.
4. No VS Code, escolha **Flutter Web: Debug** na aba Run and Debug e pressione F5.
5. Abra `http://localhost:8080`.

A configuração inicia `lib/main.dart` no dispositivo `web-server`, escutando na porta 8080 do container.

---

## 5. Estrutura de pastas

Estrutura planejada para a aplicação Flutter:

```
.

├── assets/

│   ├── content/

│   │   ├── profile.json           # nome, headline, links, CV

│   │   ├── experience.json        # posições + projetos relacionados

│   │   └── projects/

│   │       ├── projeto-a.json

│   │       └── projeto-b.json

│   └── projects/

│       └── projeto-a/

│           ├── cover.webp

│           ├── 01-dashboard-overview.webp

│           ├── 02-create-operation.webp

│           ├── poster.webp

│           └── og.png             # 1200×630

├── lib/

│   ├── main.dart

│   ├── app/

│   │   ├── router.dart

│   │   └── theme/

│   │       ├── tokens.dart        # cores, espaçamento, raios

│   │       ├── typography.dart

│   │       └── app_theme.dart

│   ├── data/

│   │   ├── models/                # Project, Experience, Profile

│   │   └── content_repository.dart

│   ├── features/

│   │   ├── home/

│   │   ├── projects/              # lista + página do case

│   │   ├── experience/

│   │   ├── about/

│   │   └── contact/

│   └── shared/

│       ├── layout/                # AppShell, header, footer, skip link

│       └── widgets/               # ProjectCard, TechBadge, EvidenceStrip…

├── tool/

│   └── build_seo.dart             # gera HTML estático, sitemap e robots

├── web/

│   ├── index.html                 # meta padrão + <noscript> com conteúdo

│   ├── manifest.json

│   └── favicon.png

├── test/

├── integration_test/

└── vercel.json
```

---

## 6. Rotas

| Rota | Página | Title |
| :---- | :---- | :---- |
| `/` | Home | Jean Costa — Desenvolvedor Front-End | Projetos e experiência |
| `/projetos` | Lista de cases (planejada) | Projetos Front-End | Jean Costa |
| `/projetos/:slug` | Case individual | `{Projeto}` — Case Front-End | Jean Costa |
| `/experiencia` | Experiência | Experiência Profissional | Jean Costa |
| `/sobre` | Sobre | Sobre Jean Costa — Desenvolvedor Front-End |
| `/contato` | Contato | Contato | Jean Costa |

```dart
// lib/main.dart

import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';

import 'app/theme/app_theme.dart';

void main() {

  usePathUrlStrategy(); // /projetos/x em vez de /#/projetos/x

  runApp(const ProviderScope(child: PortfolioApp()));

}

class PortfolioApp extends StatelessWidget {

  const PortfolioApp({super.key});

  @override

  Widget build(BuildContext context) => MaterialApp.router(

        title: 'Jean Costa — Desenvolvedor Front-End',

        theme: AppTheme.light,

        darkTheme: AppTheme.dark,

        routerConfig: appRouter,

      );

}

// lib/app/router.dart

final appRouter = GoRouter(

  routes: [

    ShellRoute(

      builder: (context, state, child) => AppShell(child: child),

      routes: [

        GoRoute(path: '/', builder: (_, __) => const HomePage()),

        GoRoute(

          path: '/projetos',

          builder: (_, state) => ProjectsPage(

            stackFilter: state.uri.queryParameters['stack'], // filtro compartilhável

          ),

          routes: [

            GoRoute(

              path: ':slug',

              builder: (_, state) => ProjectPage(slug: state.pathParameters['slug']!),

            ),

          ],

        ),

        GoRoute(path: '/experiencia', builder: (_, __) => const ExperiencePage()),

        GoRoute(path: '/sobre', builder: (_, __) => const AboutPage()),

        GoRoute(path: '/contato', builder: (_, __) => const ContactPage()),

      ],

    ),

  ],

  errorBuilder: (_, __) => const NotFoundPage(),

);

```

Para atualizar o título da aba ao navegar, envolva cada página em `Title(title: ..., color: ..., child: ...)`. (Isso não substitui a camada estática: crawlers leem o HTML inicial.)

---

## 7. Conteúdo e modelo de conteúdo

Todo projeto segue o mesmo modelo editorial. "Não aplicável" é melhor que inventar uma evidência.

```json
// assets/content/projects/projeto-a.json

{

  "slug": "projeto-a",

  "title": "Dashboard de Operações",

  "summary": "Interface web responsiva e acessível para centralizar fluxos operacionais em um único painel.",

  "type": "profissional",

  "visibility": "private",

  "period": "2025–2026",

  "role": "Front-end developer",

  "team": "Equipe de 4",

  "featured": true,

  "stack": {

    "ui": ["Flutter", "Material 3"],

    "state": ["Riverpod"],

    "testing": ["flutter_test", "golden tests"],

    "tooling": ["GitHub Actions", "Vercel"]

  },

  "evidence": {

    "responsive": true, "accessibility": true, "tests": true, "performance": true, "deploy": true,

    "screenshots": ["01-dashboard-overview.webp", "02-create-operation.webp"],

    "video": "demo.mp4",

    "hasComponentDiagram": true,

    "lighthouse": { "performance": 95, "accessibility": 100 }

  },

  "links": { "demo": null, "repository": null },

  "confidentiality": {

    "enabled": true,

    "note": "Screenshots recriados com dados fictícios; estrutura de componentes simplificada."

  },

  "sections": {

    "context": "...",

    "myRole": "...",

    "architecture": "...",

    "interaction": "...",

    "challenge": "...",

    "decision": "...",

    "tradeoff": "...",

    "quality": "...",

    "result": "...",

    "wouldChange": "..."

  }

}
```

```dart
// lib/data/models/project.dart

enum ProjectVisibility { public, private, demoOnly }

class Project {

  final String slug, title, summary, period, role;

  final ProjectVisibility visibility;

  final bool featured;

  final ProjectStack stack;

  final ProjectEvidence evidence;

  final ProjectLinks links;

  final Confidentiality? confidentiality;

  final Map<String, String> sections;

  const Project({...});

  factory Project.fromJson(Map<String, dynamic> j) => Project(

        slug: j['slug'],

        title: j['title'],

        summary: j['summary'],

        period: j['period'],

        role: j['role'],

        visibility: switch (j['visibility']) {

          'private' => ProjectVisibility.private,

          'demo-only' => ProjectVisibility.demoOnly,

          _ => ProjectVisibility.public,

        },

        featured: j['featured'] ?? false,

        stack: ProjectStack.fromJson(j['stack']),

        evidence: ProjectEvidence.fromJson(j['evidence']),

        links: ProjectLinks.fromJson(j['links'] ?? const {}),

        confidentiality: j['confidentiality'] == null

            ? null

            : Confidentiality.fromJson(j['confidentiality']),

        sections: Map<String, String>.from(j['sections'] ?? const {}),

      );

}

```

> Dica: gere `fromJson`/`toJson` com `freezed` + `json_serializable` quando o modelo estabilizar.

### Estrutura da página do case

Breadcrumb → H1 + one-liner → badges (tipo, visibilidade, período) → meu papel → stack por camada → ações (só as que existem) → **Contexto** → **Solução** → **Minha responsabilidade** → **Arquitetura de componentes** → **Fluxo de interação** (tela → ação → feedback) → **Decisões técnicas** (2–3) → **Evidências** → **Qualidade** → **Resultado** (métricas só se defensáveis) → **O que eu faria diferente** → **Privacidade** → próximo case.

---

## 8. Design system

Direção: **85–90% editorial/profissional, 10–15% identidade "dev"** (monospace em labels, pequenos diagramas, trechos de código). Nada de imitar o VS Code inteiro.

```dart
// lib/app/theme/tokens.dart

abstract final class Space {      // escala 4/8

  static const xs = 4.0, sm = 8.0, md = 16.0, lg = 24.0, xl = 32.0, xxl = 48.0, xxxl = 64.0;

}

abstract final class Radii {

  static const sm = 6.0, md = 10.0;   // moderado; evitar "card flutuante" em tudo

}

abstract final class Breakpoints {

  static const tablet = 600.0;        // 2 colunas

  static const desktop = 1024.0;      // grid editorial

  static const maxContent = 1200.0;

  static const maxText = 720.0;       // ~60–75 caracteres por linha

}
```

| Token | Valor |
| :---- | :---- |
| Fonte principal | Inter |
| Fonte técnica | JetBrains Mono (apenas snippets e labels) |
| Corpo | 17–18 px desktop · 16–17 px mobile |
| H1 | ~38 px (mobile) → ~72 px (desktop), interpolado pela largura |
| Base | neutros + **uma** cor de destaque |
| Semânticas | sucesso / alerta / privado — sempre com texto ou ícone, nunca só cor |

Contraste validado contra WCAG 2.2 (mín. 4.5:1 para texto normal).

---

## 9. Componentes

| Widget | Responsabilidade |
| :---- | :---- |
| `AppShell` | Header, skip link, `main`, footer; menu vira drawer < 600 px |
| `HeroSection` | Cargo + proposta de valor + CTA primário e secundário |
| `ProjectCard` | Cover, nome, problema em uma frase, badges, papel, "Ver estudo de caso →" |
| `TechBadgeGroup` | Badges agrupados por UI / Estado / Testes / Ferramentas (máx. ~8 por card) |
| `EvidenceStrip` | ✓ Responsivo · ✓ Acessível · ✓ Testes · ✓ Performance · ✓ Deploy — só o que existe |
| `ComponentDiagram` | Árvore de componentes/estado com `CustomPaint`; scroll horizontal no mobile |
| `CodeSnippet` | Trecho curto de código em monospace, com botão copiar |
| `ConfidentialityBadge` | 🔒 Projeto profissional privado · Demo gravada disponível |
| `PrivateProjectDialog` | Explica a ausência de URL e lista evidências disponíveis |
| `ExperienceTimeline` | Cargo, escopo, contribuições, stack e links para cases relacionados |
| `CtaSection` | "Está avaliando meu trabalho para uma vaga ou projeto?" |

Hierarquia de CTA: **Primário** "Ver projetos front-end" · **Secundário** "Experiência profissional" · **Terciário** GitHub / LinkedIn. Nunca cinco botões com o mesmo peso.

Grid responsivo:

```dart
LayoutBuilder(builder: (context, c) {

  final cols = c.maxWidth >= Breakpoints.desktop ? 3 : c.maxWidth >= Breakpoints.tablet ? 2 : 1;

  return Wrap(

    spacing: Space.lg,

    runSpacing: Space.lg,

    children: [

      for (final p in projects)

        SizedBox(

          width: (c.maxWidth - Space.lg * (cols - 1)) / cols,

          child: ProjectCard(project: p),

        ),

    ],

  );

});
```

---

## 10. Projetos privados

A ausência de URL pública não é deficiência; a ausência de **evidência** é.

**Escada de evidências** (priorize de cima para baixo): screenshot sanitizado · vídeo local de 60–120 s · diagrama de componentes simplificado · protótipo interativo com dados fictícios · README sanitizado · snippet curto divulgável.

**Nunca:** link para sistema interno real, print cru de logs de produção.

Antes de publicar qualquer captura, substitua: nomes de clientes e usuários, e-mails, telefones, IDs reais, valores financeiros, tokens, API keys, URLs internas, IPs, nomes de bancos/buckets e dashboards de infra.

Texto padrão no case:

> **Projeto profissional sob confidencialidade.** A aplicação original não possui demonstração pública e seu código-fonte não pode ser divulgado. Os screenshots foram sanitizados ou recriados com dados fictícios, e os diagramas representam uma versão simplificada da estrutura da interface.

No card, em vez de um `[Live Demo]` desabilitado:

[🔒 Projeto privado]   [Ver estudo de caso]  [Ver evidências]

---

## 11. Camada de SEO estático

`tool/build_seo.dart` roda **depois** do `flutter build web` e, para cada rota:

1. Copia `build/web/index.html` para `build/web/<rota>/index.html`.
2. Injeta `<title>`, `<meta name="description">`, `<link rel="canonical">`, Open Graph (`og:title`, `og:description`, `og:image` 1200×630, `og:url`) e Twitter Card.
3. Injeta JSON-LD: `ProfilePage`/`Person` na Home e Sobre, `BreadcrumbList` nos cases.
4. Insere o conteúdo do case em HTML semântico (`<main><article><h1>…</h1><section>…</section></article></main>`) dentro de `<div id="static-content">`.
5. Gera `sitemap.xml` (todas as rotas públicas) e `robots.txt`.

```html
<!-- web/index.html (trecho) -->

<base href="/">

<div id="static-content">

  <!-- preenchido pelo tool/build_seo.dart -->

</div>

<script>

  // esconde o HTML estático quando o Flutter renderiza o primeiro frame

  window.addEventListener('flutter-first-frame', () => {

    document.getElementById('static-content')?.remove();

  });

</script>

<script src="flutter_bootstrap.js" async></script>
```

Use caminhos absolutos (`/flutter_bootstrap.js`, `/assets/...`) e `<base href="/">` para que as páginas em subpastas encontrem os arquivos do Flutter.

Validar após cada deploy: `curl -s https://jeandevbr.vercel.app/projetos/projeto-a | grep '<h1'` precisa retornar o título do case.

---

## 12. Acessibilidade

Flutter Web gera uma árvore de acessibilidade separada do canvas. Garanta:

- `SemanticsBinding.instance.ensureSemantics()` no `main()` (ativa a árvore para leitores de tela e testes).
- `Semantics(header: true)` nos títulos e hierarquia coerente (um H1 por página).
- Links reais com `Link` do `url_launcher` (permite abrir em nova aba, botão do meio, copiar link).
- Foco visível em cards e botões (`FocusableActionDetector` + borda/realce no estado `focused`, não só `hovered`).
- Ordem de tabulação lógica com `FocusTraversalGroup`.
- Skip link "Pular para o conteúdo" como primeiro foco.
- `PrivateProjectDialog` via `showDialog`: foco preso no dialog, fecha com `Esc`, foco devolvido ao gatilho.
- Respeitar `MediaQuery.disableAnimationsOf(context)` (equivalente a `prefers-reduced-motion`).
- Respeitar `textScaler` — layout não pode quebrar com texto a 200%.
- `semanticLabel` em screenshots informativos; `excludeFromSemantics: true` nos decorativos.
- Vídeos sem autoplay com áudio; legenda `.vtt` e transcrição.
- Nada essencial depende de hover.

---

## 13. Performance

Metas (Core Web Vitals "bons"): **LCP ≤ 2,5 s · INP < 200 ms · CLS < 0,1**.

- `flutter build web --wasm` (Skwasm, com fallback automático para CanvasKit).
- O HTML estático da camada SEO faz o papel de "primeiro conteúdo" enquanto o Flutter carrega; mantenha-o leve.
- *Deferred imports* (`import '...' deferred as case_page;`) para páginas de case, vídeo e diagramas.
- Imagens em WebP, nas dimensões de exibição; `cacheWidth` em `Image.asset` para não decodificar maior que o necessário.
- Vídeo: só o `poster.webp` no primeiro paint; `video_player` inicializado ao clicar.
- Fontes: no máximo 2 famílias e 3–4 pesos; prefira empacotar em `assets/fonts` a baixar em runtime.
- Cache longo para `assets/` e `canvaskit/` no `vercel.json`.
- Medir com Lighthouse + Vercel Speed Insights (diagnóstico, não meta única).

---

## 14. Deploy na Vercel

A Vercel não tem Flutter por padrão, então o build roda no GitHub Actions e a pasta pronta é publicada.

// vercel.json  (colocado dentro de build/web antes do deploy)

{

  "cleanUrls": true,

  "trailingSlash": false,

  "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }],

  "headers": [

    {

      "source": "/(assets|canvaskit)/(.*)",

      "headers": [{ "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }]

    }

  ]

}

A Vercel serve arquivos existentes antes de aplicar `rewrites`, então `/projetos/projeto-a/index.html` gerado pelo script é entregue diretamente; rotas desconhecidas caem no `index.html` e o `go_router` mostra a página 404.

```yaml
# .github/workflows/deploy.yml

name: Deploy

on:

  push:

    branches: [main]

jobs:

  deploy:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2

        with: { channel: stable, cache: true }

      - run: flutter pub get

      - run: flutter test

      - run: flutter build web --wasm --release

      - run: dart run tool/build_seo.dart --base-url=https://jeandevbr.vercel.app

      - run: cp vercel.json build/web/

      - run: npx vercel deploy build/web --prod --yes --token=${{ secrets.VERCEL_TOKEN }}

        env:

          VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}

          VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
```

---

## 15. Analytics

Poucos eventos que respondem perguntas reais (Plausible, Umami ou Vercel Analytics):

`project_view` · `project_case_read` · `private_demo_open` · `demo_play` · `github_click` · `cv_download` · `linkedin_click` · `email_click` · `contact_submit`

Chamada via `dart:js_interop` para a função global do provedor.

---

## 16. Roadmap

| Ordem | Entrega | Esforço | Impacto |
| :---- | :---- | :---- | :---- |
| P0 | Inventariar projetos e selecionar os melhores cases front-end | Médio | Muito alto |
| P0 | Escrever conteúdo e JSON de cada case (3 primeiro) | Alto | Muito alto |
| P0 | `usePathUrlStrategy` + `go_router` com rotas individuais | Baixo | Muito alto |
| P0 | Camada SEO estática (`tool/build_seo.dart`) | Médio | Muito alto |
| P0 | Home com nova narrativa e hero | Médio | Muito alto |
| P0 | Página de projeto individual | Alto | Muito alto |
| P1 | Tokens de tema e componentes base | Médio | Alto |
| P1 | Página de Experiência ligada aos cases | Médio | Alto |
| P1 | Responsividade (320 → 1440 px) | Médio-alto | Alto |
| P1 | Acessibilidade: semântica, teclado, foco, dialog | Médio | Alto |
| P1 | Screenshots e vídeos sanitizados | Alto | Muito alto |
| P1 | OG images, sitemap, robots | Baixo-médio | Alto |
| P1 | Otimização de imagens, fontes, wasm, deferred | Médio | Alto |
| P2 | Demos interativas com dados fictícios (`/demo/projeto-x`) | Médio-alto | Alto em privados |
| P2 | Diagramas interativos | Médio | Médio |
| P2 | Analytics | Baixo | Médio |
| P3 | Animações sofisticadas | Médio-alto | Baixo-médio |
| P3 | Tema claro/escuro | Médio | Médio |

> O maior trabalho não está no Flutter: está em produzir 3–5 cases convincentes, sanitizar material e escrever as decisões técnicas. Trabalhe conteúdo e design em paralelo.

---

## 17. Checklist de QA

**Conteúdo**

- [ ] Todo projeto principal demonstra qualidade de interface (responsividade, acessibilidade, performance)
- [ ] "Meu papel" diferenciado do trabalho da equipe
- [ ] Métricas só quando sustentáveis; badges só de tecnologias com papel real
- [ ] Cases privados com nota de confidencialidade; nenhum dado sensível em capturas

**Navegação**

- [ ] Cada projeto tem URL própria, sem `#`
- [ ] Recarregar `/projetos/<slug>` funciona (sem 404 da Vercel)
- [ ] Back/forward do navegador funcionam
- [ ] Nenhum CTA é botão morto; links abrem em nova aba com botão do meio

**Responsividade**

- [ ] Testado em 320 / 360 / 390 / 768 / 1024 / 1280 / 1440 px
- [ ] Sem overflow horizontal; cards em uma coluna no mobile
- [ ] Diagramas legíveis no mobile; menu ok em portrait e landscape

**Acessibilidade**

- [ ] Um H1 por página e headings coerentes
- [ ] Navegação completa por teclado, foco sempre visível, skip link
- [ ] Dialog gerencia foco; `Esc` fecha
- [ ] Estado não comunicado só por cor; animações reduzidas respeitadas
- [ ] Texto a 200% não quebra o uso
- [ ] Testado com leitor de tela (NVDA ou VoiceOver)

**Performance**

- [ ] LCP ≤ 2,5 s · INP < 200 ms · CLS < 0,1
- [ ] Vídeos abaixo da dobra não carregam player no primeiro paint

**SEO**

- [ ] `curl` em cada rota retorna title, description e H1 corretos
- [ ] Title e description únicos por página; canonical correto
- [ ] Open Graph validado (LinkedIn Post Inspector)
- [ ] `sitemap.xml` com todas as rotas públicas; `robots.txt` não bloqueia conteúdo
- [ ] Structured data corresponde ao conteúdo visível (Rich Results Test)
- [ ] Página 404 funciona

---

## Referências

- Google Search Central — [Core Web Vitals](https://developers.google.com/search/docs/appearance/core-web-vitals), [títulos](https://developers.google.com/search/docs/appearance/title-link), [snippets](https://developers.google.com/search/docs/appearance/snippet), [structured data](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data)
- [WCAG 2.2](https://www.w3.org/WAI/standards-guidelines/wcag/new-in-22/) · [W3C Brasil — Cartilhas](https://www.w3c.br/web-para-todos/cartilhas-de-acessibilidade-na-web/) · [eMAG](https://emag.governoeletronico.gov.br/)
- Nielsen Norman Group — [Layer-Cake Pattern](https://www.nngroup.com/articles/layer-cake-pattern-scanning/), [Principles of Visual Design](https://www.nngroup.com/articles/principles-visual-design/)
- Flutter — [Web renderers](https://docs.flutter.dev/platform-integration/web/renderers), [URL strategy](https://docs.flutter.dev/ui/navigation/url-strategies), [Accessibility](https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility)
- Portfólios de referência: [Lee Robinson](https://leerob.com/) (clareza) · [Josh W. Comeau](https://www.joshwcomeau.com/) (profundidade + personalidade) · [Brittany Chiang](https://brittanychiang.com/) (organização)

---

© Jean Costa
