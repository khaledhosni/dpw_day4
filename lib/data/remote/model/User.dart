class User {
  User({
      this.createdAt, 
      this.name, 
      this.avatar, 
      this.phone, 
      this.country, 
      this.photo, 
      this.birthdate, 
      this.id,});

  User.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    phone = json['phone'];
    country = json['country'];
    photo = json['photo'];
    birthdate = json['birthdate'];
    id = json['id'];
  }
  String? createdAt;
  String? name;
  String? avatar;
  String? phone;
  String? country;
  String? photo;
  String? birthdate;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['country'] = country;
    map['photo'] = photo;
    map['birthdate'] = birthdate;
    map['id'] = id;
    return map;
  }

}