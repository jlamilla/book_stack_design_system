import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:book_stack_design_system/designs/atomic/atoms/texts/book_stack_text.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/buttons/button_text_icon.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/informative_components/informative_component.dart';
import 'package:book_stack_design_system/designs/atomic/organisms/cards/book_info_card.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/books_list_info_template/books_list_info_template_style.dart';
import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template books_list_info_template}
/// A [BooksListInfoTemplate] template for the Book Stack Design System.
/// Displays a grid of book cards with sorting, favorites, loading, and error states, supporting customizable style and callbacks.
///
/// ### Atomic Level
/// **Template** – Page-level layout in the Atomic Design System.
///
/// ### Parameters
/// - `booksList`: List of books to display.
/// - `crossAxisCount`: Number of columns in grid.
/// - `getIdBook`: Function to get book ID.
/// - `getTitleBook`: Function to get book title.
/// - `getSubTitleBook`: Function to get book subtitle.
/// - `getImageUrlBook`: Function to get book image URL.
/// - `getPriceBook`: Function to get book price.
/// - `onTapDetailsBook`: Callback for book details.
/// - `onLoadMore`: Callback for loading more books.
/// - `hasMore`: Whether there are more books to load.
/// - `isLoading`: Whether the list is loading.
/// - `isFavorite`: Whether favorite mode is active.
/// - `visibilityFavorite`: Whether favorite button is visible.
/// - `visibilitySorts`: Whether sort dropdown is visible.
/// - `error`: Whether to show error state.
/// - `onTapFavorites`: Callback for favorites button.
/// - `sortOptions`: List of sort options.
/// - `onSortChanged`: Callback for sort change.
/// - `initialSortValue`: Initial sort value.
/// - `style`: Style configuration for the template.
///
/// ### Returns
/// Renders a grid of book cards with sorting, favorites, loading, and error states, styled for atomic design system templates.
///
/// ### Example
/// ```dart
/// BooksListInfoTemplate<Book>(
///   booksList: books,
///   getIdBook: (book) => book.id,
///   getTitleBook: (book) => book.title,
///   getSubTitleBook: (book) => book.author,
///   getImageUrlBook: (book) => book.imageUrl,
///   getPriceBook: (book) => book.price,
///   onTapDetailsBook: (book) {},
///   onLoadMore: () async => [],
///   hasMore: true,
/// )
/// ```
/// {@endtemplate}
class BooksListInfoTemplate<T> extends StatefulWidget {
  /// {@macro books_list_info_template}
  const BooksListInfoTemplate({
    super.key,
    required this.booksList,
    required this.getIdBook,
    required this.getTitleBook,
    required this.getSubTitleBook,
    required this.getImageUrlBook,
    required this.getPriceBook,
    required this.onTapDetailsBook,
    required this.onLoadMore,
    required this.hasMore,
    this.crossAxisCount = 2,
    this.isLoading = false,
    this.isFavorite = false,
    this.visibilityFavorite = false,
    this.visibilitySorts = false,
    this.error = false,
    this.onTapFavorites,
    this.sortOptions,
    this.onSortChanged,
    this.initialSortValue,
    this.style = const BooksListInfoTemplateStyle(),
  });

  // Logic parameters
  /// List of books to display.
  final List<T> booksList;
  /// Number of columns in grid.
  final int crossAxisCount;
  /// Function to get book ID.
  final String Function(T value) getIdBook;
  /// Function to get book title.
  final String Function(T value) getTitleBook;
  /// Function to get book subtitle.
  final String Function(T value) getSubTitleBook;
  /// Function to get book image URL.
  final String Function(T value) getImageUrlBook;
  /// Function to get book price.
  final String Function(T value) getPriceBook;
  /// Callback for book details.
  final ValueChanged<T> onTapDetailsBook;
  /// Callback for loading more books.
  final Future<List<T>> Function() onLoadMore;
  /// Whether there are more books to load.
  final bool hasMore;
  /// Whether the list is loading.
  final bool isLoading;
  /// Whether favorite mode is active.
  final bool isFavorite;
  /// Whether sort dropdown is visible.
  final bool visibilitySorts;
  /// Whether favorite button is visible.
  final bool visibilityFavorite;
  /// Whether to show error state.
  final bool error;
  /// Callback for favorites button.
  final VoidCallback? onTapFavorites;
  /// List of sort options.
  final List<String>? sortOptions;
  /// Callback for sort change.
  final ValueChanged<String>? onSortChanged;
  /// Initial sort value.
  final String? initialSortValue;

  // Style parameters
  /// Style configuration for the template.
  final BooksListInfoTemplateStyle style;

  @override
  State<BooksListInfoTemplate<T>> createState() => _BooksListInfoTemplateState<T>();
}

