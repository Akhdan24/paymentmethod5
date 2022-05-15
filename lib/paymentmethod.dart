import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MaterialApp(home: paymentmethod()));
}

class paymentmethod extends StatefulWidget {
  const paymentmethod({Key? key}) : super(key: key);

  @override
  State<paymentmethod> createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  String tanggal = "Jumat, 13 Mei 2022 14:34 WIB";
  String jam = "04:20:43";
  String bank = "BCA Virtual Account";
  String assets = "assets/bca.png";
  String nomer = "081290763984";
  String harga = "Rp16.500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 232,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined,
                    color: Colors.black38, size: 20),
                hintText: "Cari lagi barang impianmu",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_outlined, color: Colors.black),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: SingleChildScrollView(
        //   clipBehavior: Clip.hardEdge,
        //   physics: BouncingScrollPhysics(),
        //   scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Batas Akhir pembayaran",
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(tanggal,
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            SizedBox(width: 121),
                            Text(jam,
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange)),
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  height: 1,
                  thickness: 7,
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(bank,
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(width: 170),
                        Image(image: AssetImage(assets), width: 30),
                      ]),
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nomor Virtual Account",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(nomer,
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              SizedBox(width: 198),
                              GestureDetector(
                                child: Text("Salin",
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: "AAD7DD".toColor())),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.content_copy_outlined,
                                  color: "AAD7DD".toColor(), size: 15),
                            ]),
                      ]),
                ),
                SizedBox(height: 7),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 5 , 20, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Pembayaran",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(harga,
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange)),
                              SizedBox(width: 5),
                              GestureDetector(
                                child: Icon(Icons.content_copy_outlined,
                                    color: "AAD7DD".toColor(), size: 15),
                              ),
                              SizedBox(width: 188),
                              GestureDetector(
                                onTap: () {},
                                child: Text("Lihat Detail",
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: "AAD7DD".toColor())),
                              ),
                            ]),
                      ]),
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 7),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lihat Cara Pembayaran",
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: "AAD7DD".toColor())),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Divider(
                  height: 1,
                  thickness: 7,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ATM BCA",
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(width: 215),
                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.expand_less_outlined,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("1.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Text("Masukkan Kartu ATM BCA & PIN",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54)),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("2.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Pilih menu Transaksi Lainnya > Transfer > ke Rekening BCA Virtual Account",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("3.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Masukkan 5 angka kode perusahaan untuk Tokopedia (80777) dan Nomor HP yang terdaftar di akun Tokopedia Anda (Contoh: 80777081290763984",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("4.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti No VA, Nama, Perus/Produk dan Total Tagihan",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("5.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Masukkan Jumlah Transfer sesuai dengan Total Tagihan",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("6.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Ikuti intruksi untuk menyelesaikan transaksi",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("7.",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            SizedBox(width: 5),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              child: Text(
                                  "Simpan struk transaksi sebagai bukti pembayaran",
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row( mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("m-BCA (BCA mobile",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ]),
                ),
              ],
            ),
          ),
        // ),
      ),
    );
  }
}
