import 'package:dio/dio.dart';
import 'package:e_library/model/google_books_model.dart';

class GoogleBooksApi {
  final Dio dio = Dio();

  Future<GoogleBooks> getBooks(String query) async {
    try {
      final Response response =
          await dio.get("https://www.googleapis.com/books/v1/volumes?q=$query");
      return GoogleBooks.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GoogleBooks> getBooksBySubject(String query, String subject) async {
    try {
      final Response response = await dio
          .get("https://www.googleapis.com/books/v1/volumes?q=$subject:$query");
      print(response.data);
      return GoogleBooks.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
