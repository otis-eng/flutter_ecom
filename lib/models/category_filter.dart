class CategoryFilterItem{
  final int id;
  String title;
  bool active;
  CategoryFilterItem({required this.id, required this.title, this.active=false});

  factory CategoryFilterItem.fromMap(Map<String, dynamic> json) {
    return CategoryFilterItem(
      id: json['id'],
      title: json['title'],
    );
  }
}