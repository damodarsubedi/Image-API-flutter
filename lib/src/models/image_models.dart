class ImageModel{
  int id;
  String title;
  String url;
  ImageModel(this.id,this.title,this.url);
  ImageModel.fromJson(Map<String, dynamic>parsedJson){
    id = parsedJson['id'];
    title = parsedJson['title'];
    url =parsedJson['url'];
  }
}