function stampaTabBac(){
    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];

    let contenitore = "";
    for(let [idx, item] of olivanderElenco.entries()){
        contenitore +=
        `<tr>
            <td>${idx + 1}</td>
            <td>${item.codice}</td>
            <td>${item.materiale}</td>
            <td>${item.nucleo}</td>
            <td>${item.lunghezza} cm</td>
            <td>${item.resistenza}</td>
            <td>${item.proprietario}</td>
            <td>${item.casata}</td>
            <td><img class="imgBac" src="${item.immagine}" alt="bacchetta"></td>
            <td>
                <button type="button" class="btn btn-danger" onclick="elimina(${idx})">Elimina</button>
                <button type="button" class="btn btn-warning" onclick="modifica(${idx})">Modifica</button>
            </td>
        </tr>`
    }
    document.getElementById("corpo-tabella").innerHTML = contenitore;
}

function elimina(indice){
    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];

    olivanderElenco.splice(indice, 1);

    localStorage.setItem("olivander", JSON.stringify(olivanderElenco));
    stampaTabBac();
}

function modifica(indice){
    $("#modaleModifica").modal('show');
    $("#btn-salva").data('identif', indice);

    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];

    for(let [idx, item] of olivanderElenco.entries()){
        if(indice == idx){
            $("#in-codi").val(item.codice);
            $("#in-mate").val(item.materiale);
            $("#in-nucl").val(item.nucleo);
            $("#in-lung").val(item.lunghezza);
            $("#in-resi").val(item.resistenza);
            $("#in-mago").val(item.proprietario);
            $("#in-casa").val(item.casata);
            $("#in-foto").val(item.immagine);
        }
    }
}

function salva(varBottone){

    let posizione = $(varBottone).data('identif');
    let codi = document.getElementById("in-codi").value;
    let mate = document.getElementById("in-mate").value;
    let nucl = document.getElementById("in-nucl").value;
    let lung = document.getElementById("in-lung").value;
    let resi = document.getElementById("in-resi").value;
    let mago = document.getElementById("in-mago").value;
    let casa = document.getElementById("in-casa").value;
    let foto = document.getElementById("in-foto").value;

    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];

    for(let [idx, item] of olivanderElenco.entries()){
        if(idx == posizione){
            item.codice = codi;
            item.materiale = mate;
            item.nucleo = nucl;
            item.lunghezza= lung;
            item.resistenza = resi;
            item.proprietario = mago;
            item.casata = casa;
            item.immagine = foto;

            localStorage.setItem("olivander", JSON.stringify(olivanderElenco));
            stampaTabBac();
            $("#modaleModifica").modal('hide');
            return;
        }
    }
}

stampaTabBac();

// setInterval(() => {
//     stampaTabella();
// }, 5000);