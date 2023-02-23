// ignore_for_file: public_member_api_docs, sort_constructors_first

class GalleryItem {
  final String id;
  final String name;
  final String author;
  final String fullImage;
  final String thumbImage;

  GalleryItem(
    this.id,
    this.name,
    this.author,
    this.fullImage,
    this.thumbImage,
  );

  GalleryItem.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['description'] ?? json['alt_description'],
        author = json['user']['name'],
        fullImage = json['urls']['full'],
        thumbImage = json['urls']['thumb'];
}
