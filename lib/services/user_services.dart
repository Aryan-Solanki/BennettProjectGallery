//for all firebase related services for user
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collectionStudent = 'studentDatabase';
  String collectionFaculty = 'facultyDatabase';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //create new user

  Future<void> createUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(collectionStudent).doc(id).set(values);
  }

  //update user data

  Future<void> updateUserData(String id, Map<String, dynamic> values) async {
    await _firestore.collection(collectionStudent).doc(id).update(values);
  }

  Future<void> updateProfData(String id, Map<String, dynamic> values) async {
    await _firestore.collection(collectionFaculty).doc(id).update(values);
  }

  Future<DocumentSnapshot> getUserById(String id) async {
    var result = await _firestore.collection(collectionStudent).doc(id).get();
    return result;
  }

  Future<DocumentSnapshot> getProfessorById(String id) async {
    var result = await _firestore.collection(collectionFaculty).doc(id).get();
    return result;
  }

  Future<String> getKeyPass(String id) async {
    var result = await _firestore.collection("keypass").doc(id).get();
    var x = result["pass"];
    return x;
  }

  Future<void> setKeyPass(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection("keypass").doc(id).set(values);
  }

  Future<void> registerComplaint(Map<String, dynamic> values) async {
    await _firestore.collection("helpcenter").add(values);
  }

  Future<void> updateKeyPass(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection("keypass").doc(id).update(values);
  }

//   Future<Map> isAvailableOnUserLocation(currentLocation, sellerId) async {
//     ProductServices _services = new ProductServices();
//     var sellingdistance = await _services.getSellerSellingDistance(sellerId);
//     var vendorlocation = await _services.getSellerLocation(sellerId);
//     var codAvailable = await _services.getSellerCODAvailable(sellerId);
//     List<Location> locations =
//         await locationFromAddress(currentLocation["pincode"].toString());
//     var codCharge = await _services.getSellerCODcost(sellerId);
//     var deliveryCost = await _services.getSellerDeliveryCharge(sellerId);
//     var deliveryCharge = deliveryCost["charge"].toDouble();
//     var freekms = deliveryCost["freeRadius"].toDouble();
//
//     var distanceInMeters = await Geolocator.distanceBetween(
//       locations[0].latitude,
//       locations[0].longitude,
//       vendorlocation.latitude,
//       vendorlocation.longitude,
//     );
//
//     bool deliverable = false;
//     double finalDeliveryCost = 0.0;
//
//     if ((distanceInMeters / 1000) < sellingdistance) {
//       deliverable = true;
//     } else {
//       deliverable = false;
//     }
//
//     if (distanceInMeters / 1000 > freekms) {
//       finalDeliveryCost = deliveryCharge;
//     } else {
//       finalDeliveryCost = 0.0;
//     }
//
//     var returnValue = {
//       "deliverable": deliverable,
//       "codAvailable": codAvailable,
//       "deliveryCost": finalDeliveryCost,
//       "codCharges": codCharge,
//       "freekms": freekms,
//       "distanceInMeters": distanceInMeters
//     };
//
//     return returnValue;
//   }
}