class _BooksListInfoTemplateState<T> extends State<BooksListInfoTemplate<T>> {
  String? _selectedSort;
  late List<T> _books;
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _books = List<T>.from(widget.booksList);
    _selectedSort = widget.initialSortValue ?? (widget.sortOptions?.isNotEmpty ?? false ? widget.sortOptions!.first : null);
  }

  @override
  void didUpdateWidget(covariant BooksListInfoTemplate<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.booksList != widget.booksList) {
      _books = List<T>.from(widget.booksList);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    if (!_scrollController.hasClients || _isLoadingMore || !widget.hasMore || widget.isFavorite || widget.isLoading) {
      return;
    }
    const double threshold = 200.0;
    if (_scrollController.position.extentAfter < threshold) {
      setState(() {
        _isLoadingMore = true;
      });
      final List<T> newBooks = await widget.onLoadMore();
      if (mounted) {
        setState(() {
          if (newBooks.isNotEmpty) {
            _books.addAll(newBooks);
          }
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200) {
          _onScroll();
        }
        return false;
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          if (widget.visibilityFavorite || widget.visibilitySorts)
            SliverToBoxAdapter(
              child: Padding(
                padding: BookStackScreenSize.fromLTRB(
                  context,
                  top: 60 + MediaQuery.of(context).padding.top,
                  right: 24,
                  left: 24,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (widget.visibilityFavorite)
                      ButtonTextIcon(
                        width: widget.isFavorite ? null : BookStackScreenSize.width(context, 155),
                        borderRadius: 8,
                        paddingContent: BookStackScreenSize.symmetric(
                          context,
                          horizontal: 16,
                          vertical: 4,
                        ),
                        height: BookStackScreenSize.height(context, 52),
                        type: ButtonTextIconType.custom,
                        text: 'Favorites',
                        icon: BookStackAssets.lib.assets.icons.heart.svg(
                          package: 'book_stack_design_system',
                          width: BookStackScreenSize.width(context, 27),
                          height: BookStackScreenSize.width(context, 27),
                          color: widget.isFavorite ? BookStackTheme.favoriteColor : BookStackTheme.iconColor(context),
                        ),
                        onPressed: widget.onTapFavorites,
                        backgroundColor: widget.isFavorite ? BookStackTheme.favoriteColor.withOpacity(0.20) : Theme.of(context).cardColor,
                      ),
                    if (widget.sortOptions != null && widget.sortOptions!.isNotEmpty && widget.visibilitySorts)
                      DropdownMenu<String>(
                        initialSelection: _selectedSort,
                        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                          contentPadding: BookStackScreenSize.fromLTRB(
                            context,
                            left: 8,
                            top: 12,
                            bottom: 12,
                          ),
                        ),
                        onSelected: (String? newValue) {
                          setState(() {
                            _selectedSort = newValue;
                          });
                          if (newValue != null && widget.onSortChanged != null) {
                            widget.onSortChanged!(newValue);
                          }
                        },
                        dropdownMenuEntries: widget.sortOptions!.map((String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          if (widget.error && _books.isEmpty)
            const SliverToBoxAdapter(
              child: InformativeComponent(type: InformativeComponentType.error),
            ),
          if (widget.isFavorite && _books.isEmpty && !widget.isLoading && !widget.error)
            const SliverToBoxAdapter(
              child: InformativeComponent(
                type: InformativeComponentType.addData,
              ),
            ),
          if (_books.isNotEmpty || widget.isLoading)
            SliverPadding(
              padding: widget.style.gridPadding ?? BookStackScreenSize.fromLTRB(
                context,
                top: (widget.visibilityFavorite || widget.visibilitySorts) ? 0 : 60 + MediaQuery.of(context).padding.top,
                right: 24,
                left: 24,
                bottom: 16,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.crossAxisCount,
                  mainAxisSpacing: widget.style.mainAxisSpacing ?? BookStackScreenSize.width(context, 16),
                  crossAxisSpacing: widget.style.crossAxisSpacing ?? BookStackScreenSize.width(context, 16),
                  childAspectRatio: widget.style.childAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (widget.isLoading) {
                      return SkeletonCard(
                        height: widget.style.cardHeight,
                        width: widget.style.cardWidth,
                        borderRadius: BorderRadius.all(Radius.circular(BookStackScreenSize.radius(context, widget.style.cardBorderRadius))),
                      );
                    }
                    final T book = _books[index];
                    return BookInfoCard(
                      key: ValueKey<String>(widget.getIdBook(book)),
                      title: widget.getTitleBook(book),
                      subTitle: widget.getSubTitleBook(book),
                      imageUrl: widget.getImageUrlBook(book),
                      price: widget.getPriceBook(book),
                      onTapDetailsBook: () => widget.onTapDetailsBook(book),
                      cardHeight: widget.style.cardHeight,
                      cardWidth: widget.style.cardWidth,
                      cardBorderRadius: widget.style.cardBorderRadius,
                      imageBorderRadius: widget.style.imageBorderRadius,
                      imageErrorPlaceholder: widget.style.imageErrorPlaceholder,
                      imageHeight: widget.style.imageHeight,
                      imagePlaceholder: widget.style.imagePlaceholder,
                      imagePosition: widget.style.imagePosition,
                      imageWidth: widget.style.imageWidth,
                      paddingContent: widget.style.paddingContent,
                      paddingDescription: widget.style.paddingDescription,
                      paddingImage: widget.style.paddingImage,
                    );
                  },
                  childCount: widget.isLoading ? 6 : _books.length,
                ),
              ),
            ),
          if (_isLoadingMore)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: BookStackScreenSize.height(context, 16)),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: BookStackScreenSize.height(context, 16)),
                    child: BookStackText(
                      text: 'Loading more books...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
