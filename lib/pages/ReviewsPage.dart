
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';
import 'package:frontend_sdcc_flutter/utility/Model.dart';
import 'package:frontend_sdcc_flutter/widget/BookCover.dart';
import 'package:highlight_text/highlight_text.dart';

import '../object/Book.dart';
import '../object/Review.dart';
import '../widget/Popup.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key key}) : super(key: key);

  static Book book;

  @override
  State<StatefulWidget> createState() {
    return ReviewsPageState();
  }
}

class ReviewsPageState extends State<ReviewsPage> {
  TextEditingController commentController;
  TextEditingController titleController;
  TextEditingController searchController;
  ScrollController scrollControllerGallery;
  ScrollController scrollControllerMainHorizontal;
  ScrollController scrollControllerMainVertical;

  List <String> listStarFilter;
  String filterSelected;
  //List<Image> images;
  List<PlatformFile> imageFiles;
  double rating;
  bool loading;

  List<Review> reviews;
  Review userReview;
  Map<String, HighlightedWord> wordsHighlight;




  @override
  void initState() {
    super.initState();

    commentController = TextEditingController();
    titleController = TextEditingController();
    searchController = TextEditingController();
    listStarFilter = ["Tutte le stelle","Solo 0 stelle", "Solo 1 stella","Solo 2 stelle","Solo 3 stelle" ,"Solo 4 stelle", "Solo 5 stelle"];

    filterSelected = "Tutte le stelle";

    //images = [];
    imageFiles = [];
    rating = 0;
    scrollControllerGallery = ScrollController();
    scrollControllerMainVertical = ScrollController();
    scrollControllerMainHorizontal = ScrollController();
    reviews = [];
    userReview = null;
    wordsHighlight={};
    loading = true;

    searchReviews(init: true);
  }

