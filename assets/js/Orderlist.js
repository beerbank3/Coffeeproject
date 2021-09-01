window.onload = function() { 
var Ordercomplete = document.getElementById('Ordercomplete');
var Orderlist = document.getElementById('Orderlist');
var menuchange = document.getElementById('menuchange');
// header 객체에 onclick 이벤트 속성을 연결
Ordercomplete.onclick = function() {
	location.replace("Order_check.jsp");
}
Orderlist.onclick = function() {
	location.replace("member_list.jsp");
}
menuchange.onclick = function() {
	location.replace("menu_check.jsp");
}
};

