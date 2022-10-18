function submitModJob(moimId) {

    if(masterCnt() > 1 ) {
        alert("모임장은 한 명이어야 합니다.");
    } else if(masterCnt() < 1 ) {
        alert("모임장은 적어도 한 명이 있어야 합니다.");
    } else if(managerCnt() > 3) {
        alert("관리자는 최대 3명까지 임명 할 수 있습니다.");
    } else {
        let modDatas = [];

        for(const data of document.querySelectorAll('.partList')) {
            let modData = {};
            modData = { 'moimId' : moimId,
                'memberId' : data.lastElementChild.getAttribute('id'),
                'job' : data.firstElementChild.nextElementSibling.value };
            modDatas.push(modData);
        }

        $.ajax({
            type: "post",
            url: "ajax/modJob",
            traditional: true,
            contentType: "application/json",
            data: JSON.stringify(modDatas),
            dataType: "json",
            success: (msg) => {
                if(msg.res) {
                    alert("수정이 완료되었습니다.");
                    window.opener.location.href = "/somoim/moim/meeting?id=" + moimId;
                    popClose();
                } else {
                    alert("수정 작업중 오류가 발생하였습니다.");
                }
            },
            error: () => {
                alert("수정 작업중 오류가 발생하였습니다.");
            }
        });
    }
}

function masterCnt() {
    let cnt = 0;
    for(const data of document.querySelectorAll('.partList')) {
        if(data.firstElementChild.nextElementSibling.value == 1) {
            cnt++;
        }
    }
    return cnt;
}

function managerCnt() {
    let cnt = 0;
    for(const data of document.querySelectorAll('.partList')) {
        if(data.firstElementChild.nextElementSibling.value == 2) {
            cnt++;
        }
    }
    return cnt;
}