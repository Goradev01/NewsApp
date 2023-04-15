class NewData {
  String? id;
  String? title;
  String? author;
  String? image;
  String? publishAt;
  String? content;
  NewData({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.publishAt,
    required this.content,
  });

  NewData.fromJson(Map<String, dynamic> map) {
    id = map['source']['id'].toString();
    title = map['title'].toString();
    author = map['author'].toString();
    image = map['urlToImage'].toString();
    publishAt = map['publishAt'].toString();
    content = map['content'].toString();
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'image': image,
        'publishAt': publishAt,
        'content': content,
      };
}
