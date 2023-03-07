void main() {
  /// data kumpulan buku buku
  List<Map> books = [
    {
      "title": "Si kancil hewan cerdas",
      "publish_date": "2023-07-20",
      "writer": "Zamzam Nurahman",
    },
    {
      "title": "nabi dan rasul",
      "publish_date": "2023-02-22",
      "writer": "Ahmad Wahyu",
    },
    {
      "title": "Bacaan doa harian",
      "publish_date": "2023-02-10",
      "writer": "Annisa liya",
    },
    {
      "title": "pemrograman moble",
      "publish_date": "2023-11-10",
      "writer": "Agus",
    },
  ];

  ///memasukan tiap tiap elemen ke List
  List titles = books.map((book) => book['title']).toList();
  List publish = books.map((book) => book['publish_date']).toList();
  List writes = books.map((book) => book['writer']).toList();

  ///Menampilkan tiap book
  for (var book in books) {
    print(book);
  }

  ///melihat daftar judul buku
  print("\nDaftar Judul Buku : ");
  List.generate(titles.length, (i) => print("${i + 1}. ${titles[i]}"));

  ///melihat daftar publish buku
  print("\nDaftar publish buku : ");
  List.generate(titles.length, (i) => print("${i + 1}. ${publish[i]}"));

  ///melihat daftar penulis buku
  print("\nDaftar penulis buku : ");
  List.generate(titles.length, (i) => print("${i + 1}. ${writes[i]}"));
}
