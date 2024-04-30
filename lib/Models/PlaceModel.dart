class Place {
   final String title;
  final String content;
  final String photo;
  final String author;
  final int rating;
 
  final String address;
  final bool place_deactivated;
  final String creation_date;
  final String modified_date;
    

  Place({
    required this.title,
    required this.content,
    required this.photo,
    required this.author,
    required this.rating,
   
    required this.address,
    required this.place_deactivated,
    required this.creation_date,
    required this.modified_date,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      title: json['title'],
      content: json['content'],
      photo: json['photo'],
      author: json['author'],
      rating: json['rating'],
     
      address: json['address'],
      place_deactivated: json['place_deactivated'],
      creation_date: json['creation_date'],
      modified_date: json['modified_date'],
    );
  }
}
