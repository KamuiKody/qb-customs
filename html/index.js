$(() => {

    const exitNui = () => {
        $('body').css('display', 'none')
        $.post("https://qb-customs/Close")
    }

    const Purchase = bool => {
       $.post("https://qb-customs/ButtonPressed", bool)
    }

    const chooseItem = index => {
        $.post("https://qb-customs/CategoryChoosen", index)
    }

    const populateMenu = data => {
        $(".container-body").empty()
        data.forEach(element, index => {
            $(".container-body").append(`
                <button class="row-3"  onclick="chooseItem(${index})">${element.label}</button>
            `);
        });
    }

    $(window).on("message", event => {
        if (event.data.init) {
            $('body').css('display', 'flex')
        }
        populateMenu(event.data.menu)
    });

});