
import 'package:flutter/material.dart';

class SentraUmkmPage extends StatelessWidget {
  SentraUmkmPage({super.key});

  final Color primaryColor = const Color(0xFF8054B8);
  final Color backgroundColor = const Color(0xFFFAF5FC);

  // Data klaster industri
  final List<Map<String, dynamic>> klaster = [
    {
      'nama': 'Kerajinan Sepatu & Kulit',
      'jumlah': '420 Unit Usaha',
      'icon': Icons.shopping_bag,
    },
    {
      'nama': 'Industri Tekstil & Rajut',
      'jumlah': '310 Unit Usaha',
      'icon': Icons.checkroom,
    },
    {
      'nama': 'Sablon & Kaos Kreatif',
      'jumlah': '280 Unit Usaha',
      'icon': Icons.palette,
    },
    {
      'nama': 'Kuliner Olahan Rakyat',
      'jumlah': '190 Unit Usaha',
      'icon': Icons.restaurant,
    },
  ];

  // Data direktori sentra binaan
  final List<Map<String, dynamic>> sentra = [
    {
      'nama': 'Sentra Sepatu & Kulit Cibaduyut',
      'kawasan': 'Cibaduyut',
      'alamat': 'Jl. Cibaduyut Raya No. 1-150, Bandung',
      'jumlah': '420 UKM',
      'jam': '08.00 - 20.00 WIB',
      'status': 'Binaan Mandiri',
    },
    {
      'nama': 'Sentra Rajut Kreatif Binong Jati',
      'kawasan': 'Binong Jati',
      'alamat': 'Jl. Binong Jati No. 24, Bandung',
      'jumlah': '310 UKM',
      'jam': '08.30 - 17.00 WIB',
      'status': 'Binaan Mandiri',
    },
    {
      'nama': 'Sentra Sablon & Kaos Suci',
      'kawasan': 'Surapati',
      'alamat': 'Jl. Surapati No. 80-120, Bandung',
      'jumlah': '280 UKM',
      'jam': '09.00 - 19.00 WIB',
      'status': 'Binaan Baru',
    },
    {
      'nama': 'Sentra Kuliner Pasirkoja',
      'kawasan': 'Pasirkoja',
      'alamat': 'Jl. Pasirkoja, Bandung',
      'jumlah': '190 UKM',
      'jam': '08.00 - 21.00 WIB',
      'status': 'Binaan Baru',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // APP BAR
      appBar: AppBar(
        title: const Text(
          'Sentra UMKM & Kreatif Bandung',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER BANNER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE2F7),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Komitmen Pemberdayaan Sentra Industri Rakyat',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mendukung sentra industri unggulan dan '
                    '1.285 pengrajin aktif binaan Kota Bandung.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // JUDUL KLASTER
            const Text(
              'Klaster Unggulan Sentra Industri',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // GRID VIEW BUILDER
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: klaster.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.3,
              ),
              itemBuilder: (context, index) {
                final item = klaster[index];

                return Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFEDE2F7),
                          child: Icon(
                            item['icon'],
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['nama'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['jumlah'],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // JUDUL DIREKTORI
            const Text(
              'Direktori Unit Sentra Binaan',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // LIST VIEW BUILDER
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sentra.length,
              itemBuilder: (context, index) {
                final item = sentra[index];

                bool mandiri =
                    item['status'] == 'Binaan Mandiri';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),

                    // LEADING
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFEDE2F7),
                      child: Icon(
                        Icons.storefront,
                        color: primaryColor,
                      ),
                    ),

                    // TITLE
                    title: Text(
                      item['nama'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // SUBTITLE
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['alamat'],
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${item['kawasan']} • ${item['jumlah']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Buka: ${item['jam']}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // TRAILING BADGE
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: mandiri
                            ? Colors.green.shade50
                            : Colors.blue.shade50,
                        border: Border.all(
                          color: mandiri
                              ? Colors.green
                              : Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item['status'],
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: mandiri
                              ? Colors.green.shade800
                              : Colors.blue.shade800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
