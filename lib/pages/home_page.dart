import '../utils/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<Map<String, dynamic>> categories = [
    {'title': 'Buildings', 'images': 'assets/images/building.jpg'},
    {'title': 'Business', 'images': 'assets/images/business.jpg'},
    {'title': 'Entertainment', 'images': 'assets/images/entertainment.jpg'},
    {'title': 'General', 'images': 'assets/images/general.jpg'},
    {'title': 'Science', 'images': 'assets/images/science.jpg'},
    {'title': 'Sport', 'images': 'assets/images/sport.jpg'},
  ];

  static final List<Map<String, dynamic>> breakingNews = [
    {
      'title': 'Bow To The Authority of Silenforce',
      'images': 'assets/images/business.jpg'
    },
    {
      'title': 'Bow To The Authority of Silenforce',
      'images': 'assets/images/entertainment.jpg'
    },
    {
      'title': 'Bow To The Authority of Silenforce',
      'images': 'assets/images/general.jpg'
    },
    {
      'title': 'Bow To The Authority of Silenforce',
      'images': 'assets/images/science.jpg'
    },
    {
      'title': 'Bow To The Authority of Silenforce',
      'images': 'assets/images/sport.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text.rich(TextSpan(children: [
          TextSpan(
            text: 'Flutter',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: 'News',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ])),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 60,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index]['images'],
                      title: categories[index]['title'],
                    );
                  }),
            ),
            const Gap(29),
            CarouselSlider.builder(
              itemCount: breakingNews.length,
              itemBuilder: (context, index, realIndex) {
                return BreakingNewsSlider(
                  image: breakingNews[index]['images'],
                  title: breakingNews[index]['title'],
                );
              },
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
            )
          ],
        ),
      ),
    );
  }
}
