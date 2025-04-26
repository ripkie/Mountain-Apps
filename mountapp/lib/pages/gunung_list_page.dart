import 'package:flutter/material.dart';
import '../models/gunung.dart';
import 'gunung_detail_page.dart';

class GunungListPage extends StatelessWidget {
  final List<Gunung> gunungList = [
    Gunung(
      nama: 'Gunung Semeru',
      gambar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Semeru_from_Ranupani.jpg/320px-Semeru_from_Ranupani.jpg',
      deskripsi:
          'Gunung Semeru adalah gunung tertinggi di Pulau Jawa dengan ketinggian 3.676 mdpl.',
      trek: 'Ranu Pani - Ranu Kumbolo - Kalimati - Mahameru',
      latitude: -8.1080,
      longitude: 112.9220,
    ),
    Gunung(
      nama: 'Gunung Rinjani',
      gambar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Mount_Rinjani_Indonesia.jpg/320px-Mount_Rinjani_Indonesia.jpg',
      deskripsi:
          'Gunung Rinjani merupakan gunung tertinggi kedua di Indonesia, dengan ketinggian 3.726 mdpl.',
      trek: 'Sembalun - Plawangan - Puncak Rinjani.',
      latitude: -8.4167,
      longitude: 116.4667,
    ),
    Gunung(
      nama: 'Gunung Merapi',
      gambar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Gunung_Merapi_2.jpg/320px-Gunung_Merapi_2.jpg',
      deskripsi:
          'Gunung Merapi adalah gunung api aktif di Jawa Tengah dan DIY dengan ketinggian 2.930 mdpl.',
      trek: 'Selo - Pasar Bubrah - Puncak Garuda',
      latitude: -7.5407,
      longitude: 110.4461,
    ),
    Gunung(
      nama: 'Gunung Bromo',
      gambar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Mount_Bromo_and_Semeru.jpg/320px-Mount_Bromo_and_Semeru.jpg',
      deskripsi:
          'Gunung Bromo memiliki ketinggian 2.329 mdpl dan terkenal dengan kaldera pasir luas.',
      trek: 'Lautan Pasir - Kawah Bromo',
      latitude: -7.9425,
      longitude: 112.9530,
    ),
    Gunung(
      nama: 'Gunung Kerinci',
      gambar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Gunung_Kerinci.jpg/320px-Gunung_Kerinci.jpg',
      deskripsi:
          'Gunung Kerinci adalah gunung tertinggi di Sumatera dan tertinggi di luar Papua, 3.805 mdpl.',
      trek: 'Kersik Tuo - Shelter 3 - Puncak Kerinci',
      latitude: -1.6975,
      longitude: 101.2644,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Gunung di Indonesia')),
      body: ListView.builder(
        itemCount: gunungList.length,
        itemBuilder: (context, index) {
          final gunung = gunungList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Hero(
                tag: gunung.nama,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    gunung.gambar,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(gunung.nama),
              subtitle: Text('${gunung.deskripsi.substring(0, 30)}...'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GunungDetailPage(gunung: gunung),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
