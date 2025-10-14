import 'package:flutter_test/flutter_test.dart';

import 'atoms/buttons/button_base_test.dart' as button_base_test;
import 'atoms/cards/card_base_test.dart' as card_base_test;
import 'atoms/images/image_with_loading_test.dart' as image_with_loading_test;
import 'atoms/inputs/book_stack_search_test.dart' as book_stack_search_test;
import 'atoms/skeletons/skeleton_card_test.dart' as skeleton_card_test;
import 'atoms/texts/book_stack_text_test.dart' as book_stack_text_test;
import 'molecules/buttons/button_text_icon_test.dart' as button_text_icon_test;
import 'molecules/cards/card_image_description_test.dart' as card_image_description_test;
import 'molecules/informative_components/informative_component_test.dart' as informative_component_test;
import 'molecules/rating/rating_star_test.dart' as rating_star_test;
import 'organisms/cards/book_info_card_test.dart' as book_info_card_test;
import 'organisms/headers/header_book_stack_test.dart' as header_book_stack_test;
import 'templates/body/scaffold_book_stack_test.dart' as scaffold_book_stack_test;
import 'templates/books/book_details_template/book_details_template_test.dart' as book_details_template_test;
import 'templates/books/books_list_info_template/books_list_info_template_test.dart' as books_list_info_template_test;
import 'theme/book_stack_theme_test.dart' as book_stack_theme_test;

void main() {
  group('test_library_book_stack', () {
    group('atoms', () {
      button_base_test.main();
      card_base_test.main();
      image_with_loading_test.main();
      book_stack_search_test.main();
      skeleton_card_test.main();
      book_stack_text_test.main();
    });
    group('molecules', () {
      button_text_icon_test.main();
      card_image_description_test.main();
      informative_component_test.main();
      rating_star_test.main();
    });
    group('organisms', () {
      book_info_card_test.main();
      header_book_stack_test.main();
    });
    group('templates', () {
      scaffold_book_stack_test.main();
      book_details_template_test.main();
      books_list_info_template_test.main();
    });
    group('theme', () {
      book_stack_theme_test.main();
    });
  });
}
