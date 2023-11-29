


class ResponseArticle {
    Source source;
    String? author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String? content;

    ResponseArticle({
        required this.source,
        this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        this.content,
    });

    factory ResponseArticle.fromJson(Map<String, dynamic> json) => ResponseArticle(
        source: Source.fromJson(json["source"]),
        author: json["author"]??"Tidak ada author",
        title: json["title"]??"Tidak ada title",
        description: json["description"]??"Tidak ada deskripsi",
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    


}

class Source {
    String? id;
    String name;

    Source({
        this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

   
}