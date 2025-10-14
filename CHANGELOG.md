# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2025-10-11
### Added
- Initial release with project structure, asset setup, and base configuration.

---

## [0.2.0] - 2025-10-12
### Added
- Atoms:
	- CardBase: Customizable card layouts
	- ImageWithLoading: Network images with loading and error states
	- BookStackSearch: Styled book title search input
	- BookStackText: Responsive text display with customizable properties
	- BookStackLogger: Structured logging with debug, info, warning, and error levels
- Molecules:
	- ButtonTextIcon: Icon support and improved documentation
	- CardImageDescription: Images with descriptions and customizable layouts
	- InformativeComponent: Contextual messages with icons and customizable properties
- Organisms:
	- BookInfoCard: Book information with customizable layout and design tokens
	- RatingStar: Star-based rating selection with interactive display
	- HeaderBookStack: Customizable header bar with theme toggling and navigation support
- Templates:
	- ScaffoldBookStack: Customizable scaffold layout with fixed header and body support
	- BookDetailsTemplate: Detailed book information with customizable style and callbacks
	- BookDetailsTemplateStyle: Configurable styling of book details in the design system
	- BooksListInfoTemplate & BooksListInfoTemplateStyle: Customizable grid of book cards with sorting and loading states
- Theme:
	- BookStackTheme: Comprehensive light and dark mode configurations, including input decoration, text styles, and dropdown menu themes
- Misc:
	- HeaderSearchBar: Enhanced search functionality

### Changed
- Improved documentation and structure for SkeletonCard and ButtonBase
- Enhanced asset generation classes
- Removed unused widgets and assets
