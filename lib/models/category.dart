class CategoryItem {
  final int id;
  final String title;
  final String? imagePath;
  int itemsInCategory = 5320;
  CategoryItem({required this.id, required this.title, this.imagePath});

  factory CategoryItem.fromMap(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      title: json['title'],
      imagePath: json['image_path'],
    );
  }
}
