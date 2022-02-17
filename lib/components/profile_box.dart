import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skansaba_finder/components/my_container.dart';
import 'package:skansaba_finder/providers/auth.dart';
import 'package:skansaba_finder/screens/edit_profile_screen.dart';
import 'package:skansaba_finder/screens/lapor_barang_add_screen.dart';
import 'package:skansaba_finder/widgets/icon_button.dart';
import 'package:page_transition/page_transition.dart';

class ProfileBox extends StatelessWidget {
  final Map<String, dynamic> myAuth;
  const ProfileBox({Key? key, required this.myAuth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        MyContainer(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 45.0,
                child: Text(
                  myAuth['nama'][0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Halo " + myAuth['nama'],
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyIconButton(
                    onPressed: () {
                      Provider.of<Auth>(context, listen: false).logout();
                    },
                    text: Text(
                      "Logout",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyIconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: EditProfileScreen(
                            myAuth: myAuth,
                          ),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    text: Text(
                      "Edit Profile",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.edit),
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyIconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: LaporBarangAddScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    text: Text("Kehilangan"),
                    icon: Icon(Icons.add_alert),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: LaporBarangAddScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    text: Text("Barang"),
                    icon: Icon(Icons.add_box),
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
