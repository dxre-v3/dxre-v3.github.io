   // $.getJSON('articles.json', function(data) {

   //   });

//    function loadJSON(callback) {   

//     var xobj = new XMLHttpRequest();
//         xobj.overrideMimeType("application/json");
//     xobj.open('GET', 'articles.json', true); // Replace 'my_data' with the path to your file
//     xobj.onreadystatechange = function () {
//           if (xobj.readyState == 4 && xobj.status == "200") {
//             // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
//             callback(xobj.responseText);
//           }
//     };
//     xobj.send(null);  
//  }

//  function init() {
//  loadJSON(function(response) {
//   // Parse JSON string into object
//     var actual_JSON = JSON.parse(response);
//  });
// }

// for (var i = .length - 1; i >= 0; i--) {
// 	Things[i]
// }


//Get the data.json file
var requestURL = 'https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json';
//var dataFile = "data/data3.json";
//var dataFile = "articles.json";
// var requestURL = 'articles.json';
//Read .Json File
var request = new XMLHttpRequest();
request.open('GET', requestURL);
request.responseType = 'json';
request.send();

//when data is pulled, run these funtions:
request.onload = function() {
  var data = request.response;
  // showData(bData);
  console.log("It worked??");
}