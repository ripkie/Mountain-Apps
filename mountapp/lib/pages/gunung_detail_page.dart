import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/gunung.dart';

class GunungDetailPage extends StatelessWidget {
  final Gunung gunung;

  const GunungDetailPage({Key? key, required this.gunung}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LatLng gunungPosition = LatLng(gunung.latitude, gunung.longitude);

    return Scaffold(
      appBar: AppBar(title: Text(gunung.nama)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: gunung.nama,
              child: Image.network(
                gunung.gambar,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gunung.nama,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(gunung.deskripsi, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text(
                    'Jalur Pendakian:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(gunung.trek, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text(
                    'Lokasi Gunung:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: gunungPosition,
                        zoom: 12,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId(gunung.nama),
                          position: gunungPosition,
                          infoWindow: InfoWindow(title: gunung.nama),
                        ),
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Persiapkan fisikmu untuk mendaki ${gunung.nama}! 💪🏞️',
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.directions_walk),
                    label: Text('Mulai Pendakian'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
