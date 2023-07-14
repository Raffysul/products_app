class ProductModel {
  final int id;
  final int price;
  final String title;
  final String description;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.imageUrl,
});
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['images'],
    );
  }
}
