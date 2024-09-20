import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class News {
  final int id;
  String title;
  String content;
  String image;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
  });
}

class NewsAdapter extends TypeAdapter<News> {
  @override
  final typeId = 2;

  @override
  News read(BinaryReader reader) {
    return News(
      id: reader.read(),
      title: reader.read(),
      content: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.content);
    writer.write(obj.image);
  }
}

List<News> newsInitial = [
  News(
    id: 1,
    title: 'Brewed Awakening',
    content:
        'A popular coffee shop, Brewed Awakening, has recently gained a surge in popularity, earning a near-perfect 4.9-star rating on various review platforms.\n\nLocated in the heart of downtown New York City, this trendy café has become a hotspot for both locals and tourists.\n\nKnown for its artisanal coffee sourced from fair-trade farms, Brewed Awakening offers a wide range of beverages, including its signature nitro cold brew and expertly crafted lattes.\n\nThe café\'s modern, cozy atmosphere is a hit with patrons, who often linger to enjoy the free Wi-Fi and welcoming ambiance. Customers rave about the friendly baristas and exceptional service, which contribute to its growing reputation.\n\nBrewed Awakening also features a menu of freshly baked pastries and sandwiches, appealing to both coffee lovers and foodies alike. The café\'s commitment to sustainability, using eco-friendly packaging and supporting local suppliers, has further enhanced its appeal.\n\nWith lines often out the door, Brewed Awakening is quickly becoming one of the most sought-after coffee spots in the city. Many expect this café to maintain its top-tier status as a must-visit destination for coffee aficionados.',
    image: 'news1',
  ),
];
