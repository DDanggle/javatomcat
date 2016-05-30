function logout(){
	alert("로그아웃 되었습니다.");
	location.href="confirm.jsp";
}

function Purchase(productName){
	var form = document.getElementById("purchase");
	form.product.value = productName;
	form.submit();
}

function alertlog(){
	var query = window.location.search.substring(1);
	if(query == "lack"){
		alert("포인트가 부족합니다.");
		location.href="main.jsp";
	}
	if(query == "stock"){
		alert("재고가 없습니다.");
		location.href="main.jsp";
	}
	if(query == "success"){
		alert("구매 완료.");
		location.href="main.jsp";
	}
}

function moveLog(){
	alert("이용내역을 확인합니다.");
	location.href="log.jsp";
}