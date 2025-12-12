

class Product {
  int id;
  String title;
  String description;
  String image;
  dynamic price;
  String category;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
  });
     factory Product.fromJson(Map<String, dynamic> json) {
      return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        category: json['category'],
      );
    }
}
