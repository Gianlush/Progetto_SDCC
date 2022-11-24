
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/login_page.dart';
import '../widget/logo.dart';
import '../main.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> checkboxGroupValues1;
  List<String> checkboxGroupValues2;
  List<String> checkboxGroupValues3;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 15, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 35),
                            child: Logo(Colors.white)
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.white)),
                            padding: const EdgeInsets.fromLTRB(8,0,5,0),
                            onPressed: search(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text("Logout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                                    child: Icon(Icons.account_circle_outlined, size: 25)
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                            BorderSide(
                                color: Colors.black54,
                                width: 2
                            )
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                controller: textController,
                                style: const TextStyle(
                                    color: Colors.black
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                                  labelStyle: const TextStyle(
                                      color: Colors.white
                                  ),
                                  hintText: 'Search your Book here...',
                                  hintStyle: const TextStyle(
                                      color: Colors.black54
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: RawMaterialButton(
                                  onPressed: search(),
                                  padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  fillColor: Colors.indigo,
                                  child: const Text("Search",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Urbanist',
                                        fontSize: 18
                                    ),
                                  )
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              width: 10000,
              height: 1000,
              child: Text("ciao"),
            )
          ],
        ),
      ),
    );
  }

  search(){

  }

}
