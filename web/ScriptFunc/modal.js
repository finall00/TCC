const open= document.getElementById('open');
const modal= document.getElementById('modalC');
const close= document.getElementById('close');
const cancel= document.getElementById('cancel');





open.addEventListener('click',()=>{
    modal.classList.add('show');
});


close.addEventListener('click',()=>{
    modal.classList.remove('show');
});


cancel.addEventListener('click',()=>{
    modal.classList.remove('show');
});


//fechar com o esc
window.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
      modal.classList.remove('show');
    }
  });

  