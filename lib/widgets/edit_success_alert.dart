import 'package:flutter/material.dart';
import 'package:flutter_scanqr/pages/products_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class EditSuccessAlert extends StatefulWidget {
  const EditSuccessAlert({super.key});

  @override
  State<EditSuccessAlert> createState() => _EditSuccessAlert();
}

class _EditSuccessAlert extends State<EditSuccessAlert> {
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
        desc: "Update Produk Berhasil",
        buttons: [
         DialogButton(
  onPressed: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ProductsPage()),
      (route) => false, // Menghapus semua halaman di stack
    );
  },
  width: 120,
  color: Colors.blue,
  radius: BorderRadius.circular(3),
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
    return const Scaffold(
    );
  }
}
