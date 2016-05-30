$(document).ready(function(){
	$.ajax({
		type:"POST",
		url:"purchaseLog.jsp",
		dataType:"JSON",
		success:function(data){
			if(data.length == 0){
				alert("이용 내역이 존재하지 않습니다.");
				location.href="main.jsp";
				return;
			}
			$("#logInfo tbody").remove();
			var table = $("#logInfo");
			var tbody = $("<tbody></tbody>");
			for(var i = 0; i < data.length; i++){
				var tr = $("<tr></tr>");
				var td1 = $("<td align='center'></td>").text(data[i].number);
				var td2 = $("<td></td>").text(data[i].product);
				var td3 = $("<td align='center'></td>").text(data[i].price);
				var td4 = $("<td align='center'></td>").text(data[i].date);
				var tmp = data[i].state;
				console.log(tmp === "구매");
				if(tmp == "구매"){
					var td5 = $("<td align='center'><input type='button' value='구매 취소' onclick='cancel(" + data[i].number + "," + data[i].date + ")'/></td>");
				}else{
					var td5 = $("<td align='center'></td>").text(data[i].state);
				}
				
				tr.append(td1);
				tr.append(td2);
				tr.append(td3);
				tr.append(td4);
				tr.append(td5);
				tbody.append(tr);
			}
			
			table.append(tbody);
		},
		error:function(xhr, status, error){
			console.log(xhr + "\n" + status + "\n" + error);
		}
	});
});

function moveMain(){
	location.href="main.jsp";
}

function logout(){
	alert("로그아웃 되었습니다.");
	location.href="confirm.jsp";
}

function cancel(num, date){
	if(confirm("해당 상품 구매를 취소하시겠습니까?")){
		var form = document.getElementById("cancelForm");
		form.index.value = num;
		form.date.value = date;
		form.submit();
	}
}
function alertlog(){
	var query = window.location.search.substring(1);
	if(query == "time"){
		alert("3일이 경과한 상품은 구매 취소하실 수 없습니다.");
		location.href="log.jsp";
	}
}