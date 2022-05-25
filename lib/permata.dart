import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:clipboard/clipboard.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: paymentmethodpermata()));
}

class paymentmethodpermata extends StatefulWidget {
  @override
  State<paymentmethodpermata> createState() => _paymentmethodpermataState();
}

class _paymentmethodpermataState extends State<paymentmethodpermata>
    with SingleTickerProviderStateMixin {
  int timeLeft = 1;
  final int harga = 16500;
  final int proteksi = 15400;
  final int asuransi = 1500;
  String bank = "PERMATA Virtual Account";
  String assets = "assets/permata.png";
  String nomer = "081290763984";
  String paste = '';
  String ongkir = "Bebas Ongkir";
  bool show = false;
  bool show1 = false;
  bool show2 = false;
  bool show3 = false;
  DateTime data = DateTime.now();

  static const countdownDuration = Duration(days: 1);
  Duration duration = Duration();
  Timer? timer;

  bool isCountdown = true;

  @override
  void initState() {
    super.initState();

    startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width - 20 - 20 - 20 - 5,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                prefixIcon: Icon(Icons.search_outlined,
                    color: Colors.black38, size: 20),
                hintText: "Cari lagi barang impianmu",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.topLeft,
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                DateFormat.yMMMMEEEEd().format(data) +
                                    " " +
                                    DateFormat.Hm().format(data) +
                                    " WIB",
                                // DateTime.now().toString(),
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            // SizedBox(width: 190),
                            buildTime(),
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  height: 1,
                  thickness: 5,
                  color: Colors.grey.shade200,
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(bank,
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        // SizedBox(width: 170),
                        Image(image: AssetImage(assets), width: 60),
                      ]),
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey.shade200,
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
                        buildCopy(),
                        const SizedBox(height: 15),
                        // buildPaste(),
                      ]),
                ),
                SizedBox(height: 7),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Pembayaran",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(harga),
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange)),
                              // SizedBox(width: 5),
                              // SizedBox(width: 185),
                              buildButton(
                                text: 'Lihat Detail',
                                onClicked: () => showModalBottomSheet(
                                  //isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  context: context,
                                  builder: (context) => buildSheet(),
                                ),
                              ),
                            ]),
                      ]),
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 5,
                  color: Colors.grey.shade200,
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Text("Cara Pembayaran",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ATM PERMATA",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        // SizedBox(width: 239),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              show = !show;
                            });
                          },
                          child: (show == true)
                              ? Icon(Icons.expand_less_outlined,
                                  color: Colors.black)
                              : Icon(Icons.expand_more_outlined,
                                  color: Colors.black),
                        ),
                      ]),
                ),
                SizedBox(height: 3),
                (show == true)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                            alignment: Alignment.topLeft,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Masukkan kartu ATM Permata anda",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 300,
                                    child: Text("Masukan PIN",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Pilih menu 'Transaksi Lainnya'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Text("Pilih menu 'Pembayaran'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Pilih menu 'Pembayaran Lainnya'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Text("Pilih menu 'Virtual Account'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Lalu pilih rekening debet yang akan digunakan",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("8.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 300,
                                    child: Text(
                                        "Konfirmasi detail transaksi anda",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("9.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 300,
                                    child: Text("Transaksi Anda telah selesai",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("10.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 300,
                                    child: Text(
                                        "Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                                        style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54)),
                                  ),
                                ]),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile Banking",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        // SizedBox(width: 162),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                show1 = !show1;
                              });
                            },
                            child: (show1 == true)
                                ? Icon(Icons.expand_less_outlined,
                                    color: Colors.black)
                                : Icon(Icons.expand_more_outlined)),
                      ]),
                ),
                SizedBox(height: 3),
                (show1 == true)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                            alignment: Alignment.topLeft,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text("Buka aplikasi Permata Mobile Internet",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Masukkan User ID dan Password",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("3.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Pilih 'Pembayaran Tagihan'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("4.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Pilih 'Virtual Account'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("5.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Masukkan Nomor Virtual Account Anda 7293988549175775",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("6.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Masukkan otentikasi transaksi/token",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("7.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "Transaksi Anda telah selesai",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("8.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 300,
                                    child: Text("Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                                        style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54)),
                                  ),
                                ]),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 5),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Internet Banking",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        // SizedBox(width: 160),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                show2 = !show2;
                              });
                            },
                            child: (show2 == true)
                                ? Icon(Icons.expand_less_outlined,
                                    color: Colors.black)
                                : Icon(Icons.expand_more_outlined,
                                    color: Colors.black)),
                      ]),
                ),
                (show2 == true)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 1, 5),
                            alignment: Alignment.topLeft,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 328,
                                    child: Text(
                                        "Buka situs https://new.permatanet.com",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 300,
                                    child: Text("Masukkan User ID dan Password",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Pilih 'Pembayaran Tagihan'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Pilih 'Virtual Account'",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Text("Masukk Nomor Virtual Account (contoh: 7293988549175775)",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Periksa kembali detail pembayaran anda",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Masukkan otentikasi transaksi/token",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("8.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 300,
                                    child: Text(
                                        "Transaksi Anda telah selesai",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("9.",
                                      style: GoogleFonts.poppins().copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 300,
                                    child: Text(
                                        "Setelah transaksi anda selesai, invoice ini akan diupdate secara otomatis. Proses ini mungkin memakan waktu hingga 5 menit",
                                        style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54)),
                                  ),
                                ]),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 8),
                Divider(
                  height: 1,
                  thickness: 5,
                  color: Colors.grey.shade200,
                ),
              ]),
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: 'HOURS'),
        const SizedBox(width: 1),
        Text(":",
            style: GoogleFonts.poppins().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const SizedBox(width: 1),
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(width: 1),
        Text(":",
            style: GoogleFonts.poppins().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const SizedBox(width: 1),
        buildTimeCard(time: seconds, header: 'SECONDS'),
      ],
    );

    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 30),
    );
  }

  Widget buildTimeCard({required String time, required String header}) => Text(
        time,
        style: GoogleFonts.poppins().copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange),
      );

  Widget buildCopy() => Builder(
        builder: (context) =>
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(nomer,
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(width: 198),
          GestureDetector(
            child: Row(
              children: [
                Text("Salin",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: "AAD7DD".toColor())),
                SizedBox(width: 5),
                Icon(Icons.content_copy_outlined,
                    color: "AAD7DD".toColor(), size: 15),
              ],
            ),
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Kode Pembayaran Berhasil Disalin",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16);
              // FlutterClipboard.copy(nomer);
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(content: Text('Kode Pembayaran Berhasil Disalin')),
              // );
            },
          ),
        ]),
      );

  buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
          child: Text(text,
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: "AAD7DD".toColor())),
          onTap: onClicked);

  Widget buildSheet() =>
      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   clipBehavior: Clip.hardEdge,
      //   physics: BouncingScrollPhysics(),
      //   child:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close_outlined, color: Colors.black)),
                SizedBox(width: 5),
                Text("Detail Pembayaran",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Metode Pembayaran",
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38)),
                // SizedBox(width: 73),
                Text(bank,
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54)),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(
            height: 1,
            thickness: 5,
            color: Colors.grey.shade200,
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Harga",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38)),
                  // SizedBox(width: 201),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(harga),
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                ]),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Proteksi Produk",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38)),
                  // SizedBox(width: 148),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(proteksi),
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                ]),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Ongkos Kirim",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38)),
                  // SizedBox(width: 135),
                  Text(ongkir,
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                ]),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Asuransi Pengiriman",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38)),
                  // SizedBox(width: 156),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(asuransi),
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                ]),
          ),
          SizedBox(height: 15),
          Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.grey.shade200,
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Bayar",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  // SizedBox(width: 194),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(harga),
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange)),
                ]),
          ),
        ],
      );
// );
}
