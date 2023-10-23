import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/trending_news.dart';

import '../utils/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    NewsService().fetchNews();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: SizedBox(
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
              const Gap(30),
              Consumer<NewsController>(
                  builder: (context, newsController, child) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const Gap(10),
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
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (index, reason) {
                            newsController.setIndex(index);
                          }),
                    ),
                    const Gap(25),
                    AnimatedSmoothIndicator(
                        effect: const SlideEffect(
                            dotHeight: 15,
                            dotWidth: 15,
                            activeDotColor: Colors.blue),
                        activeIndex: newsController.currentIndex,
                        count: breakingNews.length),
                  ],
                );
              }),
              const Gap(30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending News!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TrendingNews();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
