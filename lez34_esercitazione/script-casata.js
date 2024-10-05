function stampaTabCasata(){
    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    let contenitore = "";
    for(let [idx, item] of Casate.entries()){
        contenitore +=
        `<tr>
            <td>${idx + 1}</td>
            <td>${item.nome}</td>
            <td>${item.descrizione}</td>
            <td><img class="imgBac" src="${item.logo}" alt="bacchetta"></td>
            <td>${contaBacchette(item.nome)} Bacchette</td>
            <td>
                <button type="button" class="btn btn-danger" onclick="elimina(${idx})">Elimina</button>
                <button type="button" class="btn btn-warning" onclick="modifica(${idx})">Modifica</button>
            </td>
        </tr>`
    }
    document.getElementById("corpo-tabella").innerHTML = contenitore;
}

function contaBacchette(){
    let olivanderElenco = localStorage.getItem("olivander") != null ? JSON.parse(localStorage.getItem("olivander")) : [];
    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    contatore = 0;

    for(let item of olivanderElenco){
        if(item.casata == Casate.nome)
            contatore ++;
    }
    return contatore;
}

function elimina(indice){
    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    Casate.splice(indice, 1);

    localStorage.setItem("casate", JSON.stringify(Casate));
    stampaTabCasata();
}

function modifica(indice){
    $("#modaleModifica").modal('show');
    $("#btn-salva").data('identif', indice);

    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    for(let [idx, item] of Casate.entries()){
        if(indice == idx){
            $("#in-nome").val(item.nome);
            $("#in-desc").val(item.descrizione);
            $("#in-logo").val(item.logo);
        }
    }
}

function salva(varBottone){

    let posizione = $(varBottone).data('identif');
    let nome = document.getElementById("in-nome").value;
    let desc = document.getElementById("in-desc").value;
    let logo = document.getElementById("in-logo").value;

    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    for(let [idx, item] of Casate.entries()){
        if(idx == posizione){
            item.nome = nome;
            item.descrizione = desc;
            item.logo = logo;

            localStorage.setItem("casate", JSON.stringify(Casate));
            stampaTabCasata();
            $("#modaleModifica").modal('hide');
            return;
        }
    }
}

stampaTabCasata();

setInterval(() => {
    stampaTabCasata();
}, 5000);