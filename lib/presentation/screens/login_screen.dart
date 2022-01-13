import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personalexpenses/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('./assets/images/login_img.png'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFa8e3e8), width: 0)),
                    filled: true,
                    fillColor: const Color(0xFFa8e3e8),
                  ),
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF030303)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFa8e3e8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        side: const BorderSide(color: Color(0xFFa8e3e8)),
                      ),
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF030303),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
