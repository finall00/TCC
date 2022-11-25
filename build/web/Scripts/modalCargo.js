const cargoOpen = document.getElementById('opencargo');
const modalOpen = document.getElementById('modalcargo');
const cargoClose = document.getElementById('closecargo');

cargoOpen.addEventListener('click' , ()=>{
    modalOpen.classList.add("show");
})

cargoClose.addEventListener('click' , ()=>{
    modalOpen.classList.remove("show");
})

window.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
      modalOpen.classList.remove('show');
    }
  })