  @override
  Widget build(BuildContext context) {
    return
      loading ? SizedBox() : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "Recensioni",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            shape: const Border(
                bottom: BorderSide(
                    color: Colors.blue,
                    width: 8
                )
            ),
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () async { Navigator.pop(context); },
            ),
          ),
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0 , 10 , 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    controller: scrollControllerMainHorizontal,
                    child: SingleChildScrollView(
                      controller: scrollControllerMainHorizontal,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(65, 0 , 25, 35),
                            child: BookCover(book: ReviewsPage.book,proportion: 1.8, clickable: false),
                          ),
                          userReview==null ? createReview():
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Text(
                                  "La tua recensione:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2
                                    ))
                                ),
                                child: reviewWidget(userReview, proportion: 0.45, user: true),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.55,
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(
                                color: Colors.black54,
                                width: 2
                            )
                        ),
                        color: Colors.white,
                        //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                controller: searchController,
                                style: const TextStyle(
                                    color: Colors.black
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                                  labelStyle: const TextStyle(
                                      color: Colors.white
                                  ),
                                  hintText: 'Cerca per parola chiave...',
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
                                  onPressed: () => searchReviews(),
                                  padding: const EdgeInsets.fromLTRB(30,10,30,10),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  fillColor: Colors.indigo,
                                  child: const Text("Cerca",
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
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(65, 20, 0, 0),
                    child: Text(
                      "Filtra per:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 8, 0, 0),
                    child: DropdownButton<String>(
                      items: listStarFilter.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 6, 0), child: Text(value,style: const TextStyle(color: Colors.black, fontSize: 20))),
                        );}).toList(),
                      value: filterSelected,
                      icon: const Icon(Icons.star, color: Colors.amber,size: 30),
                      dropdownColor: Colors.white,
                      onChanged: (String newValue) => {
                        setState(() {
                          filterSelected = newValue;
                          searchReviews();
                        })
                      },
                    ),
                  ),
                  Column(
                    children: reviews.map((Review review) {
                      if(!review.equals(userReview)) {
                        return Column(children: [reviewWidget(review, proportion: 0.55, user: false), const SizedBox(height: 10,)],);
                      }
                      return const SizedBox();
                    }).toList(),

                  ),
                ],
              ),
            ),
          )
      );
  }

  Widget createReview(){
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            width: MediaQuery.of(context).size.width*0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hai letto questo libro? Lascia qui una recensione!\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                const Text(
                  "Valutazione complessiva:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: RatingBar(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.amber),
                        half: const Icon(Icons.star_half, color: Colors.amber,),
                        empty: const Icon(Icons.star_border_purple500_outlined, color: Colors.amber)
                    ),
                    itemCount: 5,
                    itemSize: 50.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (newRating) => updateRating(newRating),
                    updateOnDrag: true,
                  ),
                ),
                const Text(
                  "Titolo:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                    controller: titleController,
                    style: const TextStyle(
                        color: Colors.black
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          color: Colors.black54
                      ),
                      hintText: 'Scegli un titolo per la tua recensione..',
                      hintStyle: const TextStyle(
                          color: Colors.black54
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                    ),
                  ),
                ),
                const Text(
                  "Recensione:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                      controller: commentController,
                      maxLines: 7,
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: Colors.black54
                        ),
                        hintText: 'Scrivi qui la tua recensione..',
                        hintStyle: const TextStyle(
                            color: Colors.black54
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),

                      )
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text(
                  "Aggiungi una foto alla tua recensione!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Row(
                children: [
                  imageFiles.isEmpty ? const SizedBox.shrink() :
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.black))
                        ),
                        constraints: const BoxConstraints(maxHeight:200, maxWidth: 300),
                        child: Scrollbar(
                          controller: scrollControllerGallery,
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: ListView(
                            controller: scrollControllerGallery,
                            scrollDirection: Axis.vertical,
                            children: imageFiles.map((PlatformFile file) {
                              Image image = Image.memory(file.bytes);
                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${imageFiles.indexOf(file)+1}°",
                                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () => removeImage(file),
                                        icon: const Icon(Icons.delete_forever, color: Colors.red, size: 20),
                                        splashRadius: 20,
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                                        child: InkWell(
                                          onTap: () {
                                            showImageViewer(context,image.image,swipeDismissible: true,immersive: false);
                                          },
                                          child: image,
                                        )
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: DottedBorder(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(20),
                      strokeWidth: 2,
                      dashPattern: const [6,10],
                      radius: const Radius.circular(20),
                      borderType: BorderType.RRect,
                      child: IconButton(
                        onPressed: () => pickFile(),
                        icon: const Icon(Icons.add_a_photo_outlined, color: Colors.grey),
                        iconSize: 80,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 0, 0),
                  child: RawMaterialButton(
                      onPressed: () => saveReview(),
                      padding: const EdgeInsets.fromLTRB(30,10,30,10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      fillColor: Colors.indigo,
                      child: const Text("Salva",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Urbanist',
                            fontSize: 18
                        ),
                      )
                  )
              ),
            ],
          )
        ]
    );
  }

  Widget reviewWidget(Review review, {double proportion, bool user}){
    return Padding(
      padding: EdgeInsets.fromLTRB(user ? 5 : 65, 0, 0, 0),
      child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width*proportion,
          decoration: BoxDecoration(border:Border(bottom: BorderSide(color:  user ? Colors.transparent : Colors.black, width: 2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle_rounded, color: Colors.blueAccent, size: 38),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(("${review.user.name} ${review.user.surname}").toUpperCase(),
                      style: const TextStyle(color: Colors.black87, fontSize: 20, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) => const Icon(Icons.star,color: Colors.amber,),
                direction: Axis.horizontal,
                rating: review.starNumber*1.0,
                itemCount: 5,
                itemSize: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextHighlight(
                  text : review.title,
                  textStyle: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                  matchCase: false,
                  words: user ? {} : wordsHighlight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: TextHighlight(
                  text: review.comment,
                  textStyle: const TextStyle(color: Colors.black87, fontSize: 18),
                  matchCase: false,
                  words: user ? {} : wordsHighlight,
                ),
              ),
              const SizedBox(height: 8),
              review.images=="" ? const SizedBox() :
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: 7,
                spacing: 10,
                children: review.images.split(",").map((String key) {
                  Image image = Image.asset("assets/images/reviews/" + Uri.encodeFull(key), width: 200, height: 200);
                  return InkWell(
                    onTap: () {
                      showImageViewer(context,image.image,swipeDismissible: true,immersive: false);
                    },
                    child: image,
                  );
                }).toList(),
              ),
            ],
          )
      ),
    );
  }

  void searchReviews({bool init=false}){

    if(init){
      Model.sharedInstance.searchReviews(book: ReviewsPage.book).then((value) {
        setState(() {
          loading = false;
          reviews=value;
        });
      });
      Model.sharedInstance.searchReviews(book: ReviewsPage.book, user: LoginPage.userLogged).then((value) {
        if(value.isNotEmpty && LoginPage.userLogged!=null) {
          loading = false;
          userReview=value.first;
        }
      });
    }
    else {

      Model.sharedInstance.searchReviews(book: ReviewsPage.book, keyword: searchController.text, starNumber: listStarFilter.indexOf(filterSelected)-1).then((value) {
        setState(() {
          reviews=value;
          if(searchController.text=="") {
            wordsHighlight = {"PAROLA_NON_ESISTENTE" : HighlightedWord(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.yellow))};
          }
          else {
            wordsHighlight = {searchController.text : HighlightedWord(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.yellow))};
          }
        });
      });
    }

  }

  void removeImage(image){
    setState(() {
      imageFiles.remove(image);
    });
  }

  Future<void> pickFile() async {
    List<String> allowedExtension = ['png', 'jpg', 'jpeg','png'];
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: allowedExtension);
      for(PlatformFile file in result.files){
        if(!allowedExtension.contains(file.extension)) {
          showPopop(context, "Selezionato un file con il formato sbagliato!",title: "Errore!");
          return;
        }

      }
      setState(() {
        imageFiles.addAll(result.files);
      });
    } catch (e){
      print("------ Pick file annullato");
    }
  }

  void updateRating(newRating){
    setState(() {
      rating=newRating;
    });
  }

  void saveReview(){
    if(titleController.text.trim()=="" || commentController.text.trim()=="") {
      showPopop(context, "Campi recensione incompleti!");
      return;
    }

    String paths = "";
    for(PlatformFile file in imageFiles){
      paths=paths + "B"+ReviewsPage.book.id.toString()+"_U"+LoginPage.userLogged.id.toString()+"_"+file.name.replaceAll(" ", "");
      if(imageFiles.last!=file) {
        paths=paths+",";
      }
    }

    Review review = Review(
      user: LoginPage.userLogged,
      book: ReviewsPage.book,
      starNumber: rating.toInt(),
      title: titleController.text,
      comment: commentController.text,
      images: paths,
    );

    Model.sharedInstance.saveReview(review, imageFiles).then((value) {
      if(value !=  null){
        showPopop(context, "Salvataggio recensione eseguito!",title: "Attenzione:");
      }
      else{
        showPopop(context, "Impossibile salvare recensione!",title: "Errore:");
      }
      setState(() {
        userReview=value;
      });

    });
  }

}
