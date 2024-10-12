class Medicines {
  const Medicines(
      {required this.id,
      required this.name,
      required this.type,
      required this.imageUrl,
      required this.company,
      required this.count,
      required this.price,
      required this.categ,
      required this.enddate});

  final int id;
  final String name;
  final String type;
  final String imageUrl;
  final String company;
  final int count;
  final int price;
  final List <String> categ;
  final String enddate;
}
