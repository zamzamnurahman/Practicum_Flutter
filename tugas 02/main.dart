void main() async {
  String username = "Zamzam Nurahman";
  String nim = "2006126";
  String email = "2006126@itg.ac.id";
  /*TODO : Buat variable untuk memanggil fetchAnonymous() dengan parameter
  berisi identitas masing-masing*/
  Map<String, dynamic> biodata = await fetchAnonymous(nim, username, email);
  /*TODO : buat variablle yang memanggil method factory fromMap agar bisa 
  membuat object User dari variable diatas*/
  User user = User.fromMap(biodata);
  //TODO : Panggil method printName & printEmail dari objek yang sudah dibuat
  user.printName();
  user.printEmail();
}

//TODO : Ubah menjadi function Future & tambahkan parameter
Future<Map<String, dynamic>> fetchAnonymous(
  String nim,
  String username,
  String email,
) async =>
    {
      'id': '$nim',
      'username': '$username',
      'email': '$email',
    };

abstract class UserGlobal {
  Future<User> printName();
  Future<User> printEmail();
}

//TODO : Buatlah class User menjadi turunan dari abstrack class UserGlobal
class User extends UserGlobal {
  String? id;
  String? username;
  String? email;

  String? _lastSeen;

  //TODO : Buatlah Constructor untuk class User dan gunakan named parameter
  User({this.id, this.username, this.email});
  //TODO : Buatlah getter untuk property _lastseen
  get lastseen => _lastSeen;
  //TODO : Buatlah setter untuk property _lastseen
  set setLastSeen(String newValue) => _lastSeen = newValue;

  //TODO : Buatlah sebuah factory untuk membuat objek User dari Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
    );
  }

  Future<User> printName() async {
    print("Nami Abdi : ${this.username}");
    return this;
  }

  Future<User> printEmail() async {
    print("Email Abdi : ${this.email}");
    return this;
  }
}
