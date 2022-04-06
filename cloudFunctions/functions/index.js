const functions = require('firebase-functions');
const admin = require('firebase-admin');
const algoliasearch = require('algoliasearch');

const ALGOLIA_APP_ID = "3P35AZC2QF";
const ALGOLIA_ADMIN_KEY = "d357ec7700ed0ad24fcdb4a8cee637bb";
const ALGOLIA_INDEX_NAME = "project";

admin.initializeApp(functions.config().firebase);

// exports.createPost = functions.firestore
//     .document('products/{productId}')
//     .onCreate( async (snap, context) => {
//         const newValue = snap.data();
//         newValue.objectID = snap.id;
       
//         var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

//         var index = client.initIndex(ALGOLIA_INDEX_NAME);
//         index.saveObject(newValue);
//         console.log("Finished");
//     });

// exports.updatePost = functions.firestore
//     .document('products/{productId}')
//     .onUpdate( async (snap, context) => {
//         const afterUpdate = snap.after.data();
//         afterUpdate.objectID =  snap.after.id;

//         var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
        
//         var index = client.initIndex(ALGOLIA_INDEX_NAME);
//         index.saveObject(afterUpdate);
//     });

exports.deletePost = functions.firestore
    .document('projects/{projectId}')
    .onDelete( async (snap, context) => {
        const oldID = snap.id;
        var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);
        var index = client.initIndex(ALGOLIA_INDEX_NAME);
        index.deleteObject(oldID);
    });

// exports.addproductsFirestoreDataToAlgolia = functions.https.onRequest((req, res) => {
//     var productArray = [];
//     //Get all the documents from the Firestore collection called    //products
//         admin.firestore().collection("products").get().then((docs) => {
//         //Get all the data from each document
//         docs.forEach((doc) => {
//         let product = doc.data();
//         //As per the algolia rules, each object needs to have a key                        //called objectID (AS IS)
//         //If you do not set this, algolia will set a random id
//         product.objectID = doc.id;
//         productArray.push(product);
//         })
//     return productIndex.saveObjects(productArray).then(() => {
//     console.log('Documents imported into Algolia');
//     return true;
//     }).catch(error => {
//     console.error('Error when importing documents into Algolia', error);
//     return true;
//     });
//     }).catch((error) => {
//     console.log('Error getting the products collection', error)
//     })
//     })

// exports.sendCollectionToAlgolia = functions.runWith(runtimeOpts).https.onRequest(async (req, res) => {

//     admin.firestore().collection("products").get().then((docs) => {
    
//         let _sessions = [];
    
//         docs.forEach((doc) => {
    
//             let session = doc.data();
//             const childKey = doc.id;
//             childData.objectID = childKey;
//             console.log("PUSHING TO SESSIONS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", childData)
//             _sessions.push(session);
            
//         })
//         return _sessions;
//     }).then((_sessions) => {
//         console.log("ALL SESSIONS", _sessions.length, _sessions.slice(0, 5));
    
//         index.saveObjects(_sessions)
//         .then(() => {
//             console.log('Contacts imported into Algolia');
//         })
//         .catch(error => {
//             console.error('Error when importing contact into Algolia', error);
//             process.exit(1);
//         });
//     })
    
//     });
