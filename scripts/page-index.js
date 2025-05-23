var boxes;
console.log('loaded');
if(whichPage=='stories'){
  var textColor = 'light-text'
  var setColor = 'blue';
  var whichJson = '/jsons/stories.json';
}else if (whichPage=='data') {
  var setColor = 'bluegreen';
  var textColor = 'dark-text'
  var whichJson = '/jsons/data.json';
}else{
  var setColor = 'lightgreen';
  var textColor = 'dark-text'
  var whichJson = '/jsons/code.json';
}



function createContent(d){
  console.log(d.content[1])
  d.content.forEach(p => {
    if(p.tab) {
      newTab = "_blank"
      // console.log(`ITEM: ${p.title} \n TAB: ${p.tab} \n CLAIM: true`);
    }else{
      newTab = "_self"
      // console.log(`ITEM: ${p.title} \n TAB: ${p.tab} \n CLAIM: false`);
    }
    imageStyle = p.istyle ? p.istyle : "";
    $('article')
      .append($(`<a>`)
                  // .attr('class', "hxl")
                  .attr('href', p.link)
                  .attr('target', newTab)
                  .attr('class', `item ${setColor}-background`)
                  // .text("words")
                  .append($(`<div>`)
                              .attr('class', `color-bar  hl`)
                            )
                  .append($(`<div>`)
                              .attr('class', 'content')
                              .append($(`<div>`)
                                        .attr('class', 'image-box')
                                        .append($(`<img>`).attr('class', `item-image ${imageStyle}`).attr('src', p.picture)))
                              .append($(`<div>`)
                                        .attr('class', 'item-description')
                                        .append($(`<h3>`).attr('class', 'item-title').text(p.title))
                                        .append($(`<p>`).attr('class', `item-info ${textColor}`).text(p.quote))
                              )
                          )
              );
  });


  };
  $.getJSON(whichJson, function(d){
    createContent(d);
  })
