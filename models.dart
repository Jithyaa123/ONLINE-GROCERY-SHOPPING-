class Product {
  final String id;
  final String name;
  final String category;
  final String emoji;
  final double price; // in INR
  final String unit;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.emoji,
    required this.price,
    required this.unit,
  });
}

class CartItem {
  final Product product;
  int qty;
  CartItem(this.product, this.qty);
}
