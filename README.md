
# 📚 Book Stack Design System [0.2.0] ![Coverage](coverage_badge.svg)

Book Stack Design System is a **modular Flutter package** implementing **Atomic Design principles**.  
It provides reusable UI components (atoms, molecules, organisms, templates), comprehensive theme management, and book-oriented templates for scalable Flutter applications.

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

## 🛠️ Getting Started

### Prerequisites
- **Flutter SDK** >= 3.8.0

### Installation
Add this dependency to your `pubspec.yaml`:

```yaml
dependencies:
  book_stack_design_system:
    git:
      url: https://github.com/jlamilla/book_stack_design_system.git
````

Then run:

```bash
flutter pub get
```

---

## 🖼️ Asset Usage

All assets are bundled and exposed through the `BookStackAssets` generator — no need to manually declare them.

Example (Image):

```dart
BookStackAssets.lib.assets.images.notImage.image(
  package: 'book_stack_design_system',
  width: 100,
  height: 100,
);
```

Example (SVG Icon):

```dart
BookStackAssets.lib.assets.icons.search.svg(
  package: 'book_stack_design_system',
  width: 100,
  height: 100,
);
```

✅ This ensures assets are loaded **directly from the package**, without manual setup.

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
* **Documentation**: automatically generated following internal Book Stack standards
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
scripts/
 └── generate_coverage_badge.dart
coverage/
 ├── lcov.info
 └── html/
Makefile
coverage_badge.svg
```

---

## 🧭 Philosophy

> “Design once, reuse everywhere.”
> Book Stack Design System is built for **consistency, scalability, and developer happiness**.

---

## 🧑‍💻 Author

**José David Lamilla Acevedo**
Software Engineer | Flutter Semi-Senior
[GitHub Profile](https://github.com/jlamilla)

---