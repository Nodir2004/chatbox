import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 61, left: 24, right: 24),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                suffixStyle: TextStyle(color: Colors.black),
                suffix: Container(
                  height: 24,
                  width: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icon/x.svg",color: Colors.black,
                    ),
                  ),
                ),
                prefixIcon: Container(
                  height: 24,
                  width: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icon/search.svg",color: Colors.black,
                    ),
                  ),
                ),prefixStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 327),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ))),
          ),
        ]),
      ),
    );
  }
}
