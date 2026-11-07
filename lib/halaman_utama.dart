// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'data/hospital_data.dart';
import 'models/hospital_model.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  Widget buildSearchAndCategoryBar() {
    final List<String> kategoriList = ['Semua', 'RSUD Siaga', 'Puskesmas', 'Klinik 24 Jam', 'Apotek'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari fasilitas kesehatan di Kota Bandung...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kategoriList.length,
            itemBuilder: (BuildContext context, int index) {
              final bool isSelected = index == 0;

              return Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    kategoriList[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget buildQuickActionsGrid() {
    final List<Map<String, dynamic>> menuAksi = [
      {'title': 'Ambulans 119', 'icon': Icons.medical_services, 'color': Colors.red},
      {'title': 'IGD 24 Jam', 'icon': Icons.local_hospital, 'color': Colors.orange},
      {'title': 'Donor Darah PMI', 'icon': Icons.bloodtype, 'color': Colors.red.shade700},
      {'title': 'Halo Dinkes', 'icon': Icons.phone_in_talk, 'color': Colors.green},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layanan Tanggap Darurat Kota Bandung',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: menuAksi.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = menuAksi[index];

            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: item['color'].withOpacity(0.12),
                      radius: 22,
                      child: Icon(
                        item['icon'],
                        color: item['color'],
                        size: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

 Widget buildHospitalDirectory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Fasilitas Kesehatan Rujukan Siaga',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mockHospitals.length,
        itemBuilder: (BuildContext context, int index) {
          final hospital = mockHospitals[index];

          return Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              leading: CircleAvatar(
                backgroundColor: hospital.isIgdOpen
                    ? Colors.blue.shade50
                    : Colors.red.shade50,
                child: Icon(
                  Icons.local_hospital,
                  color: hospital.isIgdOpen ? Colors.blue : Colors.red,
                ),
              ),
              title: Text(
                hospital.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(hospital.address, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 2),
                  Text(
                    'Sisa Tempat Tidur: ${hospital.availableBeds}',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                  ),
                ],
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: hospital.isIgdOpen
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  hospital.isIgdOpen ? 'IGD BUKA' : 'IGD TUTUP',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: hospital.isIgdOpen
                        ? Colors.green.shade800
                        : Colors.red.shade800,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}

  Widget buildEmergencySeparated() {
  final List<Map<String, String>> kontakDarurat = [
    {'nama': 'PSC 119 Kota Bandung', 'nomor': '119 / 022-119'},
    {'nama': 'Command Center Bandung', 'nomor': '112'},
    {'nama': 'Posko PMI Kota Bandung', 'nomor': '022-4207019'},
    {'nama': 'Dinas Kesehatan Siaga', 'nomor': '022-4203752'},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Nomor Penting Kedaruratan Kota Bandung',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: kontakDarurat.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1, color: Colors.grey.shade300);
          },
          itemBuilder: (BuildContext context, int index) {
            final item = kontakDarurat[index];

            return ListTile(
              leading: Icon(Icons.contact_phone, color: Colors.red),
              title: Text(item['nama']!,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              subtitle: Text(item['nomor']!,
                  style: TextStyle(fontSize: 12, color: Colors.blue.shade800)),
              trailing: IconButton(
                icon: Icon(Icons.phone, color: Colors.green),
                onPressed: () {
                  print('Menghubungi ${item['nama']}');
                },
              ),
            );
          },
        ),
      ),
    ],
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siaga Bandung'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchAndCategoryBar(),
              SizedBox(height: 20),
              buildQuickActionsGrid(),
              SizedBox(height: 20),
              buildHospitalDirectory(),
              SizedBox(height: 20),
              buildEmergencySeparated(),
            ],
          ),
        ),
      ),
    );
  }
}

//kesimpulan: Kode ini adalah implementasi halaman utama aplikasi Flutter yang menampilkan berbagai fitur terkait fasilitas kesehatan di Kota Bandung. 
//Halaman ini mencakup bilah pencarian, kategori horizontal, grid menu aksi cepat darurat, direktori rumah sakit, dan daftar kontak darurat penting. 
//Setiap bagian menggunakan widget Flutter seperti `ListView`, `GridView`, dan `ListTile` untuk menampilkan data secara interaktif dan responsif.
//bisa di scroll karena menggunakan `SingleChildScrollView` untuk memungkinkan pengguna menggulir seluruh konten halaman.