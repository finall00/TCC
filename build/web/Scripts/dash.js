
//link ativo
const activePage = window.location.pathname;
const activeLinks = document.querySelectorAll('nav a').
forEach(link => {
    if(link.href.includes(`${activePage}`)){
        link.classList.add('active');
    }
});

