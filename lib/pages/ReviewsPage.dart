
import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend_sdcc_flutter/widget/BookCover.dart';
import 'package:frontend_sdcc_flutter/widget/BorderedIcon.dart';
import 'package:galleryimage/galleryimage.dart';

import '../widget/Review.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key key}) : super(key: key);

  static String bookTitle = "IT";

  @override
  State<StatefulWidget> createState() {
    return ReviewsPageState();
  }
}

class ReviewsPageState extends State<ReviewsPage> {
  TextEditingController textEditingController;
  List<String> listStarFilter;
  String filterSelected;
  bool notReviewed;
  List<String> imageURLs;
  List<Image> images;
  TextEditingController titleController;
  double rating;
  ScrollController scrollControllerGallery;
  ScrollController scrollControllerMainHorizontal;
  ScrollController scrollControllerMainVertical;



  @override
  void initState(){
    super.initState();
    textEditingController = TextEditingController();
    titleController = TextEditingController();
    listStarFilter = ["Tutte le stelle", "Solo 1 stella", "Solo 2 stelle", "Solo 3 stelle" , "Solo 4 stelle", "Solo 5 stelle"];
    filterSelected = "Tutte le stelle";
    notReviewed=true;
    images = [];
    scrollControllerGallery = ScrollController();
    scrollControllerMainVertical = ScrollController();
    scrollControllerMainHorizontal = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Reviews",
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
        body: Scrollbar(
          controller: scrollControllerMainVertical,
          child: SingleChildScrollView(
            controller: scrollControllerMainVertical,
            padding: const EdgeInsets.fromLTRB(0 , 10 , 0, 0),
            child: Column(
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(65, 0 , 25, 35),
                          child: BookCover(title: ReviewsPage.bookTitle,proportion: 1.8, clickable: false),
                        ),
                        notReviewed ? createReview(): Review(),
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
                              controller: textEditingController,
                              style: const TextStyle(
                                  color: Colors.black
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                                labelStyle: const TextStyle(
                                    color: Colors.white
                                ),
                                hintText: 'Search review by keyword...',
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
                                onPressed: null,
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
                  padding: EdgeInsets.fromLTRB(65, 8, 0, 0),
                  child: DropdownButton<String>(
                    items: listStarFilter.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(child: Text(value,style: TextStyle(color: Colors.black, fontSize: 20)), padding: EdgeInsets.fromLTRB(0, 0, 6, 0)),
                      );}).toList(),
                    value: filterSelected,
                    icon: Icon(Icons.star, color: Colors.amber,size: 30),
                    dropdownColor: Colors.white,
                    onChanged: (String newValue) => {
                      setState(() {
                        filterSelected = newValue;
                      })
                    },
                  ),
                )
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
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(Icons.star_half, color: Colors.amber,),
                        empty: Icon(Icons.star_border_purple500_outlined, color: Colors.amber)
                    ),
                    itemCount: 5,
                    itemSize: 50.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (newRating) => updateRating(newRating),
                    updateOnDrag: true,
                  ),
                ),
                const Text(
                  "Title:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                      hintText: 'Choose a title for your review..',
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
                  "Review:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TextFormField(
                      controller: titleController,
                      maxLines: 7,
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: Colors.black54
                        ),
                        hintText: 'Write your review here..',
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
                  images.isEmpty ? const SizedBox.shrink() :
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.black))
                        ),
                        constraints: BoxConstraints(maxHeight:200, maxWidth: 300),
                        child: Scrollbar(
                          controller: scrollControllerGallery,
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: ListView(
                            controller: scrollControllerGallery,
                            scrollDirection: Axis.vertical,
                            children: images.map((Image image) {
                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${images.indexOf(image)+1}°",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () => removeImage(image),
                                        icon: Icon(Icons.delete_forever, color: Colors.red, size: 20),
                                        splashRadius: 20,
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: DottedBorder(
                      color: Colors.grey,
                      padding: EdgeInsets.all(20),
                      strokeWidth: 2,
                      dashPattern: [6,10],
                      radius: Radius.circular(20),
                      borderType: BorderType.RRect,
                      child: IconButton(
                        onPressed: () => pickFile(),
                        icon: Icon(Icons.add_a_photo_outlined, color: Colors.grey),
                        iconSize: 80,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 50, 0, 0),
                  child: RawMaterialButton(
                      onPressed: null,
                      padding: const EdgeInsets.fromLTRB(30,10,30,10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      fillColor: Colors.indigo,
                      child: const Text("Save",
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

  void removeImage(image){
    setState(() {
      images.remove(image);
    });
  }

  Future<void> pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg','png']);
    List<Image> files = result.files.map((file) => Image.memory(file.bytes)).toList();
    setState(() {
      images.addAll(files);
    });
  }

  void updateRating(newRating){
    setState(() {
      rating=newRating;
    });
  }

}
