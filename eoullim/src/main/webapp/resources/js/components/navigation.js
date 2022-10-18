const navList = document.querySelectorAll('#navList li');
const infoBoard = document.querySelector('#infoBoard');
const infoComment = document.querySelector('#infoComment');

navList.forEach( (list) => {
    list.addEventListener('mouseover', () => {  //  mouseover 시 hover 클래스 추가
        list.classList.add('nav__hover');
    });
});
navList.forEach( (list) => {
    list.addEventListener('mouseout', () => {   //  mouseout 시 hover 클래스 삭제
        list.classList.remove('nav__hover');
    });
});
navList.forEach( (list) => {
    list.addEventListener('click', () => {   //  click
        navList.forEach( (chk) => {
            if(chk.className.includes('nav__selected')) {
                chk.classList.remove('nav__selected');
            }
        });
        list.classList.add('nav__selected');
        if(list.getAttribute('id') === 'writeBoard') {
            infoBoard.classList.remove('hidden');
            infoComment.classList.add('hidden');
        } else {
            infoComment.classList.remove('hidden');
            infoBoard.classList.add('hidden');
        }
    });
});