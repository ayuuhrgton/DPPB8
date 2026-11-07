import '../models/hospital_model.dart';

final List<HospitalModel> mockHospitals = [
  HospitalModel(
    name: 'RSUD Kota Bandung',
    address: 'Jl. Rumah Sakit No. 22',
    availableBeds: 14,
    isIgdOpen: true,
    emergencyPhone: '022-7811794',
  ),
  HospitalModel(
    name: 'RS Hasan Sadikin Bandung',
    address: 'Jl. Pasteur No. 38',
    availableBeds: 5,
    isIgdOpen: true,
    emergencyPhone: '022-2034953',
  ),
  HospitalModel(
    name: 'Puskesmas Pasirkaliki',
    address: 'Jl. Pasirkaliki No. 120',
    availableBeds: 0,
    isIgdOpen: false,
    emergencyPhone: '022-4203451',
  ),
  HospitalModel(
    name: 'Puskesmas Sukajadi',
    address: 'Jl. Sukajadi No. 102',
    availableBeds: 2,
    isIgdOpen: true,
    emergencyPhone: '022-2031234',
  ),
  HospitalModel(
    name: 'RS Al Islam Bandung',
    address: 'Jl. Soekarno-Hatta No. 644',
    availableBeds: 8,
    isIgdOpen: true,
    emergencyPhone: '022-7565588',
  ),
  HospitalModel(
    name: 'RS Santo Borromeus',
    address: 'Jl. Ir. H. Juanda No. 100',
    availableBeds: 0,
    isIgdOpen: false,
    emergencyPhone: '022-2552000',
  ),
];
