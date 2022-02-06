class SliderObject {
  String title;
  String subTitle;
  String images;

  SliderObject(this.images, this.title, this.subTitle);
}

class Customer {
  String? id;
  String? name;
  int? numOfNotifications;

  Customer(this.numOfNotifications, this.id, this.name);
}

class Contact {
  String phone;
  String link;
  String email;

  Contact(this.link, this.email, this.phone);
}

class Authentication {
  Contact? contact;
  Customer? customer;

  Authentication(this.customer, this.contact);
}
class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}