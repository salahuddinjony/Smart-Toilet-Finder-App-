class Toilet {
  final String toiletName;
  final String toiletAddress;
  final String toiletRating;
  final String price;
  final String? imageUrl;

  Toilet({
    required this.toiletName,
    required this.toiletAddress,
    required this.toiletRating,
    required this.price,
    this.imageUrl,
  });
}
