import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/user.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.user});

  User? user;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
