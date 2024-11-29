class Pizza {
  final String name;
  final String description;
  final double price;

  Pizza({required this.name, required this.description, required this.price});

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      name: json['pizzaName'], // Sesuaikan dengan key JSON dari API
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }
}
