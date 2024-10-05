function stampaCasate(){
    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    let contenitore = "";
    for(let item of Casate){
        contenitore +=
        `<option value="${item.nome}">${item.nome}</option>`
    }
    document.getElementById("in-casa").innerHTML = contenitore;
}
window.onload = stampaCasate;   // Esegue la funzione al caricamento della pagina


function inserisciBac(){
    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];

    let codi = $("#in-codi").val();     //codice
    let mate = $("#in-mate").val();     //materiale
    let nucl = $("#in-nucl").val();     //nucleo
    let lung = $("#in-lung").val();     //lunghezza
    let resi = $("#in-resi").val();     //resistenza
    let mago = $("#in-mago").val();     //mago proprietario
    let casa = $("#in-casa").val();     //casata
    let foto = $("#in-foto").val();     //foto bacchetta

    if(codi == "" || mate == "" || nucl == "" || lung == "" || resi == "" || mago == "" || casa == "" || foto == ""){
        alert("Compila tutti i campi!");
        return;
    }

    let bacc = {
        codice: codi,
        materiale: mate,
        nucleo: nucl,
        lunghezza: lung,
        resistenza: resi,
        proprietario: mago,
        casata: casa,
        immagine: foto,
    }

    olivanderElenco.push(bacc);
    localStorage.setItem("olivander", JSON.stringify(olivanderElenco));

    document.getElementById("in-codi").value = "";
    document.getElementById("in-mate").value = "";
    document.getElementById("in-nucl").value = "";
    document.getElementById("in-lung").value = "";
    document.getElementById("in-resi").value = "";
    document.getElementById("in-mago").value = "";
    document.getElementById("in-casa").value = "";
    document.getElementById("in-foto").value = "";

   // location.href = "tab-bacchette.html";
}

setInterval(() =>{
    stampaCasate();
}, 30000);