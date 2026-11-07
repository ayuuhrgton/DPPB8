class HospitalModel {
  final String name;
  final String address;
  final int availableBeds;
  final bool isIgdOpen;
  final String emergencyPhone;

  HospitalModel({
    required this.name,
    required this.address,
    required this.availableBeds,
    required this.isIgdOpen,
    required this.emergencyPhone,
  });
}
