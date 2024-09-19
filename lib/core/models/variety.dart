class Variety {
  final String title;
  final String description1;
  final String description2;
  final String image1;
  final String image2;

  Variety({
    required this.title,
    required this.description1,
    required this.description2,
    required this.image1,
    required this.image2,
  });
}

final variety1 = Variety(
  title: 'Arabica',
  description1:
      'Arabica is the most popular coffee variety, known for its smooth, mild flavor and higher acidity compared to other varieties.\n\nIt tends to have a more complex taste with fruity, floral, and sugary notes. Arabica beans are typically grown at higher altitudes and require cooler temperatures.',
  description2:
      'While more delicate and susceptible to pests, they produce a more premium coffee experience.\n\nThis variety contains less caffeine, which contributes to its milder taste.',
  image1: 'assets/varieties1.png',
  image2: 'assets/varieties5.png',
);

final variety2 = Variety(
  title: 'Robusta',
  description1:
      'Robusta beans are known for their bold, strong flavor and higher caffeine content. They are more bitter compared to Arabica, with a heavier, earthy taste that sometimes includes nutty or chocolatey undertones.\n\nRobusta plants are hardier, able to grow in harsher conditions, and are more resistant to diseases and pests.',
  description2:
      'Often used in espresso blends, Robusta creates a rich crema and provides a powerful coffee experience.\n\nIt is generally considered less refined than Arabica but adds body to coffee blends.',
  image1: 'assets/varieties2.png',
  image2: 'assets/varieties6.png',
);

final variety3 = Variety(
  title: 'Liberica',
  description1:
      'Liberica beans are much rarer and have a unique, smoky flavor with floral and fruity notes. The beans are larger and more irregular in shape compared to Arabica or Robusta.\n\nLiberica coffee has a more complex and bold profile, with some smoky, woody, or nutty nuances.',
  description2:
      'It is typically grown in West Africa and Southeast Asia but is not as widely produced due to lower yields and higher cultivation challenges.\n\nThe distinct aroma and bold flavor make it appealing to those looking for something different.',
  image1: 'assets/varieties3.png',
  image2: 'assets/varieties7.png',
);

final variety4 = Variety(
  title: 'Excelsa',
  description1:
      'Excelsa is a lesser-known coffee variety, mainly grown in Southeast Asia, and often categorized as a sub-type of Liberica.\n\nIt has a tart, fruity flavor with a lighter body, making it different from most robust varieties.',
  description2:
      'Excelsa offers both fruity and dark roast flavors within the same cup, giving it a complex taste that’s both tangy and smooth. It is often used to add depth and complexity to blends due to its unique flavor profile.\n\nExcelsa coffee has a distinct aroma with hints of berry and floral tones.',
  image1: 'assets/varieties4.png',
  image2: 'assets/varieties8.png',
);
