let mod = -1
let modType = -1

function closeUI() {
  $('body').css('display', 'none')
  $.post("https://qb-customs/Close");
}

function choosenMod(data) {
  if (data === -2) {
    $.post("https://qb-customs/BackToMain", JSON.stringify({})).then(resp => populateBodyItems(resp));
    mod = -1
    modType = -1
  } else {
    mod = data    
    $.post("https://qb-customs/Preview", JSON.stringify({part : mod, type : modType}));
  }
}

function newItems(resp){
  $(".container-body").empty()
  for (let adminOptions = 0; adminOptions < resp.length; adminOptions++){
    $(".container-body").append(`
      <button class="row-3"  onclick="choosenMod(${resp[adminOptions].id})">${resp[adminOptions].label}</button>
    `);
  };
}

function choosenItem(type) {
  modType = type
  $.post("https://qb-customs/CheckOptions", JSON.stringify({id : type})).then(resp => newItems(resp));
}

function populateBodyItems(data) {
  $(".container-body").empty()
  for (let menuOptions = 0; menuOptions < data.length; menuOptions++){
    $(".container-body").append(`
      <button class="row-3" onclick="choosenItem(${data[menuOptions].id})">${data[menuOptions].label} <br /> Price: ${data[menuOptions].price}</button>
    `);
  };
}

function Purchase() {
  $.post("https://qb-customs/Purchase", JSON.stringify({part : mod, type : modType}));  
}

window.addEventListener("message", (event) => {
    eventData = event.data;
    if (eventData.action == "show") {
        $('body').css('display', 'flex')
        populateBodyItems(eventData.items)
    } else if (eventData.action == "hide") {
        closeUI();
    }
});

window.addEventListener("keydown", (event) => {
    switch(event.key) {
    case "Escape":
    case "Backspace":
        closeUI();
    break;
    }
});