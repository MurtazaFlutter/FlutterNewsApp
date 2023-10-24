import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/pages/news_view.dart';
import '../utils/exports.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<ArticleModel>(context, listen: false);
    return Column(
      children: [
        const Gap(10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsView(newsUrl: newsData.url!))),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                              imageUrl: newsData.urlToImage!)),
                    ),
                    const Gap(5),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: Text(
                            newsData.title!,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: Text(
                            newsData.description!,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
