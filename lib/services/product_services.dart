import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  CollectionReference studentData =
      FirebaseFirestore.instance.collection('studentData');
  DocumentReference mainscreen = FirebaseFirestore.instance
      .collection('mainscreen')
      .doc("FPqix1bIAibs46FOA5zV");

  DocumentReference initialChecks = FirebaseFirestore.instance
      .collection('Maintainance')
      .doc("JmEmXY3ZoYp71gznVp5I");

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(id) async {
    var document =
        await FirebaseFirestore.instance.collection("studentData").doc(id).get();
    return document;
  }


  //
  // Product getProductSeeMore(document) {
  //   var exists = document.exists;
  //   if (exists) {
  //     var listVarientraw = document["variant"];
  //     List<Varient> listVarient = [];
  //     for (var vari in listVarientraw) {
  //       listVarient.add(new Varient(
  //           default_product: vari["default"],
  //           isOnSale: vari["onSale"]["isOnSale"],
  //           comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
  //           discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
  //           price: vari["price"].toDouble(),
  //           inStock: vari["stock"]["inStock"],
  //           qty: vari["stock"]["qty"].toDouble(),
  //           title: vari["variantDetails"]["title"],
  //           id: vari["id"],
  //           images: vari["variantDetails"]["images"]));
  //     }
  //     return Product(
  //         id: document["productId"],
  //         brandname: document["brand"],
  //         varients: listVarient,
  //         title: document["title"],
  //         detail: document["detail"],
  //         rating: document["rating"],
  //         sellerId: document["sellerId"],
  //         isFavourite: true,
  //         isPopular: true,
  //         tax: document["tax"].toDouble(),
  //         youmayalsolike: document["youMayAlsoLike"]);
  //   }
  //   return null;
  // }
  //
  // Product getProductSearchPage(document) {
  //   var exists = true;
  //   if (exists) {
  //     var listVarientraw = document["variant"];
  //     List<Varient> listVarient = [];
  //     for (var vari in listVarientraw) {
  //       listVarient.add(new Varient(
  //           default_product: vari["default"],
  //           isOnSale: vari["onSale"]["isOnSale"],
  //           comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
  //           discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
  //           price: vari["price"].toDouble(),
  //           inStock: vari["stock"]["inStock"],
  //           qty: vari["stock"]["qty"].toDouble(),
  //           title: vari["variantDetails"]["title"],
  //           id: vari["id"],
  //           images: vari["variantDetails"]["images"]));
  //     }
  //     return Product(
  //         id: document["productId"],
  //         brandname: document["brand"],
  //         varients: listVarient,
  //         title: document["title"],
  //         detail: document["detail"],
  //         rating: document["rating"],
  //         sellerId: document["sellerId"],
  //         isFavourite: true,
  //         isPopular: true,
  //         tax: document["tax"].toDouble(),
  //         youmayalsolike: document["youMayAlsoLike"]);
  //   }
  //   return null;
  // }
  //
  // Future<Product> getProduct(productId) async {
  //   ProductServices _services = ProductServices();
  //   var document = await _services.products.doc(productId).get();
  //   var exists = document.exists;
  //   if (exists) {
  //     var listVarientraw = document["variant"];
  //     List<Varient> listVarient = [];
  //     for (var vari in listVarientraw) {
  //       listVarient.add(new Varient(
  //           default_product: vari["default"],
  //           isOnSale: vari["onSale"]["isOnSale"],
  //           comparedPrice: vari["onSale"]["comparedPrice"].toDouble(),
  //           discountPercentage: vari["onSale"]["discountPercentage"].toDouble(),
  //           price: vari["price"].toDouble(),
  //           inStock: vari["stock"]["inStock"],
  //           qty: vari["stock"]["qty"].toDouble(),
  //           title: vari["variantDetails"]["title"],
  //           id: vari["id"],
  //           images: vari["variantDetails"]["images"]));
  //     }
  //     return Product(
  //         id: document["productId"],
  //         brandname: document["brand"],
  //         varients: listVarient,
  //         title: document["title"],
  //         detail: document["detail"],
  //         rating: document["rating"],
  //         sellerId: document["sellerId"],
  //         isFavourite: true,
  //         isPopular: true,
  //         tax: document["tax"].toDouble(),
  //         youmayalsolike: document["youMayAlsoLike"]);
  //   }
  //   return null;
  // }
}
