
class Dress  {
  final String name;
  final String url;
  final String description;
final double rate;
int quantity;


  Dress(
    {
    required this.name,
    required this.url,
    required this.description,
    required this.rate,
     this.quantity=1
  });

  String? get id => null;
}