class AdminScreenController {
  String? name;
  String? phone;
  String? address;
  String? cylindertype;
  AdminScreenController(
      {this.name, this.phone, this.address, this.cylindertype});

  static List<AdminScreenController> customers = [];
}
