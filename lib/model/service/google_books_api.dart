import 'package:dio/dio.dart';
import 'package:e_library/model/google_books_model.dart';

class GoogleBooksApi {
  final Dio dio = Dio();

  Future<GoogleBooks> getBooks(String query, {int startIndex = 0}) async {
    try {
      final Response response = await dio.get(
          "https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$startIndex");
      return GoogleBooks.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GoogleBooks> getBooksBySubject(String query, String subject,
      {int startIndex = 0}) async {
    try {
      final Response response = await dio.get(
          "https://www.googleapis.com/books/v1/volumes?q=$subject:$query&startIndex=$startIndex");

      return GoogleBooks.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
