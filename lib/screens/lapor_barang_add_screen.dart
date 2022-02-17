import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skansaba_finder/widgets/icon_button.dart';

class LaporBarangAddScreen extends StatefulWidget {
  const LaporBarangAddScreen({Key? key}) : super(key: key);

  @override
  _LaporBarangAddScreen createState() => _LaporBarangAddScreen();
}

class _LaporBarangAddScreen extends State<LaporBarangAddScreen> {
  Widget kehilanganWidget = Container();
  Widget menemukanWidget = Container();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lapor')),
      body: Center(
        child: Container(
            margin: EdgeInsets.all(40),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.add_box,
                              color: Colors.blue,
                              size: 37,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Lapor Barang",
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                obscureText: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    gapPadding: 10,
                                  ),
                                  labelText: "Nama Barang",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines:
                                    1, //Normal textInputField will be displayed
                                maxLines:
                                    5, // when user presses enter it will adapt to it
                                obscureText: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Keterangan",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyIconButton(
                                    onPressed: () {},
                                    text: const Text("Submit"),
                                    icon: const Icon(Icons.edit),
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
