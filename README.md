<!-- 🌄 Header -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:FF6B6B,100:E63946&height=160&section=header&text=📚%20Book%20Stack%20Design%20System&fontColor=FFFFFF&fontSize=36&fontAlignY=35&animation=fadeIn" alt="Book Stack Design System banner" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white&style=flat-square" alt="Flutter" />
  <img src="https://img.shields.io/badge/Version-0.2.1-E63946?style=flat-square" alt="version" />
  <img src="https://img.shields.io/badge/Coverage-91.6%25-4CAF50?style=flat-square" alt="coverage" />
</p>

<p align="center">
Book Stack Design System is a <strong>modular Flutter package</strong> implementing <strong>Atomic Design principles</strong>.<br>
It provides reusable UI components (atoms, molecules, organisms, templates), comprehensive theme management, and book-oriented templates for scalable Flutter applications.
</p>

---

## 🚀 Features

- 🧩 **Atomic Design architecture**: Atoms, Molecules, Organisms, Templates  
- 🎨 **Customizable components**: Card, Header, Search, Rating, Info, and more  
- 🌗 **Comprehensive theme management** (light/dark modes)  
- 🖼️ **Built-in asset integration** for icons, images, and colors  
- 🪵 **Structured logging** with `BookStackLogger`  
- 📐 **Responsive tokens and layout utilities**  
- 📚 **Book-focused templates**: Grid, detail, and category views  
- 🔌 **Easy integration** into any Flutter app  

---

## 🛠️ Getting Started

### Prerequisites
- **Flutter SDK** >= 3.8.0

### Installation
Add this dependency to your `pubspec.yaml`:

```yaml
dependencies:
  book_stack_design_system:
    git:
      url: https://github.com/jlamilla/book_stack_design_system
      ref: main
````

Then run:

```bash
flutter pub get
```

---

## 🖼️ Asset Usage

All assets are bundled and exposed through the `BookStackAssets` generator — no need to manually declare them.

**Example (Image):**

```dart
BookStackAssets.lib.assets.images.notImage.image(
  package: 'book_stack_design_system',
  width: 100,
  height: 100,
);
```

**Example (SVG Icon):**

```dart
BookStackAssets.lib.assets.icons.search.svg(
  package: 'book_stack_design_system',
  width: 100,
  height: 100,
);
```

✅ Assets are loaded **directly from the package**, ensuring consistency and no manual setup.

---

## 💡 Example: Using a Book Card

```dart
BookInfoCard(
  title: 'Book Title',
  subTitle: 'Author Name',
  price: '\$14.99',
  imageUrl: 'assets/images/cover.png',
);
```

---

## 🧰 Development Workflow

* **Code style**: follows Dart and Flutter linter rules (effective_dart + custom rules)
* **Documentation**: generated following internal Book Stack standards
* **Tests**: focus on widget behavior and UI consistency
* **Automation**: via `Makefile` tasks for testing, coverage, and lint checks

---

## 📦 Project Structure

```
lib/
 ├── atoms/
 ├── molecules/
 ├── organisms/
 ├── templates/
 ├── theme/
 └── utils/
test/
 └── widgets/
coverage/
 ├── lcov.info
 └── html/
```

---

## 🧭 Philosophy

> “Design once, reuse everywhere.”
> Book Stack Design System is built for **consistency, scalability, and developer happiness**.

---

## 🧑‍💻 Author

**José David Lamilla Acevedo**
Software Engineer | Flutter Semi-Senior
[🌐 GitHub Profile](https://github.com/jlamilla) • [📄 CV (PDF)](https://github.com/jlamilla/jlamilla/blob/main/assets/cv_jose_david_lamilla.pdf)

---

<!-- 🌇 Footer -->

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:8B0000,100:FF6B6B&height=120&section=footer" alt="footer"/>
</p>
