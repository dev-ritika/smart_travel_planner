import 'dart:convert';

UserImages userImagesFromJson(String str) =>
    UserImages.fromJson(json.decode(str));

String userImagesToJson(UserImages data) => json.encode(data.toJson());

class UserImages {
  int resultCount;
  int pageCount;
  int pageSize;
  int page;
  List<ImagesResult> results;

  UserImages({
    required this.resultCount,
    required this.pageCount,
    required this.pageSize,
    required this.page,
    required this.results,
  });

  factory UserImages.fromJson(Map<String, dynamic> json) => UserImages(
    resultCount: json["result_count"],
    pageCount: json["page_count"],
    pageSize: json["page_size"],
    page: json["page"],
    results: List<ImagesResult>.from(
      json["results"].map((x) => ImagesResult.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "result_count": resultCount,
    "page_count": pageCount,
    "page_size": pageSize,
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ImagesResult {
  String id;
  String title;
  String url;
  String creator;
  String? category;
  int? filesize;
  String? filetype;
  String thumbnail;

  ImagesResult({
    required this.id,
    required this.title,
    required this.url,
    required this.creator,
    this.category = "",
    this.filesize = 0,
    this.filetype = "",
    required this.thumbnail,
  });

  factory ImagesResult.fromJson(Map<String, dynamic> json) => ImagesResult(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    creator: json["creator"],
    category: json["category"],
    filesize: json["filesize"],
    filetype: json["filetype"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "creator": creator,
    "category": category,
    "filesize": filesize,
    "filetype": filetype,
    "thumbnail": thumbnail,
  };
}
