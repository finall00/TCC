const openf= document.getElementById('openF');
const opencar= document.getElementById('opencar');
const modal= document.getElementById('modalCc');
const modalcarcgo= document.getElementById('modalcargo');
const close= document.getElementById('closee');
const closec= document.getElementById('closec');
const cancel= document.getElementById('cancel');


openf.addEventListener('click',() =>{
    modal.classList.add('showw');
});

opencar.addEventListener('click',() =>{
  modalcarcgo.classList.add('showw');
});


close.addEventListener('click',() =>{
    modal.classList.remove('showw');
});

closec.addEventListener('click',() =>{
  modalcarcgo.classList.remove('showw');
});


window.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
      modal.classList.remove('showw');
      modalcarcgo.classList.remove('showw');
    }
  });
 