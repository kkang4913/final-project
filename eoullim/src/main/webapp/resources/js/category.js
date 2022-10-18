
// 변수 선언
const items = document.querySelectorAll(".col-4 .icon--circle__cate");

// hover 기능
items.forEach( (item) => {
    item.addEventListener('mouseover', function(){  //  mouseover 시 hover 클래스 추가
        item.classList.add('hoverIcon');
    });
});
items.forEach( (item) => {
    item.addEventListener('mouseout', function(){   //  mouseout 시 hover 클래스 삭제
        item.classList.remove('hoverIcon');
    });
});

// 관심사 선택 기능
items.forEach( (item) => {
    item.addEventListener('click', function (){
        const childs = item.children;
        let chk = true;

        for(child of childs) {  // 이미 선택되었는지 확인
            if(child.className == 'check-badge'){
                var sel = child;
                chk = false;
            }
        };
        if(chk){    //  선택이 안되었으면 추가
            if(selectCntCheck() < 3) {  // 선택된 갯수 확인
                const span = document.createElement('span');
                const i = document.createElement('i');
                span.classList.add('check-badge');
                i.classList.add('fa-solid', 'fa-check');
                span.appendChild(i);
                item.appendChild(span);
                item.classList.add('selected');
            } else {
                alert('관심사는 최대 3개까지만 선택 할 수 있습니다.');
            }
        } else {    //  선택이 되어있으면 제거
            sel.parentNode.removeChild(sel);
            item.classList.remove('selected');
        }
    });
});

// 선택된 관심사 갯수 확인
function selectCntCheck() {
    const cnt = document.querySelectorAll('.check-badge').length;
    return cnt;
}

//  개인정보창 관심사 변경
function modifyCategory(selectDatas) {  // DB 수정 확인 후 작동 하도록
    const cate = document.querySelector('#cate');
    const before = document.querySelectorAll('#cate i');

    for(const data of before) {
        cate.removeChild(data);
    }

    for(const data of selectDatas){
        const i = document.createElement('i');
        const classList = 'icon--circle icon--circle__cate icon--circle__cate--small ' + data;

        i.setAttribute('class', classList);
        cate.insertBefore(i, cate.firstChild);
    }
}

//  개인정보창 관심사 변경 데이터 전송
function sendCategory() {
    if(selectCntCheck() < 1) {  // 관심사 미체크시 알람
        return alert('관심사는 적어도 하나 이상 선택해야합니다.');
    }

    let selectDatas = [];

    for(const data of document.querySelectorAll('.check-badge')) {
        let selectData = data.previousElementSibling.classList.value;
        selectDatas.push(selectData);
    }
    opener.modifyCategory(selectDatas);
    window.close();
}

// 데이터 전송후 db저장
function submitCategory() {
    let selectDatas = [];

    for(const data of document.querySelectorAll('.check-badge')) {
        let selectData = {};
        selectData = { 'id' : data.parentElement.getAttribute('id') };
        selectDatas.push(selectData);
    }

    $.ajax({
        type: "post",
        url: "ajax/cate",
        traditional: true,
        contentType: "application/json",
        data: JSON.stringify(selectDatas),
        dataType: "json",
        success: (msg) => {
            if(msg.res) {
                sendCategory();
            } else {
                alert("변경에 실패하였습니다.");
            }
        },
        error: () => {
            alert("변경에 실패하였습니다.");
        }

    });
}

// categoryId와 관심사 매칭
function matchCate(cateId) {
    let className = "";
    switch (cateId) {
        case '1' :
            className = "fa-solid fa-suitcase ";
            break;
        case '2' :
            className = "fa-solid fa-person-swimming ";
            break;
        case '3' :
            className = "fa-solid fa-book ";
            break;
        case '4' :
            className = "fa-solid fa-language ";
            break;
        case '5' :
            className = "fa-solid fa-masks-theater ";
            break;
        case '6' :
            className = "fa-solid fa-music ";
            break;
        case '7' :
            className = "fa-solid fa-palette ";
            break;
        case '8' :
            className = "fa-solid fa-user-ninja ";
            break;
        case '9' :
            className = "fa-solid fa-hands ";
            break;
        case '10' :
            className = "fa-solid fa-handshake-simple ";
            break;
        case '11' :
            className = "fa-solid fa-car ";
            break;
        case '12' :
            className = "fa-brands fa-youtube ";
            break;
        case '13' :
            className = "fa-solid fa-baseball-bat-ball ";
            break;
        case '14' :
            className = "fa-solid fa-gamepad ";
            break;
        case '15' :
            className = "fa-solid fa-utensils ";
            break;
        case '16' :
            className = "fa-solid fa-dog ";
            break;
        case '17' :
            className = "fa-solid fa-hand-holding-heart ";
            break;
        case '18' :
            className = "fa-solid fa-paper-plane ";
            break;
    }
    return className;
}

// 개인정보창 관심사 보여주기
function printCate(cateList) {
    const cate = document.querySelector('#cate');
    let arr = [];
    arr = cateList.split(',');

    for(const id of arr) {
        let className = matchCate(id);

        const i = document.createElement('i');
        const classList = className + 'icon--circle icon--circle__cate'
        i.setAttribute('class', classList);

        cate.insertBefore(i, cate.firstChild);
    }
}

function printSmallCate(cateList) {
    const cate = document.querySelector('#cate');
    let arr = [];
    arr = cateList.split(',');

    for(const id of arr) {
        let className = matchCate(id);

        const i = document.createElement('i');
        const classList = className + 'icon--circle icon--circle__cate icon--circle__cate--small'
        i.setAttribute('class', classList);

        cate.insertBefore(i, cate.firstChild);
    }
}

// 관심사 전체 출력
// function printAllCate(cateId) {
//     const cate = document.querySelector('#cate');
//     let allCateList = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18";
//     let arr = [];
//     let cateArr = [];
//     arr = allCateList.split(',');
//     console.log(arr);
//     cateArr = cateId.split(',');
//
//     for(const id of arr) {
//         let className = matchCate(id);
//         for(const selId of cateArr){
//             if(id == selId){
//                 className += "selected "
//             }
//         }
//         const i = document.createElement('i');
//         const classList = className + 'icon-green service-sm-items'
//         i.setAttribute('class', classList);
//
//         cate.insertBefore(i, cate.firstChild);
//     }
//
// }

//
// // 팝업 띄우기
// function popCategory(){
//     if (!category){       //최초 클릭이면 팝업을 띄운다
//         let popUrl = "category";
//         Clip =window.open(popUrl, '_blank', 'width=550, height=900');
//         category = true;
//     }
//     else{           //최초 클릭이 아니면
//         if(!Clip.closed && Clip){          //팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
//             Clip.focus();
//         }
//         else{                                    //없으면 팝업을 다시 띄울 수 있게 한다
//             let popUrl = "category";
//             Clip =window.open(popUrl, '_blank', 'width=550, height=900');
//             category = true;
//         }
//     }
// };
//
// // 팝업 닫기
// function popClose() {
//     window.close();
// }