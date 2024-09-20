import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Cafe {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String location;
  @HiveField(4)
  String image;

  Cafe({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.image,
  });
}

class CafeAdapter extends TypeAdapter<Cafe> {
  @override
  final typeId = 1;

  @override
  Cafe read(BinaryReader reader) {
    return Cafe(
      id: reader.read(),
      title: reader.read(),
      description: reader.read(),
      location: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Cafe obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.location);
    writer.write(obj.image);
  }
}

List<Cafe> cafesInitial = [
  Cafe(
    id: 1,
    title: 'Cafe de Flore',
    description:
        'Cafe de Flore is one of the oldest and most iconic cafes in Paris, frequented by artists, writers, and intellectuals throughout history.\n\nIt offers an elegant atmosphere with classic Parisian decor and a prime location in the vibrant Saint-Germain-des-Prés district. Visitors can enjoy rich espressos, velvety café crèmes, and traditional French pastries while soaking in the chic ambiance.\n\nThe cafe\'s historical significance and central location make it a must-visit for coffee lovers and cultural enthusiasts alike. With outdoor seating, it provides an ideal spot for people-watching while enjoying a cup of coffee. The quality of the coffee matches the high expectations, with expertly brewed options from local roasters.\n\nAlongside coffee, they offer signature hot chocolate and a variety of teas. The experience is enhanced by the timeless Parisian charm, attracting both locals and tourists.\n\nWhether you’re looking for a peaceful morning or an afternoon break, Cafe de Flore offers a classic, sophisticated coffee experience.',
    location: 'Paris, France',
    image: 'cafe1',
  ),
  Cafe(
    id: 2,
    title: 'Café Central',
    description:
        'Café Central in Vienna is a historic cafe that dates back to the 19th century, known for its grand architecture and literary patrons. It offers a luxurious setting with high ceilings, chandeliers, and marble columns, creating an old-world charm perfect for enjoying a cup of coffee.\n\nThe cafe specializes in traditional Viennese coffee like the "Melange," similar to a cappuccino but with more milk, and the "Einspänner," a strong coffee topped with whipped cream.\n\nCafé Central is also famous for its selection of Austrian pastries, such as the iconic apple strudel and Sachertorte.\n\nThe atmosphere is both elegant and lively, with live piano music enhancing the overall experience. Its historical significance as a meeting place for intellectuals like Freud and Trotsky adds a unique cultural aspect to each visit.\n\nGuests can enjoy an array of beverages including specialty coffees and teas, along with a full breakfast or lunch menu.\n\nCafé Central’s perfect blend of culture, history, and quality makes it an essential stop for coffee enthusiasts. The professional and courteous service elevates the experience, ensuring a memorable visit.',
    location: 'Vienna, Austria',
    image: 'cafe2',
  ),
  Cafe(
    id: 3,
    title: 'Stumptown Coffee Roasters',
    description:
        'Stumptown Coffee Roasters, based in Portland, Oregon, is renowned for its commitment to direct trade and high-quality coffee sourcing.\n\nThe cafe offers a trendy, minimalist atmosphere where coffee lovers can enjoy expertly brewed pour-overs, cold brews, and espressos. Stumptown is celebrated for its dedication to ethical sourcing, working directly with farmers to ensure the highest quality beans and sustainable practices.\n\nThe house specialty, the "Nitro Cold Brew," is a must-try, featuring a smooth, creamy texture served on tap like a beer. Customers also appreciate the rotating single-origin coffees, offering a taste of various regions worldwide.\n\nThe knowledgeable baristas take pride in perfecting each cup, making it a favorite for coffee purists. Stumptown\'s Portland location is a hub for both locals and tourists, thanks to its laid-back vibe and exceptional coffee.\n\nVisitors can also explore the cafe’s roastery to see the process behind their premium coffee. The focus on innovation and sustainability makes Stumptown a leader in the specialty coffee scene.',
    location: 'Portland, USA',
    image: 'cafe3',
  ),
  Cafe(
    id: 4,
    title: 'Caffè Florian',
    description:
        'Located in the heart of Piazza San Marco, Caffè Florian is one of the oldest cafes in the world, established in 1720. It boasts stunning Baroque-style interiors with ornate decorations, luxurious seating, and views of Venice’s famous square.\n\nThe cafe offers a refined coffee experience with classic Italian espresso drinks like the "Caffè Florian," a signature blend unique to the establishment.\n\nVisitors can enjoy their coffee with exquisite Venetian pastries, or indulge in a full afternoon tea service. The outdoor seating provides a chance to soak in the beauty of Venice, accompanied by live music from the café\'s orchestra. Its historic significance, combined with the opulent ambiance, makes it a favorite among celebrities, politicians, and artists.\n\nCaffè Florian is more than just a cafe – it\'s an experience of Venetian culture and history, offering a glimpse into the past. The service is impeccable, with attention to detail in both presentation and flavor.\n\nWith its rich heritage and exceptional coffee, Caffè Florian offers a luxurious, once-in-a-lifetime coffee experience.',
    location: 'Venice, Italy',
    image: 'cafe4',
  ),
];
