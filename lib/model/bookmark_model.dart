class Bookmark {
  String bookId;
  String bookImageUrl;
  String bookTitle;
  String authors;
  String lastRead;
  String page;
  bool readingStatus;
  String bookUrl;
  String notes;
  String viewAbility;
  String saleAbility;

  Bookmark(
      {required this.bookId,
      required this.bookImageUrl,
      required this.bookTitle,
      required this.authors,
      required this.lastRead,
      required this.page,
      required this.readingStatus,
      required this.bookUrl,
      required this.notes,
      required this.viewAbility,
      required this.saleAbility});

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_image'] = bookImageUrl;
    data['book_title'] = bookTitle;
    data['authors'] = authors;
    data['book_url'] = bookUrl;
    data['last_read'] = lastRead;
    data['page'] = page;
    data['reading_status'] = readingStatus;
    data['notes'] = notes;
    data['viewability'] = viewAbility;
    data['saleability'] = saleAbility;
    return data;
  }

  factory Bookmark.fromFirestore(Map<String, dynamic> json) {
    return Bookmark(
      bookId: json['book_id'],
      bookImageUrl: json['book_image'],
      bookTitle: json['book_title'],
      authors: json['authors'],
      bookUrl: json['book_url'],
      lastRead: json['last_read'],
      page: json['page'],
      readingStatus: json['reading_status'],
      notes: json['notes'],
      viewAbility: json['viewability'],
      saleAbility: json['saleability'],
    );
  }
}
