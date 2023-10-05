
const openMenu = document.querySelector('.openMenu');
const modal = document.querySelector('.modal');
const closeMenu = document.querySelector('.close');
// const closeMenu = document.querySelector('.mobile-nav');

openMenu.addEventListener('click' , openModal);
closeMenu.addEventListener('click', closeModal);
window.addEventListener('.click', windowClose);

function openModal(){
    modal.style.display = 'block';
    openMenu.style.display = 'none';
    closeMenu.style.display = 'block';
    
}

function closeModal(){
    modal.style.display = 'none';
    closeMenu.style.display = 'none';
    openMenu.style.display = 'block';
}

function windowClose(e){
    if(e.target == modal){
        closeModal()
    }
}
