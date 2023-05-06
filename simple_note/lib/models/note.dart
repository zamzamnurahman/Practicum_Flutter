class Note {
  String? title;
  String? description;
  DateTime? createdAt;

  Note({this.title, this.description, this.createdAt});

  factory Note.fromJson(Map<String, dynamic> data) {
    return Note(
      title: data['title'],
      description: data['description'],
      createdAt: data['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'created_at': createdAt!.toIso8601String()
    };
  }
}
