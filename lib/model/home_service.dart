import 'package:meta/meta.dart';

class HomeService{
  HomeService({@required this.id,@required this.name, @required this.contact,  this.service,this.city});

  final id;
  final String name;
  final int contact;
  final String service;
  final String city;

  factory HomeService.fromMap(Map<String, dynamic> data , String documentID ) {
    if(data == null){
      return null;
    }
    final String name = data['name'];
    final int contact = data['contact'];
    final String service = data['service'];
    final String city = data['city'];

    return HomeService(
      id: documentID,
      name: name,
      contact: contact,
      service: service,
      city: city,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contact': contact,
      'service': service,
      'city': city,
    };
  }
}

