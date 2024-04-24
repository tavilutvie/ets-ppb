final String tableBooks = 'books';

class BookFields {
  static final List<String> values = [

    id, title, description, time, imageUrl
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String time = 'time';
  static final String imageUrl = 'imageUrl';
  static final String description = 'description';
}


class Book {
  final int? id;
  final String title;
  final DateTime createdTime;
  final String imageUrl;
  final String description;

  const Book({
    this.id,
    required this.title,
    required this.createdTime,
    required this.imageUrl,
    required this.description,
  });

  Book copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
    String? imageUrl,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  static Book fromJson(Map<String, Object?> json) => Book(
    id: json[BookFields.id] as int?,
    title: json[BookFields.title] as String,
    description: json[BookFields.description] as String,
    createdTime: DateTime.parse(json[BookFields.time] as String),
    imageUrl: json[BookFields.imageUrl] as String,
  );

  Map<String, Object?> toJson() => {
    BookFields.id: id,
    BookFields.title: title,
    BookFields.description: description,
    BookFields.time: createdTime.toIso8601String(),
    BookFields.imageUrl: imageUrl,
  };
}