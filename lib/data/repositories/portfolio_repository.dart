import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/education.dart';

class PortfolioRepository {
  // Portfolio Stats
  static const int projectsCompleted = 10;
  static const int skillsLearned = 15;

  // Certifications with logos
  static List<Map<String, String>> getCertifications() {
    return [
      {
        'name': 'Amazon AWS',
        'icon': 'FontAwesomeIcons.aws',
      },
      {
        'name': 'Oracle',
        'icon': 'FontAwesomeIcons.oracle',
      },
      {
        'name': 'Mindluster',
        'icon': 'Icons.school',
      },
      {
        'name': 'Hackerrank',
        'icon': 'FontAwesomeIcons.hackerrank',
      },
      {
        'name': 'JP Morgan',
        'icon': 'FontAwesomeIcons.building',
      },
    ];
  }

  // Sample Projects Data
  static List<Project> getProjects() {
    return [
      Project(
        title: 'Flutter E-Commerce App',
        description:
            'A complete e-commerce mobile application with user authentication, product catalog, cart, and payment integration.',
        longDescription:
            'Developed a full-stack e-commerce mobile application featuring secure user authentication, dynamic product catalog, shopping cart management, and integrated payment processing with Stripe. Implemented state management using Provider pattern and designed a scalable architecture following SOLID principles. The app includes real-time inventory updates, order tracking, and admin dashboard capabilities.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'Provider',
          'Stripe',
          'REST API'
        ],
        features: [
          'Secure user authentication with Firebase Auth',
          'Real-time product catalog with search and filters',
          'Shopping cart with persistent state',
          'Stripe payment integration',
          'Order history and tracking',
          'Admin dashboard for inventory management',
          'Push notifications for order updates',
        ],
        category: 'Mobile App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/ecommerce.png',
        screenshots: [],
        youtubeVideoId:
            'dQw4w9WgXcQ', // Placeholder - replace with your video ID
        downloadUrl:
            'https://drive.google.com/file/d/YOUR_FILE_ID/view', // Replace with actual link
      ),
      Project(
        title: 'Book Reading App',
        description:
            'A mobile application for book lovers with reading features, bookmarks, and listening features.',
        longDescription:
            'Engineered a comprehensive digital reading platform with advanced PDF rendering, bookmark management, and text-to-speech capabilities. Implemented local storage for offline reading and designed an intuitive UI/UX for seamless reading experience. The application uses efficient caching mechanisms to optimize performance and reduce memory footprint.',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'PDF Viewer',
          'Local Storage',
          'SQLite'
        ],
        features: [
          'Advanced PDF viewer with zoom and night mode',
          'Bookmark and annotation system',
          'Text-to-speech for audio reading',
          'Offline reading with local storage',
          'Reading progress synchronization',
          'Customizable reading themes',
          'Search within books',
        ],
        category: 'Mobile App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/book.png',
        screenshots: [],
        youtubeVideoId: null, // No video for this project
        downloadUrl: 'https://drive.google.com/file/d/YOUR_FILE_ID/view',
      ),
      Project(
        title: 'Portfolio Website',
        description:
            'A responsive portfolio website built with Flutter Web showcasing projects and skills.',
        longDescription:
            'Created a modern, responsive portfolio website using Flutter Web to demonstrate software engineering skills and projects. Implemented pixel-perfect responsive design that adapts seamlessly across desktop, tablet, and mobile devices. Features include smooth animations, contact form integration with EmailJS, and optimized build for deployment on GitHub Pages.',
        technologies: [
          'Flutter Web',
          'Dart',
          'Responsive Design',
          'Animations',
          'EmailJS',
          'GitHub Actions'
        ],
        features: [
          'Fully responsive design for all screen sizes',
          'Smooth animations and transitions',
          'Contact form with email integration',
          'Project showcase with filtering',
          'Skills visualization',
          'Automated deployment with GitHub Actions',
          'SEO optimized',
        ],
        category: 'Web App',
        isFeatured: true,
        imageUrl: 'assets/images/projects/portfolio.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl: null, // No download for web app
      ),
      Project(
        title: 'Task Management App',
        description:
            'A productivity app for managing daily tasks with categories, reminders, and progress tracking.',
        longDescription:
            'Built a feature-rich task management application using local database architecture for offline-first functionality. Implemented custom notification system for task reminders and designed an efficient data model using SQLite with optimized queries. Applied clean architecture principles to ensure maintainability and testability.',
        technologies: [
          'Flutter',
          'Dart',
          'SQLite',
          'Local Notifications',
          'Provider',
          'Clean Architecture'
        ],
        features: [
          'Offline-first architecture with SQLite',
          'Smart reminders with local notifications',
          'Task categories and tags',
          'Progress tracking and analytics',
          'Recurring tasks support',
          'Dark mode support',
          'Data export functionality',
        ],
        category: 'Mobile App',
        imageUrl: 'assets/images/projects/task.png',
        screenshots: [],
        youtubeVideoId: 'dQw4w9WgXcQ', // Placeholder
        downloadUrl: 'https://drive.google.com/file/d/YOUR_FILE_ID/view',
      ),
      Project(
        title: 'Weather Forecast App',
        description:
            'A weather application with location-based forecasts, weather maps, and detailed analytics.',
        longDescription:
            'Developed a weather forecasting application integrating with OpenWeatherMap API for real-time weather data. Implemented geolocation services for automatic location detection and designed interactive charts for weather analytics visualization. Focused on error handling, API rate limiting, and caching strategies for optimal performance.',
        technologies: [
          'Flutter',
          'Dart',
          'REST API',
          'Geolocation',
          'Charts',
          'Provider'
        ],
        features: [
          'Real-time weather data from OpenWeatherMap API',
          'Automatic location detection',
          '7-day weather forecast',
          'Interactive charts and analytics',
          'Multiple location support',
          'Weather alerts and notifications',
          'Beautiful weather animations',
        ],
        category: 'Mobile App',
        imageUrl: 'assets/images/projects/weather.png',
        screenshots: [],
        youtubeVideoId: null,
        downloadUrl: 'https://drive.google.com/file/d/YOUR_FILE_ID/view',
      ),
    ];
  }

  // Sample Skills Data
  static List<Skill> getSkills() {
    return [
      // Frontend & Mobile (from your screenshots)
      Skill(
        name: 'Flutter',
        iconPath: 'assets/icons/flutter.png',
        proficiency: 1.0, // Will not be displayed
        category: 'Frontend',
        description: 'Cross-platform mobile development',
      ),
      Skill(
        name: 'Dart',
        iconPath: 'assets/icons/dart.png',
        proficiency: 1.0,
        category: 'Language',
        description: 'Primary programming language for Flutter',
      ),
      Skill(
        name: 'Firebase',
        iconPath: 'assets/icons/firebase.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'Backend as a Service platform',
      ),
      Skill(
        name: 'Bloc',
        iconPath: 'assets/icons/bloc.png',
        proficiency: 1.0,
        category: 'State Management',
        description: 'State management for Flutter',
      ),

      // Backend & Languages
      Skill(
        name: 'Java',
        iconPath: 'assets/icons/java.png',
        proficiency: 1.0,
        category: 'Language',
        description: 'Object-oriented programming language',
      ),
      Skill(
        name: 'Laravel',
        iconPath: 'assets/icons/laravel.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'PHP web application framework',
      ),
      Skill(
        name: 'SQL',
        iconPath: 'assets/icons/sql.png',
        proficiency: 1.0,
        category: 'Database',
        description: 'Database query language',
      ),

      // Tools & Design
      Skill(
        name: 'Git',
        iconPath: 'assets/icons/git.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Version control system',
      ),
      Skill(
        name: 'Figma',
        iconPath: 'assets/icons/figma.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'UI/UX design and prototyping',
      ),
      Skill(
        name: 'Prototyping',
        iconPath: 'assets/icons/prototype.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'Creating interactive prototypes',
      ),
      Skill(
        name: 'UI/UX Design',
        iconPath: 'assets/icons/design.png',
        proficiency: 1.0,
        category: 'Design',
        description: 'User interface and experience design',
      ),

      // Development Tools
      Skill(
        name: 'Android Studio',
        iconPath: 'assets/icons/android_studio.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Android development IDE',
      ),
      Skill(
        name: 'VS Code',
        iconPath: 'assets/icons/vscode.png',
        proficiency: 1.0,
        category: 'Tool',
        description: 'Code editor and IDE',
      ),

      // APIs
      Skill(
        name: 'REST APIs',
        iconPath: 'assets/icons/api.png',
        proficiency: 1.0,
        category: 'Backend',
        description: 'API integration and development',
      ),
    ];
  }

  // Sample Experience Data
  static List<Experience> getExperience() {
    return [
      Experience(
        company: 'Comsats University Islamabad',
        position: 'Java Developer',
        duration: '2023 - Present',
        description:
            'Built scalable backend systems using Java and MySQL. Focused on Academic projects and internships to enhance skills in software development.',
        achievements: [
          'Developed RESTful APIs for mobile applications',
          'Optimized database queries for performance',
          'Error handling and logging improvements',
        ],
      ),
      Experience(
        company: 'Comsats University Islamabad',
        position: 'Flutter Full Stack Developer',
        duration: '2024 - Present',
        description:
            'Developed cross-platform mobile applications using Flutter to learn and gain experience. Focused on performance optimization with unique features and user experience.',
        achievements: [
          'Built 5+ production-ready apps',
          'Implemented custom Designs and animations',
          'Integrated RESTful APIs and Firebase',
          'Optimized app performance and responsiveness',
          'Learned state management with Provider and Riverpod',
        ],
      ),
    ];
  }

  // Sample Education Data
  static List<Education> getEducation() {
    return [
      Education(
        institution: 'Comsats University Islamabad, Wah Campus',
        degree: 'Bachelor of Science',
        field: 'Software Engineering',
        duration: '2022 - Present',
        grade: 'CGPA: 3.64/4.00',
        description:
            'Specialized in Software Engineering and Mobile Application Development',
      ),
    ];
  }
}
