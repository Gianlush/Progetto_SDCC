
import 'package:flutter/material.dart';
import '../widget/logo.dart';

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
  Map<String, bool> autori;
  Map<String, bool> eta;
  Map<String, bool> genere;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    autori = {
      "Antoine de Saint-Exupéry" : false,
      "Agatha Christie" : true,
      "E. L. James" : false,
      "George R. R. Martin" : true,
      "Herman Melville" : false,
      "Italo Calvino" : false,
      "J. K. Rowling" : true,
      "J. R. R. Tolkien" : true,
      "Jules Verne" : true,
      "Lewis Carroll" : false,
      "Nelson Mandela" : false,
      "Stephen King" : true,
      "Umberto Eco" : false,
    };

    eta = {
      "Per bambini (3-10)" : false,
      "Per ragazzi (11-17)" : false,
      "Per adulti (18+)" : false
    };

    genere = {
      "Autobiografico" : false,
      "Avventura" : false,
      "Fantasy" : false,
      "Giallo" : false,
      "Horror" : false,
      "Romanzo" : false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              child: Logo(color: Colors.white)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
                        child: Text("Genere",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 175,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              children:
                              genere.keys.map((String key) {
                                return CheckboxListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                                  title: Text(key,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )
                                  ),
                                  side: const BorderSide(color: Colors.black),
                                  activeColor: Colors.blueAccent,
                                  value: genere[key],
                                  onChanged: (bool value) {
                                    setState(() {
                                      genere[key] = value;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          )
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                        child: Text("Autore",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 175,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              children:
                              autori.keys.map((String key) {
                                return CheckboxListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                                  title: Text(key,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )
                                  ),
                                  side: const BorderSide(color: Colors.black),
                                  activeColor: Colors.blueAccent,
                                  value: autori[key],
                                  onChanged: (bool value) {
                                    setState(() {
                                      autori[key] = value;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          )
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                        child: Text("Età",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 175,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              children:
                              eta.keys.map((String key) {
                                return CheckboxListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                                  title: Text(key,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )
                                  ),
                                  side: const BorderSide(color: Colors.black),
                                  activeColor: Colors.blueAccent,
                                  value: eta[key],
                                  onChanged: (bool value) {
                                    setState(() {
                                      eta[key] = value;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          )
                      )
                    ],
                  ),
                  Expanded(
                    child: Wrap(
                        children: [
                          Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),Logo(color: Colors.red,),
                        ]
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }

  search(){

  }

}
