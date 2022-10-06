//menu botão
const menuSide = document.querySelector('aside');
const meunBtn = document.querySelector('#menu-btn');
const closeBtn = document.querySelector('#btn-close');

meunBtn.addEventListener('click', () =>{
    menuSide.style.display='block';
});

closeBtn.addEventListener('click', () =>{
    menuSide.style.display='none';
});

//thema dark

const themeToggler = document.querySelector(".toogler");

themeToggler.addEventListener('click', () =>{
    document.body.classList.toggle('dark-theme-var');

    themeToggler.querySelector('i:nth-child(1)').classList.toggler('active');
    themeToggler.querySelector('i:nth-child(2)').classList.toggler('active');
});

//link ativo
const activePage = window.location.pathname;
const activeLinks = document.querySelectorAll('nav a').
forEach(link => {
    if(link.href.includes(`${activePage}`)){
        link.classList.add('active');
    }
});

