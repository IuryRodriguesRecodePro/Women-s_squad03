document.addEventListener("DOMContentLoaded", function () {
    const menuButton = document.getElementById("menu-button");
    const menuIcon = document.getElementById("menu-icon");

    menuButton.addEventListener("click", function () {
        if (menuIcon.classList.contains("fa-bars")) {
            menuIcon.classList.remove("fa-bars");
            menuIcon.classList.add("fa-times");
        } else {
            menuIcon.classList.remove("fa-times");
            menuIcon.classList.add("fa-bars");
        }
    });
});


async function carregarFormulario(url, seletorDestino) {
    try {

        const resposta = await fetch(url);
        if (!resposta.ok) {
            throw new Error("Erro ao carregar o formulário.");
        }

        const html = await resposta.text();

        const parser = new DOMParser();
        const doc = parser.parseFromString(html, "text/html");

        const formulario = doc.querySelector("form");

        if (formulario) {
            document.querySelector(seletorDestino).innerHTML = formulario.outerHTML;
        } else {
            console.error("Nenhum formulário encontrado na página.");
        }
    } catch (erro) {
        console.error("Erro:", erro.message);
    }
}

carregarFormulario("outra_pagina.html", "#cadastro.html");
