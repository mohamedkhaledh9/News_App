class Article {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  Article({this.title, this.description, this.url, this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
        title: jsonData['title'],
        description: jsonData['description'],
        url: jsonData['url'],
        imageUrl: jsonData['urlToImage']);
  }
}
