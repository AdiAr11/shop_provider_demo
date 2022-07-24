class CartItem {
  final String id;
  final String title;
  int quantity;
  final String imageUrl;
  final double price;

  CartItem({required this.imageUrl,
    required this.id,
    required this.title,
    required this.quantity,
    required this.price});
}