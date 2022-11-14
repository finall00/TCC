const openf= document.getElementById('openF');
const opencar= document.getElementById('opencar');
const modal= document.getElementById('modalCc');
const modalcargo= document.getElementById('modalcargo');
const close= document.getElementById('closee');
const closec= document.getElementById('closec');
const cancel= document.getElementById('cancel');


openf.addEventListener('click',() =>{
    modal.classList.add('showw');
});

opencar.addEventListener('click',() =>{
  modalcargo.classList.add('showw');
});


close.addEventListener('click',() =>{
    modal.classList.remove('showw');
});

closec.addEventListener('click',() =>{
  modalcargo.classList.remove('showw');
});

cancel.addEventListener('click',()=>{
    modal.classList.remove('show');
});


window.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
      modal.classList.remove('showw');
      modalcargo.classList.remove('showw');
    }
  });
 