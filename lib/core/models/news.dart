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
    title: 'Knoops raises £1m on first day of crowdfunding campaign',
    content:
        'The campaign is part of a wider fundraise being undertaken by Knoops, having been granted EIS approval for £5m\n\nKnoops has raised over £1m since launching its campaign on Wednesday 18 September via Crowdcube, the world’s largest equity crowdfunding platform.\n\nThe Crowdcube campaign went live on Wednesday (18 September) with an initial target of £1m, which had already been comfortably surpassed by the end of yesterday (19 September). The Crowdcube shares will be the same share class as those of existing Knoops shareholders.\n\nThis makes it the fastest Crowdcube fundraise of any food and drink company so far in 2024.\n\nThe campaign is part of a wider fundraise being undertaken by Knoops, having been granted EIS approval for £5m. It plans to use the proceeds to expand its footprint both in the UK as well as internationally, with its first store opening in City Centre Mirdif, Dubai, this October, working with its regional partners, NDS Group.\n\n',
    image:
        'https://www.cateringtoday.co.uk/wp-content/uploads/2024/09/Knoops-IIII-780x470.jpg',
  ),
  News(
    id: 2,
    title: 'Caffè Nero hits record Q1 sales of £147m',
    content:
        'UK sales during the quarter were supported by 2.1% growth in footfall, coupled with a ‘huge’ demand for its cold drinks and summer sweet range\n\nCaffè Nero has reported recorded sales of £147m for the first quarter, driven by very strong growth in the UK of 12.5% year-on-year and a like-for-like sales rise of 9.1%.\n\nThe coffee house brand’s Q1 performance was “notably” above the general trend of the F&B sector, marking a continuation of Caffè Nero’s gain of market share in the coffee segment.\n\nUK sales during the quarter were supported by 2.1% growth in footfall, coupled with a “huge” demand for its cold drinks and summer sweet range, which was up 11.3% year-on-year.\n\n“Building on from the strong Q4 we experienced in FY24, these Q1 FY25 results show we are continuing to drive real momentum and performing very well as a business. I’m optimistic that despite the impact of inflationary costs on our business, we can keep the momentum going and have an outstanding year.”',
    image:
        'https://www.cateringtoday.co.uk/wp-content/uploads/2024/09/alexander-london-8CF0JB6mYX0-unsplash-scaled-e1726830540317-780x470.jpg',
  ),
  News(
    id: 3,
    title: 'Pasta Evangelists opens second Pasta Emporium in Greenwich',
    content:
        'Following the brand’s rapid expansion, including the recent launch of its first pasta factory in 2023, the brand will roll out a further 20 premises over the next five years\n\nPasta Evangelists has opened its second Pasta Emporium in Greenwich, following the launch of its Richmond franchise in July.\n\nThe new opening in South East London will follow the same new take on Italy as the first Richmond location, with fresh pasta shapes made by hand on site and served to customers from the locations’ open pasta counters.\n\nCustomers can choose to dine in or take away, via digital screens or from the counter, and there’s a fleet of terracotta Vespas on hand for Pasta Evangelists deliveries to customers’ homes too.\n\nAt the Greenwich site, which hosts a large communal table, customers will get to enjoy a complimentary self-pour wine machine, offering them a glass of Italian wine. The selection is curated by the specialists at Wine52.\n\n“Not only will a variety of fresh pasta be served in a matter of minutes, but we are also providing a complimentary glass of wine to customers waiting for their meal, free weekly events for the local community, and a warm, Italian hub where customers can enjoy their food either in the restaurant, or at home. After 7 years of operating as a digital business, we are so looking forward to welcoming customers into our new homes.”',
    image:
        'https://www.cateringtoday.co.uk/wp-content/uploads/2024/09/20240910_PastaEGreenwich_173-scaled-e1726569505265-780x470.jpg',
  ),
  News(
    id: 4,
    title: 'L’Eto opens new café and restaurant in Covent Garden',
    content:
        'The brand’s menu features a vast counter of cakes and pastries, hot and cold breakfast classics, a selection of healthy main courses for lunch and dinner, and an array of cocktails\n\n',
    image:
        'https://www.cateringtoday.co.uk/wp-content/uploads/2024/05/LETO-1-780x470.jpg',
  ),
  News(
    id: 5,
    title: 'Franke: coffee consistency is the key to customer loyalty',
    content:
        'Franke Coffee Systems’ innovative Mytico line of coffee machines support businesses to overcome staffing shortages and a lack of training to deliver consistent, barista-quality coffee in every cup\n\nThe hospitality industry is facing ongoing staff shortages and a lack of skilled workers, making it increasingly difficult to maintain high service standards. One area particularly affected is coffee preparation as customers now expect nothing less than premium quality coffee outside the home.\n\nIn such a competitive landscape, the challenge for businesses is to deliver consistently excellent coffee, day after day, regardless of staffing fluctuations.\n\nThis is where Franke Coffee Systems’ innovative Mytico line of coffee machines can deliver huge benefits for operators. Specifically designed to meet the needs of today’s hospitality businesses, the Mytico delivers barista-quality coffee with minimal training required.\n\nThanks to Franke’s patented iQFlow technology, the machine ensures precise and consistent coffee extraction, guaranteeing the same high in-cup quality every time – even if staff members frequently change.\n\nIn addition to its exceptional performance, Mytico enhances any environment with its distinct design, blending Italian tradition on the outside and Swiss precision on the inside. This stylish machine not only elevates the quality of your coffee but also complements the aesthetic of any venue, from hotels to cafés.\n\nWith Mytico, coffee businesses can overcome the operational hurdles while ensuring customers enjoy a flawless coffee experience every time. This reliability helps to retain customers and build loyalty, giving your coffee business a competitive edge.',
    image:
        'https://www.worldcoffeeportal.com/getattachment/cf8924d5-d4d9-4f40-986f-680be2d6c792/FRANKE_Mytico_Coffeeshop_10_026-(2).jpg.aspx?lang=en-GB&width=700&height=467',
  ),
  News(
    id: 6,
    title:
        'Thailand’s ve/la to kickstart international expansion with UK store',
    content:
        'Multi-brand lifestyle group Apostofi will launch the eight-store specialty coffee chain in London during the first quarter of 2025 – with a South Korea launch also in the pipeline\n\nBangkok-based specialty coffee chain ve/la is set to open its first international outlet in London, UK, during the first quarter of 2025.\n\nOwned by multi-brand lifestyle group Apostofi, the first ve/la café opened in March 2021 in Bangkok’s popular shopping district Sukhumvit. Apostofi now operates eight ve/la outlets across the Thai capital, alongside two small format kiosks focusing on speed-of-service and offering a cold brew range on tap.\n\nPrimarily sourcing coffee grown in Doi Pangkhon in Thailand’s Chiang Rai province, ve/la’s serves espresso-based beverages, cold brew and a range of health-focused smoothies.\n\nFounded in 2020, Apostofi also operates the Gardens and Norm restaurants, premium stationery brand Mediums and creative studio Archytipe.\n\nAt its annual keynote event on 10 September 2024, Apostofi said ve/la’s London launch will mark the first time a Thai specialty coffee chain has entered an international market.\n\nApostofi is also planning to launch ve/la in Seoul, South Korea, according to its website. It currently ships its packaged coffee products to both the UK and South Korea, as well as Singapore, the UAE, Qatar and Saudi Arabia.\n\nApostofi’s keynote event also unveiled ve/la’s first app and the all-day cafe-restaurant concept ve/la Studio – which will open in Sukhumvit before the end of the year. Additionally, Apostofi showcased its new ve/la for Business concept at the event, which will offer coffee carts for events and a workplace delivery subscription.\n\nThailand’s 8,400-store branded coffee shop market is led by convenience-focused Café Amazon, Inthanin and PunThai, which all have a strong petrol station presence.\n\nHowever, the popular tourist destination has a well-established domestic specialty coffee segment, including brands such as Roots, Graph Coffee Co and Mingmitr, alongside Hong Kong’s The Coffee Academïcs, France’s Café Kitsuné and Brazil’s The Coffee.',
    image:
        'https://www.worldcoffeeportal.com/getattachment/0e499770-dad1-4104-b52b-5a8d04e32063/ve_la-(1).jpg.aspx?lang=en-GB&width=700&height=439',
  ),
  News(
    id: 7,
    title:
        'Starbucks reaches 500 stores in Thailand with Bangkok drive-thru outlet',
    content:
        'The US coffee chain announced plans last year to reach 800 stores across Thailand by 2030 with local franchise operator Coffee Concepts Thailand\n\nUS coffee chain Starbucks has reached 500 stores in Thailand with a new drive-thru outlet in Bangkok.\n\nStarbucks, which marked 25 years in Thailand last year, is seeking to reach 800 stores across the southeast Asian country by 2030 and views drive-thru as key to outlet expansion.\n\nThe Seattle-based coffee chain entered Thailand in 1998 with a site at the Central Chidlom department store in Bangkok and fully licensed its Thai business to local operator Coffee Concepts Thailand May in 2019.\n\nStarbucks is currently the fourth largest branded coffee shop in Thailand, behind Café Amazon, Inthanin and PunThai Coffee, which operate 4,159, 1,020 and 1,000 stores respectively.\n\nWorld Coffee Portal’s Project Café East Asia 2024 report shows the total Thai branded coffee shop market now exceeds 8,350 outlets, making it third largest in East Asia behind China and South Korea. The total market is forecast to reach 9,590 outlets by 2029.\n\nCoffee Concepts Thailand is a joint venture between Singaporean Food and beverage company F&N and Hong Kong-based Maxim’s Group, which also licenses Starbucks stores in Hong Kong, Macau, Vietnam, Cambodia, Singapore and Laos.\n\n',
    image:
        'https://www.worldcoffeeportal.com/getattachment/51a81f3c-ff26-479c-b5b7-88de68900000/Starbucks-Thailand-500-(1).jpg.aspx?lang=en-GB&width=700&height=465',
  ),
  News(
    id: 8,
    title: 'Thailand’s Café Amazon seeking to open 300 outlets annually',
    content:
        'The value-focused operator opened 286 net new stores in Thailand last year to exceed 4,550 sites and is seeking to strengthen its market leader position\n\nThailand’s PTT Oil and Retail Business (PTT OR) has outlined plans to open 300 new Café Amazon outlets annually.\n\nIn a press release, the Bangkok-based oil and retail business said it was focused on ‘embracing new opportunities for expansion and innovation across the globe’. The plans also involve expanding its petrol station footprint by 100 new PTT Stations each year and growing its health and beauty segment.\n\nPTT OR opened 299 net new Café Amazon stores in 2023 to reach 4,552 outlets across 11 markets globally. The value-focused coffee chain increased its domestic footprint by 286 sites last year to reach 4,159 stores – 54% of which are in PTT OR-owned petrol stations.\n\nCafé Amazon’s international footprint currently comprises nearly 400 sites across Cambodia, China, Japan, Laos, Malaysia, Myanmar, Oman, the Philippines, Saudi Arabia and Vietnam.\n\n“In line with our global aspirations, we are keenly focused on cultivating strategic partnerships and expanding our international footprint. Our approach is not just about entering new markets but about creating value that resonates on a global scale,” said Disathat Panyarachun, CEO, PTT OR.\n\nIn January 2024, PTT OR announced plans to build a coffee knowledge hub in Thailand’s Lampang province to boost supply to its domestic stores. The 240-acre Amazon Park site will operate as an ‘open organic farm’ and R&D hub, educating Thai coffee farmers on its plantations on cultivating and harvesting premium quality arabica and robusta coffee.\n\nAlongside Café Amazon, PTT OR’s food and beverage portfolio also includes more than 220 Texas Chicken, Pacamera Coffee Roasters and Pearly Tea stores. Collectively, its F&B segment achieved 9.5% year-on-year sales growth in the 12 months ending 31 December 2023 to reach THB 15.3bn (\$425m), with EBITDA rising 8% to THB 439m (\$12.2m).',
    image:
        'https://www.worldcoffeeportal.com/getattachment/275ec243-4725-419d-8536-90eecd9ec686/Cafe-Amazon-customers-2-(2).jpg.aspx?lang=en-GB&width=700&height=467',
  ),
  News(
    id: 9,
    title:
        'California-based Red Bay Coffee files for Chapter 11 bankruptcy protection',
    content:
        'Red Bay Coffee is the latest US coffee roaster to file for Chapter 11 bankruptcy protection, citing mounting debts arising from the pandemic and legal costs\n\nCalifornian coffee roaster and café chain Red Bay Coffee has filed for Chapter 11 bankruptcy protection amid ‘spiralling costs and related uncertainties’.\n\nFounded in 2014 by Keba Konte, Red Bay Coffee now operates a roastery and five retail outlets across the Californian cities of Oakland, San Francisco and Berkeley.\n\nThe business filed for bankruptcy in late August 2024, citing the long-term impact of the pandemic and increasing costs regarding to two lawsuits – a sexual harassment case first filed in 2018 and a breach of contract incident.\n\nChapter 11 bankruptcy protection enables a business or individual to restructure or liquidate their assets in a court-supervised process. The action prevents enforcement actions and other legal proceedings against the debtor.\n\nAccording to The San Francisco Business Times, Red Bay Coffee’s assets amount to more than \$250,000, against estimated liabilities of \$3.3m. The coffee roaster and café chain incurred a net loss of more than \$850,000 between January-July 2024.\n\nKonte is acting as debtor-in-possession – meaning he retains property to which creditors have a legal claim under a lien or other security interest – while the Chapter 11 bankruptcy proceedings advance.\n\nWhile the total US branded coffee shop market continue to grow, driven by the sustained outlet growth of larger chains, a number of smaller, more community-focused operators have struggled amid rising costs, labour shortages and the cost-of-living crisis.\n\nCalifornian coffee farm group Frinj Coffee filed for Chapter 11 bankruptcy in January 2024 – a move founder Jay Ruskey described as a ‘strategic semi-pause\' to enable the business to restructure.\n\nIn April 2024, Chicago-based coffee shop and boutique grocery chain Foxtrot closed its 33 stores with immediate effect after finding ‘no viable option’ to continue the business. Foxtrot has since begun reopening some sites after selling its assets to venture capital firm Further Point Enterprises.\n\nAdditionally, Colorado-based coffee roasters Ink! Coffee and Switchback Coffee Roasters filed for Chapter 11 bankruptcy in June and August 2024 respectively, while South Dakota-based specialty purveyor Cottonwood Coffee took the same course of action in July 2024.',
    image:
        'https://www.worldcoffeeportal.com/getattachment/ee617e2f-6beb-45f1-b583-48a906c992d9/Red-Bay-(1).jpg.aspx?lang=en-GB&width=700&height=453',
  ),
  News(
    id: 10,
    title:
        'Paris Baguette North America appoints Norm Ginsberg as Vice President of Operations',
    content:
        'The former bowling alley executive will lead operations for the bakery-café’s growing store network in the US and Canada, where it is seeking to reach 1,000 outlets by 2030\n\nParis Baguette North America has appointed former Bowlero executive Norm Ginsberg as its new Vice President of Operations.\n\nThe bakery-café chain, which entered the US in 2005 and Canada in 2023, said Ginsberg will oversee all operational aspects of its expanding café network, including compliance, quality control and franchise support.\n\n“I’ve been watching Paris Baguette for a number of years now, watching their growth and visiting their cafés. I’ve worked with Darren [Tipton – CEO] in the past, and when he let me know that we had an opportunity here – as the company is growing so rapidly – to do similar things and have that same guest-focused mindset, I knew we were aligned and was excited to come on board,” Ginsberg said.\n\nOwned by South Korean food and beverage giant SPC Group, Paris Baguette North America currently operates 170 US outlets alongside six sites in Canada. The business has 70 venues in various stages of development and has an ambitious goal to reach 1,000 stores across North America by 2030.\n\nThe company is also seeking a master franchise partner to facilitate its expansion to Mexico, where it sees the potential to open 100 outlets.\n\nGinsberg’s appointment is the latest move by Paris Baguette to strengthen its senior management team. After naming Eric Lavinder as its new Chief Development Officer in October 2023, the bakery-café chain boosted its finance, HR, operations, supply chain and marketing leadership in January 2024 with five internal promotions – including moving former Vice President of Operations Nick Scaccio to the position of Chief Operating Officer.\n\nFounded in South Korea in 1988, Paris Baguette currently operates 3,750 stores in South Korea and more than 500 outlets across 11 international markets.',
    image:
        'https://www.worldcoffeeportal.com/getattachment/8ca36db3-a3e0-4bee-8b05-90af8598fa3e/Copy-of-DSC_2162-copy-(1).jpg.aspx?lang=en-GB&width=700&height=466',
  ),
];
