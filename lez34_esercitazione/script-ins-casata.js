function inserisciCas(){
    let Casate = localStorage.getItem("casate") != null ? JSON.parse(localStorage.getItem("casate")) : [];

    let nome = $("#in-nome").val();     //nome casata
    let desc = $("#in-desc").val();     //descrizione
    let logo = $("#in-logo").val();     //logo

    if(nome == "" || desc == "" || logo == ""){
        alert("Compila tutti i campi!");
        return;
    }

    let casa = {
        nome: nome,
        descrizione: desc,
        logo: logo,
    }

    Casate.push(casa);
    localStorage.setItem("casate", JSON.stringify(Casate));

    document.getElementById("in-nome").value = "";
    document.getElementById("in-desc").value = "";
    document.getElementById("in-logo").value = "";

   // location.href = "tab-bacchette.html";
    
}
