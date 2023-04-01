
import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/object/Book.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';
import 'package:frontend_sdcc_flutter/widget/BookCover.dart';
import '../object/User.dart';
import '../utility/Model.dart';
import '../widget/Logo.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController;
  Map<String, bool> autori;
  List<String> autoriSelezionati;
  List<String> generiSelezionati;
  List<int> etaSelezionate;
  Map<String, bool> eta;
  Map<String, bool> genere;
  List<Book> books = [];
  User userLogged;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: "");
    search();
    userLogged = null;
    autoriSelezionati = [];
    etaSelezionate = [];
    generiSelezionati = [];

    autori = {
      "Antoine de Saint-Exupéry" : false,
      "Agatha Christie" : false,
      "Alda Merini" : false,
      "Antonio Gramsci" : false,
      "Barack Obama" : false,
      "Christina Lamb" : false,
      "E. L. James" : false,
      "George R. R. Martin" : false,
      "Gino Strada" : false,
      "Herman Melville" : false,
      "J. K. Rowling" : false,
      "J. R. R. Tolkien" : false,
      "Jules Verne" : false,
      "Nelson Mandela" : false,
      "Stephen King" : false,
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
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.blue, width: 2)),
                              padding: const EdgeInsets.fromLTRB(10,10,10,10),
                              onPressed: () => logout(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("Logout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
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
                                    onPressed: () => search(),
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
                                  onChanged: (bool value) => genreCheck(value,key),
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
                                  onChanged: (bool value) => authorsCheck(value,key),
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
                                  onChanged: (bool value) => ageCheck(value,key),
                                );
                              }).toList(),
                            ),
                          )
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 25, 20, 0),
                      child: Wrap(
                          spacing: 50,
                          runSpacing: 30,
                          children: books.map((Book key) {
                            return BookCover(title: key.toString());
                          }).toList(),
                      ),
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
    Model.sharedInstance.searchBookByName(name:textController.text).then((value) {
      setState(() {
        books = value;
      });
    });
  }

  logout(){
    setState(() {
      userLogged = null;
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
  }

  authorsCheck(bool value, String key) {
    setState(() {
      autori[key] = value;
      if(value) {
        autoriSelezionati.add(key);
      } else {
        autoriSelezionati.remove(key);
      }
    });
    Model.sharedInstance.searchBookByAuthorsIn(authors: autoriSelezionati).then((value) {
      setState(() {
        books = value;
      });
    });
  }


  ageCheck(bool value, String key) {
    Map<String, int> mappa = {
      "Per bambini (3-10)" : 11,
      "Per ragazzi (11-17)" : 18,
      "Per adulti (18+)" : 99
    };
    setState(() {
      eta[key] = value;
      if(value) {
        etaSelezionate.add(mappa[key]);
      } else {
        etaSelezionate.remove(mappa[key]);
      }
    });

    int max = 0;
    for(int age in etaSelezionate) {
      if(age > max) {
        max=age;
      }
    }

    Model.sharedInstance.searchBookByAgeLowerThan(age: max).then((value) {
      setState(() {
        books = value;
      });
    });
  }


  genreCheck(bool value, String key) {
    setState(() {
      genere[key] = value;
      if(value) {
        generiSelezionati.add(key);
      } else {
        generiSelezionati.remove(key);
      }
    });
    Model.sharedInstance.searchBookByGenresIn(genres: generiSelezionati).then((value) {
      setState(() {
        books = value;
      });
    });
  }

}
