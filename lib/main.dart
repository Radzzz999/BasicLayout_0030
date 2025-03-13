import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        fontFamily: 'SF Pro',
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Yogyakarta',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Today',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Suhu utama
            const Text(
              '28°C',
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.blue),
            ),

            // Garis pemisah
            const SizedBox(height: 8),
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),

            // Deskripsi cuaca
            const Text(
              'Sunny',
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.ac_unit, color: Colors.blue, size: 20),
                SizedBox(width: 4),
                Text('5 km/h', style: TextStyle(fontSize: 20, color: Colors.blue)),
              ],
            ),

            const SizedBox(height: 16),

            // Container untuk 7 hari ke depan
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Posisi teks ke kiri
                children: [
                  const Text(
                    'Next 7 days',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWeatherColumn('Now', Icons.ac_unit, '28°C', Icons.air, '10 km/h', Icons.umbrella, '0%'),
                      _buildWeatherColumn('17.00', Icons.wb_sunny, '28°C', Icons.air, '10 km/h', Icons.umbrella, '0%'),
                      _buildWeatherColumn('20.00', Icons.nights_stay, '28°C', Icons.air, '10 km/h', Icons.umbrella, '0%'),
                      _buildWeatherColumn('23.00', Icons.cloud, '28°C', Icons.air, '10 km/h', Icons.umbrella, '0%'),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Footer
            const Text(
              'Developed by: AgungTI.id',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherColumn(String time, IconData weatherIcon, String temp, IconData windIcon, String windSpeed, IconData rainIcon, String rainChance) {
    return Column(
      children: [
        Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Icon(weatherIcon, color: Colors.blue, size: 20),
        Text(temp, style: const TextStyle(fontSize: 18, color: Colors.blue)),
        Icon(windIcon, color: Colors.red, size: 20),
        Text(windSpeed, style: const TextStyle(fontSize: 16, color: Colors.red)),
        Icon(rainIcon, color: Colors.black, size: 20),
        Text(rainChance, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
