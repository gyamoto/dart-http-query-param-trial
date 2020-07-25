part of openapi.api;

class Pet {
  
  int id = null;
  
  String name = null;
  
  List<String> photoUrls = [];
  Pet();

  @override
  String toString() {
    return 'Pet[id=$id, name=$name, photoUrls=$photoUrls, ]';
  }

  Pet.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    photoUrls = (json['photoUrls'] == null) ?
      null :
      (json['photoUrls'] as List).cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (photoUrls != null)
      json['photoUrls'] = photoUrls;
    return json;
  }

  static List<Pet> listFromJson(List<dynamic> json) {
    return json == null ? List<Pet>() : json.map((value) => Pet.fromJson(value)).toList();
  }

  static Map<String, Pet> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Pet>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Pet.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Pet-objects as value to a dart map
  static Map<String, List<Pet>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Pet>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Pet.listFromJson(value);
       });
     }
     return map;
  }
}

