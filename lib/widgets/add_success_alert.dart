import 'package:flutter/material.dart';
import 'package:flutter_scanqr/pages/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddSuccessAlert extends StatefulWidget {
  const AddSuccessAlert({super.key});

  @override
  State<AddSuccessAlert> createState() => _AddSuccessAlert();
}

class _AddSuccessAlert extends State<AddSuccessAlert> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Alert(
        context: context,
        style: const AlertStyle(
          backgroundColor: Colors.white,
          animationType: AnimationType.grow,
          animationDuration: Duration(seconds: 1),
        ),
        type: AlertType.success,
        desc: "Produk Berhasil Ditambahkan",
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) =>
                    false, // Menghapus semua rute sebelumnya
              );
            },
            width: 120,
            color: Colors.blue,
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
