class Note {
  int? id;
  String? title;
  String? description;
  int? status;

  Note({this.title, this.status, this.description, this.id});

  Note.withID({this.title, this.status, this.description, this.id});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['status'] = status;
    map['description'] = description;
    map['id'] = id;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note.withID(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
    );
  }
}
