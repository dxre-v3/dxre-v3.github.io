
//Get the data.json file
var requestURL = 'https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json';
//var dataFile = "data/data3.json";
var dataFile = "https://dxre-v3.github.io/jsons/superheros.json";
// var requestURL = 'articles.json';
//Read .Json File
var request = new XMLHttpRequest();
request.open('GET', dataFile);
request.responseType = 'json';
request.send();

//when data is pulled, run these funtions:
request.onload = function() {
  var data = request.response;
  loadContent(data);
  console.log("It worked??");
}

// "description": "It was so much easier to blame it on Them. It was bleakly depressing to think that They were Us. If it was Them, then nothing was anyone's fault. If it was us, what did that make Me? After all, I'm one of Us. I must be. I've certainly never thought of myself as one of Them. No one ever thinks of themselves as one of Them. We're always one of Us. It's Them that do the bad things",
// "content": [
//   {
//     "title": "Manga in the Museum",
//     "date": "5.25.2019",
//     "link": "https://medium.com/forty-two-by-pbm/manga-in-the-museum-b9a1558bfde",
//     "picture": "https://miro.medium.com/max/1500/1*3VRN_p5Eo2SpazVqFjrqzA.png",
//     "quote": "In 2015, over 100,000 visitors attended two small manga exhibits at the British Museum, prompting the museum to open the Citi exhibition Manga, a six-zone exhibit on manga, its history, and forms on May 23 in the Sainsbury Exhibition Gallery, the largest and most coveted exhibition space in the museum."
//   },


function loadContent(jsonObj) {
	var contentData = jsonObj;
	// Get the flexbox element
	var flexContainer = document.getElementById("flex-container");
	// Create the description box
	var introduction = document.createElement("div");
	introduction.classList.add("description");
	// Add the description text
	introduction.textContent = contentData.description;
	flexContainer.appendChild(introduction);

	// Store content as "boxes"
	var boxes = contentData.content;

	for (var i = 0; i < boxes.length; i++){
	// For each element in content, create a new info box
	var box = document.createElement("div");
	box.classList.add("box");
	// Create the div to hold photos in.
	var boxBackground = document.createElement("div");
	boxBackground.classList.add("box-background");
	//Create img to be the background
	var img = document.createElement("img");
	img.src = boxes[i].picture; 
	var a = document.createElement("a");
	var title = document.createElement("p");
	title.textContent = heroes[i].secretIdentity;
	
	a.href = heroes[i].link;
	a.target = "_blank";
	img.src = heroes[i].link; 
	console.log(heroes[i].link);
	box.classList.add("box");
	box.textContent = heroes[i].name;
	box.appendChild(title);
	box.appendChild(img);
	a.appendChild(box);
	flexContainer.appendChild(a);
	console.log(heroes[i].name);
}
// var para = document.createElement("p");
// var node = document.createTextNode("This is new.");
// para.appendChild(node);
}