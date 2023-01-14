class Avatar{

  //currently only supports image as avatar
  String imageUrl;
  String imageId;

  Avatar(this.imageUrl,this.imageId);

  Map<String, String> toJson() =>{
    'imageUrl': imageUrl, 'imageId': imageId
  };

  static Avatar fromJson(Map<String, String> json) => Avatar(json['imageUrl']!,
      json['imageId']!);
}