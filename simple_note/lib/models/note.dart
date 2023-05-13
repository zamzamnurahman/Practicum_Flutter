class Note {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;

  Note({this.id, this.title, this.description, this.createdAt});

  factory Note.fromJson(Map<String, dynamic> data) {
    return Note(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      createdAt: data['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt!.toIso8601String()
    };
  }
}
