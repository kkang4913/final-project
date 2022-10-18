// info, member 이미지 div, img 선택
const infoImgSelect = document.querySelector('#infoImgSelect');
const infoImg = document.querySelector('#infoImg');
const profileImgSelect = document.querySelector('#profImgInput');
const profileImg = document.querySelector('#profImg');
const hoverTarget = document.querySelector('#hoverTarget');
const hoverTarget_profile = document.querySelector('#hoverTarget_profile');

if(infoImgSelect) {
    infoImg.addEventListener('click', (e) => infoImgSelect.click());
    infoImgSelect.addEventListener("change", infoImageUpload);
}

if(profileImg) {
    profileImg.addEventListener('click', (e) => profileImgSelect.click());
    profileImgSelect.addEventListener("change", profileImageUpload);
}

function infoImageUpload(e) {
    const file = e.target.files[0];
    let fData = new FormData();
    fData.append("uploadImage", file, file.name);

    $.ajax({
        type: "post",
        enctype: "multipart/form-data",
        url: "/somoim/ajax/infoUpload",
        data: fData,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
            infoImg.src = data.infoUrl;
        }
    });
}

function profileImageUpload(e) {
    const file = e.target.files[0];
    let fData = new FormData();
    fData.append("uploadImage", file, file.name);

    $.ajax({
        type: "post",
        enctype: "multipart/form-data",
        url: "/somoim/ajax/profileUpload",
        data: fData,
        dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
            profileImg.src = data.profileUrl;
        }
    });
}

if(infoImgSelect) {
    infoImg.addEventListener('mouseover', () => {  //  mouseover 시 hover 클래스 추가
        hoverTarget.classList.add('hover__filter');
    });
}
if(infoImgSelect) {
    infoImg.addEventListener('mouseout', () => {   //  mouseout 시 hover 클래스 삭제
        hoverTarget.classList.remove('hover__filter');
    });
}
if(profileImgSelect) {
    profileImg.addEventListener('mouseover', () => {  //  mouseover 시 hover 클래스 추가
        hoverTarget_profile.classList.add('hover__filter');
    });
}
if(profileImgSelect) {
    profileImg.addEventListener('mouseout', () => {   //  mouseout 시 hover 클래스 삭제
        hoverTarget_profile.classList.remove('hover__filter');
    });
}

