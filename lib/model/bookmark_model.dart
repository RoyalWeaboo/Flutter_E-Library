class Bookmark {
  String bookId;
  String bookImageUrl;
  String bookTitle;
  String lastRead;
  String page;
  bool readingStatus;
  String bookUrl;
  String notes;
  String viewAbility;

  Bookmark(
      {required this.bookId,
      required this.bookImageUrl,
      required this.bookTitle,
      required this.lastRead,
      required this.page,
      required this.readingStatus,
      required this.bookUrl,
      required this.notes,
      required this.viewAbility});

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_image'] = bookImageUrl;
    data['book_title'] = bookTitle;
    data['book_url'] = bookUrl;
    data['last_read'] = lastRead;
    data['page'] = page;
    data['reading_status'] = readingStatus;
    data['notes'] = notes;
    data['viewability'] = viewAbility;
    return data;
  }

  factory Bookmark.fromFirestore(Map<String, dynamic> json) {
    return Bookmark(
      bookId: json['book_id'],
      bookImageUrl: json['book_image'],
      bookTitle: json['book_title'],
      bookUrl: json['book_url'],
      lastRead: json['last_read'],
      page: json['page'],
      readingStatus: json['reading_status'],
      notes: json['notes'],
      viewAbility: json['viewability'],
    );
  }
}
