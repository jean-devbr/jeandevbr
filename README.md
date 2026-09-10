# 🚀 Jean Costa - Full-Stack Developer Portfolio

A modern, responsive portfolio website showcasing my skills and projects as a full-stack developer.

## ✨ Features

- **Responsive Design**: Optimized for all devices (mobile, tablet, desktop)
- **Modern UI**: Built with React, TypeScript, and Tailwind CSS
- **Interactive Animations**: Smooth animations powered by Framer Motion
- **Project Showcase**: Filterable project gallery with categories
- **Contact Integration**: WhatsApp integration and contact form
- **SEO Optimized**: Meta tags and structured data for better search visibility
- **Performance Focused**: Fast loading with Vite build tool

## 🛠️ Tech Stack

### Frontend
- **React 18** - Modern React with hooks
- **TypeScript** - Type-safe development
- **Vite** - Fast build tool and dev server
- **Tailwind CSS** - Utility-first CSS framework
- **Framer Motion** - Animation library
- **Shadcn/UI** - Modern component library
- **Lucide React** - Beautiful icons

### Development Tools
- **ESLint** - Code linting
- **PostCSS** - CSS processing
- **Autoprefixer** - CSS vendor prefixing

## 📁 Project Structure

```
portfolio/
├── public/
│   ├── imagem/
│   │   ├── jean.png
│   │   └── whatsapp-logo-whatsapp-icon-whatsapp-transparent-free-png.webp
│   ├── favicon.ico
│   ├── robots.txt
│   └── CurriculoJean.docx
├── src/
│   ├── components/
│   │   ├── About.tsx
│   │   ├── Contact.tsx
│   │   ├── Footer.tsx
│   │   ├── Hero.tsx
│   │   ├── NavLink.tsx
│   │   ├── Projects.tsx
│   │   ├── Technologies.tsx
│   │   ├── WhatsAppButton.tsx
│   │   └── ui/
│   ├── hooks/
│   │   ├── use-mobile.tsx
│   │   └── use-toast.ts
│   ├── lib/
│   │   └── utils.ts
│   ├── pages/
│   │   ├── Index.tsx
│   │   └── NotFound.tsx
│   ├── App.css
│   ├── App.tsx
│   ├── index.css
│   └── main.tsx
├── package.json
├── vite.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Node.js (version 18 or higher)
- npm or yarn

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jean-devbr/portfolio.git
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the development server**
   ```bash
   npm run dev
   ```

4. **Open your browser**
   Navigate to `http://localhost:8080` (or the port shown in terminal)

### Build for Production

```bash
npm run build
```

The built files will be in the `dist/` directory.

### Local Development with Docker

Requires Docker and Docker Compose. From the project root:

```bash
docker compose up -d --build
```

Open `http://localhost:8080`. The container runs the Vite development server.
The source code is mounted into the container, so edits update the site
automatically. Container dependencies are isolated from local `node_modules`.
Production deployment remains handled by Vercel.

After changing `package.json` or `package-lock.json`, rebuild the image and
renew the anonymous dependency volume:

```bash
docker compose up -d --build --renew-anon-volumes
```

To use another host port:

```bash
PORT=3000 docker compose up -d --build
```

View logs or stop the container:

```bash
docker compose logs -f web
docker compose down
```

## 📱 Sections

### 🏠 Hero
- Animated introduction with computer emoji
- Download resume button
- Social media links

### 👨‍💻 About
- Personal information and experience
- Key statistics (years of experience, projects completed)
- Professional summary

### 💼 Projects
- Filterable project gallery
- Categories: All, HTML + CSS Puro, Java, Python
- Project cards with descriptions and links

### 🛠️ Technologies
- Skills and technologies overview
- Programming languages and frameworks

### 📞 Contact
- Contact information cards
- WhatsApp integration

### 📱 WhatsApp Button
- Floating WhatsApp button for easy contact
- Custom styling and positioning

## 🎨 Customization

### Colors and Styling
The project uses Tailwind CSS with custom CSS variables defined in `tailwind.config.ts`. You can modify the color scheme by updating the CSS custom properties in `src/index.css`.

### Content
Update personal information, projects, and contact details in the respective component files:
- `src/components/Hero.tsx` - Name, title, social links
- `src/components/About.tsx` - Personal info and stats
- `src/components/Projects.tsx` - Project data
- `src/components/Technologies.tsx` - Skills list

### Images
Replace images in `public/imagem/`:
- `jean.png` - Profile picture
- `whatsapp-logo-...webp` - WhatsApp icon

## 📈 Performance

- **Lighthouse Score**: Optimized for performance, accessibility, and SEO
- **Bundle Size**: Tree-shaken and optimized with Vite
- **Loading Speed**: Fast initial load with code splitting

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

**Jean Costa**
- LinkedIn: [jean-costa-0040962b8](https://www.linkedin.com/in/jean-costa-0040962b8/)
- GitHub: [@jean-devbr](https://github.com/jean-devbr)
- Instagram: [@jeanooficial12](https://www.instagram.com/jeanooficial12/)
- YouTube: [@aprendendoComJean](https://www.youtube.com/@aprendendoComJean)
- WhatsApp: Available via the floating button

---

⭐ **Star this repo** if you found it helpful!
