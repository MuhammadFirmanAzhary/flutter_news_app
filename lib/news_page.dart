import 'package:flutter/material.dart';
import 'package:news_apps/detail_page.dart';
import 'package:news_apps/response_article.dart';
import 'package:news_apps/service.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NewsApp"),
      ),
      body: FutureBuilder(
        future: Service.fetchArticles(),
        builder: ((context, snapshot) {
         print(snapshot.data);
          return snapshot.data != null
         ?buildListView(snapshot.data!)
          :const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
  Widget buildListView(List<ResponseArticle> listArticle){
    return ListView.builder(
      itemCount: listArticle.length,
      itemBuilder: (context, index){
        final article = listArticle[index];
        return GestureDetector(

          onTap: (){
            final route = MaterialPageRoute(builder: (context)=>
            DetailPage(article: article));
            Navigator.push(context, route);
          },
          child: Card(
            margin : const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 shape:
                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 elevation: 5,
                 child: Column(
                   children: [
                     ClipRRect(
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20),
                       ),
                       child: Image.network(
                         article.urlToImage,
                         width: double.infinity,
                         fit: BoxFit.cover,
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Text(
                         article.title,
                         style: const TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                         children: [
                           Expanded(
                             child: Text(
                               article.author ?? '',
                               style: const TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               overflow: TextOverflow.ellipsis,
                             ),
                           ),
                           Text(
                             article.publishedAt.toString(),
                             style:  TextStyle(
                               fontSize: 15,
                               color: Colors.grey[600],
                             ),
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
        );

      },
    );
  }
}
