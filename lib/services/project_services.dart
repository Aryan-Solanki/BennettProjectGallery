import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectServices {
  CollectionReference studentData =
      FirebaseFirestore.instance.collection('project');

  DocumentReference mainscreen = FirebaseFirestore.instance
      .collection('ProjectCategories')
      .doc("Categories");

  CollectionReference professorCol =
      FirebaseFirestore.instance.collection('facultyDatabase');

  CollectionReference studentCol =
      FirebaseFirestore.instance.collection('studentDatabase');

  Future<DocumentReference> getProjectbyId(String id) async {
    return await FirebaseFirestore.instance.collection('project').doc(id);
  }

  Future<void> updateProjectData(String id, Map<String, dynamic> values) async {
    await FirebaseFirestore.instance
        .collection("project")
        .doc(id)
        .update(values);
  }

  Future<void> incrementViewCount(String id) async {
    await FirebaseFirestore.instance
        .collection("project")
        .doc(id)
        .update({"viewCount": FieldValue.increment(1)});
  }
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
// }
