import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pertemuan_8_apps/model/mahasiswa.dart';
import 'package:pertemuan_8_apps/services/get_data_mahasiswa.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: FutureBuilder(
          future: ServicesDataMahasiswa().getDataMahasiswa(),
          builder: (context, snapshot) {
            log(snapshot.connectionState.toString(), name: "status");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                List<Mahasiswa> data = snapshot.data!;
                inspect(data);
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(data[index].nama[0]),
                        ),
                        title: Text(data[index].nama),
                        subtitle: Text(data[index].nim),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("Data tidak ada"));
              }
            }
          }),
    );
  }
}
