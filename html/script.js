const modDefault = -1
const modCategoryDefault = -1
const mod = -1
const modCategory = -1
const paint = 50
const back = -2
const primary = -3
const secondary = -4
let painting = 0

function closeUI() {
  $('body').css('display', 'none')
  $.post("https://qb-customs/Close");
}

function choosenColor(data, colorType) {
  if (data === back) {
    $.post("https://qb-customs/BackToMain", JSON.stringify({})).then(resp => populateBodyItems(resp));
    let mod = modDefault
    let modCategory = modCategoryDefault
  } else {
    $.post("https://qb-customs/PaintPreview", JSON.stringify({color : data, colorType : colorType})).then(resp => colors(resp));
  }
}

function colors(resp) {
  $(".container-body").empty()
  console.log(resp.length)
  for (let adminOptions = 0; adminOptions < resp.length; adminOptions++){
    $(".container-body").append(`
      <button class="row-3"  onclick="choosenColor(${resp[adminOptions].id},${resp[adminOptions].colorType})">${resp[adminOptions].label}</button>
    `);
  };
}

function choosenType(data) {
  if (data === back) {
    $.post("https://qb-customs/BackToMain", JSON.stringify({})).then(resp => populateBodyItems(resp));
    let mod = modDefault
    let modCategory = modCategoryDefault
  } else {
    $.post("https://qb-customs/PaintCat", JSON.stringify({part : data})).then(resp => colors(resp));
  }
}

function colorType(resp) {
  $(".container-body").empty()
  console.log(resp.length)
  for (let adminOptions = 0; adminOptions < resp.length; adminOptions++){
    $(".container-body").append(`
      <button class="row-3"  onclick="choosenType(${resp[adminOptions].id})">${resp[adminOptions].label}</button>
    `);
  };
}

function choosenMod(data) {
  if (data === back) {
    $.post("https://qb-customs/BackToMain", JSON.stringify({})).then(resp => populateBodyItems(resp));
    let mod = modDefault
    let modCategory = modCategoryDefault
  } else {
    if (data === primary) {
      $.post("https://qb-customs/PaintCat", JSON.stringify({part : data})).then(resp => colorType(resp));
    } else if (data === secondary) {
      $.post("https://qb-customs/PaintCat", JSON.stringify({part : data})).then(resp => colorType(resp));
    } else { 
      let mod = data
      $.post("https://qb-customs/Preview", JSON.stringify({part : mod, type : modCategory}));
    }
  }
}

function newItems(resp) {
  $(".container-body").empty()
  for (let adminOptions = 0; adminOptions < resp.length; adminOptions++){
    $(".container-body").append(`
      <button class="row-3"  onclick="choosenMod(${resp[adminOptions].id})">${resp[adminOptions].label}</button>
    `);
  };
}

function chosenItem(type) {
  modType = type
  $.post("https://qb-customs/CheckOptions", JSON.stringify({id : type})).then(resp => newItems(resp));
}

function populateBodyItems(data) {
  $(".container-body").empty()
  for (let menuOptions = 0; menuOptions < data.length; menuOptions++){
    $(".container-body").append(`
      <button class="row-3" onclick="chosenItem(${data[menuOptions].id})">${data[menuOptions].label} <br /> Price: ${data[menuOptions].price}</button>
    `);
  };
}

function Purchase() {
  $.post("https://qb-customs/Purchase", JSON.stringify({part : mod, type : modType}));  
}

window.addEventListener("message", (event) => {
  if (event.data.action === "hide") {
    return closeUI();
  }
  $('body').css('display', 'flex')
  populateBodyItems(event.data.items)  
});

window.addEventListener("keydown", (event) => {
    switch(event.key) {
    case "Escape":
    case "Backspace":
        closeUI();
    break;
    }
});