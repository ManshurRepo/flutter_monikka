import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scanqr/bloc/product/product_bloc.dart';
import 'package:flutter_scanqr/widgets/add_success_alert.dart';
import 'package:intl/intl.dart'; // Tambahkan ini untuk format tanggal

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController snController = TextEditingController();
  final TextEditingController lisensiController = TextEditingController();
  final TextEditingController lisensi2Controller = TextEditingController();
  final TextEditingController orderController = TextEditingController();
  final TextEditingController receiptController = TextEditingController();
  final TextEditingController expiredController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController divisiController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy')
          .format(picked); // Format tanggal menjadi string
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              autocorrect: false,
              maxLength: 10,
              controller: codeController,
              decoration: InputDecoration(
                  labelText: 'Product Code',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              autocorrect: false,
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Product Quantity',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              maxLength: 10,
              controller: skuController,
              decoration: InputDecoration(
                  labelText: 'SKU',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              autocorrect: false,
              maxLength: 25,
              controller: snController,
              decoration: InputDecoration(
                  labelText: 'SN',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              autocorrect: false,
              maxLength: 20,
              controller: lisensiController,
              decoration: InputDecoration(
                  labelText: 'Lisensi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              autocorrect: false,
              maxLength: 20,
              controller: lisensi2Controller,
              decoration: InputDecoration(
                  labelText: 'Lisensi 2',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context, orderController),
              child: AbsorbPointer(
                child: TextField(
                  autocorrect: false,
                  controller: orderController,
                  decoration: InputDecoration(
                      labelText: 'Tanggal Order',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _selectDate(context, receiptController),
              child: AbsorbPointer(
                child: TextField(
                  autocorrect: false,
                  controller: receiptController,
                  decoration: InputDecoration(
                      labelText: 'Tanggal Receipt',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _selectDate(context, expiredController),
              child: AbsorbPointer(
                child: TextField(
                  autocorrect: false,
                  controller: expiredController,
                  decoration: InputDecoration(
                      labelText: 'Tanggal Expired',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              controller: posisiController,
              decoration: InputDecoration(
                  labelText: 'Posisi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              controller: divisiController,
              decoration: InputDecoration(
                  labelText: 'Divisi',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              controller: keteranganController,
              decoration: InputDecoration(
                  labelText: 'Keterangan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            TextField(
              autocorrect: false,
              controller: statusController,
              decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  if (codeController.text.length == 10) {
                    context.read<ProductBloc>().add(
                          AddProduct(
                              sku: skuController.text,
                              sn: snController.text,
                              divisi: divisiController.text,
                              keterangan: keteranganController.text,
                              lisensi2: lisensi2Controller.text,
                              lisensi: lisensiController.text,
                              posisi: posisiController.text,
                              status: statusController.text,
                              code: codeController.text,
                              name: nameController.text,
                              qty: int.tryParse(qtyController.text) ?? 0,
                              expired: expiredController.text,
                              order: orderController.text,
                              receipt: receiptController.text),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Kode produk harus 10 karakter")));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is StateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                    if (state is StateSuccessAdd) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddSuccessAlert()),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state is StateLoadingAdd ? "Loading..." : 'Add Product',
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
