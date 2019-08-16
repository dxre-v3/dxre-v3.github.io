
//Get the data.json file

if (whichActive == "articles"){
	var dataFile = "https://dxre-v3.github.io/universal/jsons/articles.json";
}else if (whichActive == "data"){
	var dataFile = "https://dxre-v3.github.io/universal/jsons/data.json";
}else if (whichActive == "builds"){
	var dataFile = "https://dxre-v3.github.io/universal/jsons/builds.json";
}

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


function loadContent(jsonObj) {
	var contentData = jsonObj;

	// Get the flexbox element
	var flexContainer = document.getElementById("flex-container");
	// Create the description box
	var introduction = document.createElement("div");
	introduction.classList.add("description");
	// introduction.classList.add("fog");
	// Add the description text
	introduction.textContent = contentData.description;
	flexContainer.appendChild(introduction);

	// Store content as "boxes"
	var boxes = contentData.content;

	for (var i = 0; i < boxes.length; i++){
	// For each element in content, create a link: 
	var a = document.createElement("a");
	a.href = boxes[i].link;
	if (boxes[i].tab == "TRUE"){
		a.target = "_blank";
	}
	//
	// then create a box to place everything else in.
	var box = document.createElement("div");
	box.classList.add("box");
	// Create the div to hold photos in.
	var boxBackground = document.createElement("div");
	boxBackground.classList.add("box-background");
	//Create img to be the background:
	var img = document.createElement("img");
	img.src = boxes[i].picture; 
	boxBackground.appendChild(img);
	//Creat a text background:
	var textBackground = document.createElement("div");
	textBackground.classList.add("text-background");
	// Create a title section to hold the title:
	var title = document.createElement("div");
	title.classList.add("title");
	title.classList.add("abril");
	title.textContent = boxes[i].title;

	// Create a word section to hold the "quote":
	var quote = document.createElement("div");
	quote.classList.add("quote");
	quote.textContent = boxes[i].quote;

	//Append all boxes
	box.appendChild(boxBackground);
	box.appendChild(textBackground);
	box.appendChild(title);
	box.appendChild(quote);
	a.appendChild(box);
	flexContainer.appendChild(a);
}


}