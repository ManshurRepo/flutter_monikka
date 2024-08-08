import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scanqr/bloc/product/product_bloc.dart';
import 'package:flutter_scanqr/models/product_model.dart';
import 'package:flutter_scanqr/widgets/delete_success_alert.dart';
import 'package:flutter_scanqr/widgets/edit_success_alert.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage(this.id, this.product, {super.key});

  final String id;
  final ProductModel product;

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
    codeController.text = product.code!;
    nameController.text = product.name!;
    qtyController.text = product.qty!.toString();
    skuController.text = product.sku!;
    snController.text = product.sn!;
    lisensiController.text = product.lisensi!;
    lisensi2Controller.text = product.lisensi2!;
    orderController.text = product.order!;
    receiptController.text = product.receipt!;
    expiredController.text = product.expired!;
    posisiController.text = product.posisi!;
    statusController.text = product.status!;
    keteranganController.text = product.keterangan!;
    divisiController.text = product.divisi!;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Update Product',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: QrImageView(
                      data: product.code!,
                      size: 200,
                      version: QrVersions.auto,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                autocorrect: false,
                controller: codeController,
                keyboardType: TextInputType.number,
                // readOnly: true,
                maxLength: 10,
                decoration: InputDecoration(
                    label: const Text("Kode Produk"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                autocorrect: false,
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: const Text("Nama Produk"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 30),
              TextField(
                autocorrect: false,
                controller: qtyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: const Text("Jumlah Produk"),
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
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  context.read<ProductBloc>().add(
                        EditProduct(
                          name: nameController.text,
                          productId: product.productId!,
                          qty: int.tryParse(qtyController.text) ?? 0,
                          code: codeController.text,
                          sku: skuController.text,
                          sn: snController.text,
                          divisi: divisiController.text,
                          keterangan: keteranganController.text,
                          lisensi2: lisensi2Controller.text,
                          lisensi: lisensiController.text,
                          posisi: posisiController.text,
                          status: statusController.text,
                          expired: expiredController.text,
                          order: orderController.text,
                          receipt: receiptController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is StateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                    if (state is StateSuccessEdit) {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditSuccessAlert()),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state is StateLoadingEdit
                          ? "Loading..."
                          : 'Update Product',
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  // Menampilkan dialog konfirmasi
                  bool? confirmDelete = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: const Text('Konfirmasi Penghapusan'),
                        content: const Text(
                            'Apakah Anda yakin ingin menghapus produk ini?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  false); // Menutup dialog dan mengembalikan false
                            },
                            child: const Text('Tidak'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  true); // Menutup dialog dan mengembalikan true
                            },
                            child: const Text('Ya'),
                          ),
                        ],
                      );
                    },
                  );

                  // Jika pengguna mengonfirmasi penghapusan, lakukan aksi penghapusan
                  if (confirmDelete == true) {
                    context
                        .read<ProductBloc>()
                        .add(DeleteProduct(product.productId!));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.red, // Warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is StateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                    if (state is StateSuccessDelete) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const DeleteSuccessAlert();
                      }));
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state is StateLoadingDelete
                          ? "Loading..."
                          : 'Delete Product',
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
