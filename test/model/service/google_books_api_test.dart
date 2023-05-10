import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/model/service/google_books_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fetching Book From Google Books API', () {
    test(
      'Get Reccomended Books (First 10 Data)',
      () async {
        final GoogleBooks googleBooks =
            await GoogleBooksApi().getBooks("Games");
        expect(googleBooks.items?.isNotEmpty, true);
      },
    );

    test(
      'Get Reccomended Books (next 10 Data)',
      () async {
        final GoogleBooks googleBooks =
            await GoogleBooksApi().getBooks("Games", startIndex: 10);
        expect(googleBooks.items?.isNotEmpty, true);
      },
    );

    test(
      'Search book by subject intitle',
      () async {
        final GoogleBooks googleBooks =
            await GoogleBooksApi().getBooksBySubject("Games", "intitle");
        expect(googleBooks.items?.isNotEmpty, true);
      },
    );
  });
}
