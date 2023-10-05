class Blog{
  final String id;
  final String image;
  final String title;
  bool isfav;

  Blog({required this.id, required this.image, required this.title, this.isfav = false});

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'image': image,
  //     'title': title,
  //     'isfav': isfav,
  //   };
  // }
  //
  //
  // factory Blog.fromJson(Map<String, dynamic> json) {
  //   return Blog(
  //     id: json['id'],
  //     image: json['image'],
  //     title: json['title'],
  //     isfav: json['isfav'] ?? false,
  //   );
  // }
}