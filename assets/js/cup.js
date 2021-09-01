const coffee_name = document.querySelector(".coffee_name");
const coffee_filling = document.querySelector(".filling");
const buttons = document.querySelectorAll("button");


const target = document.querySelector("div.chocolate");
const target2 = document.querySelector("div.coffee");
const target3 = document.querySelector("div.liquor");
const target4 = document.querySelector("div.milk");
const target5 = document.querySelector("div.milk_foam");
const target6 = document.querySelector("div.steamed_milk");
const target7 = document.querySelector("div.water");
const target8 = document.querySelector("div.whipped_cream");

sessionStorage.setItem("a","-100%");
sessionStorage.setItem("b","-100%");
sessionStorage.setItem("c","-100%");
sessionStorage.setItem("d","-100%");
sessionStorage.setItem("e","-100%");
sessionStorage.setItem("f","-100%");
sessionStorage.setItem("g","-100%");
sessionStorage.setItem("h","-100%");




var a = sessionStorage.getItem("a");
var b = sessionStorage.getItem("b");
var c = sessionStorage.getItem("c");
var d = sessionStorage.getItem("d");
var e = sessionStorage.getItem("e");
var f = sessionStorage.getItem("f");
var g = sessionStorage.getItem("g");
var h = sessionStorage.getItem("h");

var num1=0;
var num2=0;
var num3=0;
var num4=0;
var num5=0;
var num6=0;
var num7=0;
var num8=0;

var num = ["-100%","-90%","-80%","-70%","-60%","-50%","-40%","-30%","-20%","-10%","-0%"];
var number =0;
let map = new Map(); 


for(let i = 0; i < num.length; i++){ 
  map.set(i, num[i]); 
} 
let current_element = null;
const changeCoffeeType = (selected) => {
  if (current_element) {
    current_element.classList.remove("selected");
    coffee_filling.classList.remove(current_element.id);
  }
  current_element = selected;
  coffee_filling.classList.add(current_element.id);
  current_element.classList.add("selected");
  coffee_name.innerText = selected.innerText;
};

const setActiveType = (element) => {
  element.toggleClass("selected");
};

function reply_click(clicked_id)
  {
      value = clicked_id;
  }
 function Reset1() {
      		sessionStorage.setItem("a","-100%");
			sessionStorage.setItem("b","-100%");
			sessionStorage.setItem("c","-100%");
			sessionStorage.setItem("d","-100%");
			sessionStorage.setItem("e","-100%");
			sessionStorage.setItem("f","-100%");
			sessionStorage.setItem("g","-100%");
			sessionStorage.setItem("h","-100%");
			num1=0;
num2=0;
num3=0;
num4=0;
num5=0;
num6=0;
num7=0;
num8=0;
  }
function Reset0() {
      		target.style.bottom = "-100%";
			target2.style.bottom = "-100%";
			target3.style.bottom = "-100%";
			target4.style.bottom = "-100%";
			target5.style.bottom = "-100%";
			target6.style.bottom = "-100%";
			target7.style.bottom = "-100%";
			target8.style.bottom = "-100%";
  }
function Custom(a,b,c,d,e,f,g,h) {
			target2.style.bottom = h;
      		target.style.bottom = a;
			target6.style.bottom = g;
			target5.style.bottom = f;
			target8.style.bottom = e;
			target3.style.bottom = c;
			target4.style.bottom = d;
			target7.style.bottom = b;
  }
function Custom_Re() {
			b = sessionStorage.getItem("b");
      		d = sessionStorage.getItem("d");
			c= sessionStorage.getItem("c");
			e = sessionStorage.getItem("e");
			f = sessionStorage.getItem("f");
			g = sessionStorage.getItem("g");
a = sessionStorage.getItem("a");
h = sessionStorage.getItem("h");
  }
function Custom_num() {
			sessionStorage.setItem("b",map.get(num1+num2+num3+num4+num5+num6+num7+num8));
sessionStorage.setItem("d",map.get(num2+num3+num4+num5+num6+num7+num8));
sessionStorage.setItem("c",map.get(num3+num4+num5+num6+num7+num8));
sessionStorage.setItem("e",map.get(num4+num5+num6+num7+num8));
sessionStorage.setItem("f",map.get(num5+num6+num7+num8));
sessionStorage.setItem("g",map.get(num6+num7+num8));
sessionStorage.setItem("a",map.get(num7+num8));
sessionStorage.setItem("h",map.get(num8));
  }
[...buttons].forEach((button) => {
  button.addEventListener("click", () => {
	  switch(value){
		  case "Water":
num1++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Milk":
num2++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
			case "Liquor":
num3++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Whipped cream":
num4++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Milk foam":
num5++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Steamed milk":
num6++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Choco":
num7++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "coffee":
num8++;
		  Custom_num();
			Custom_Re();
		  Reset0()
		  Custom(a,b,c,d,e,f,g,h);
		  break;
		  case "Reset":
		  Reset0();
			Reset1();
		  break;
		  default:
		  changeCoffeeType(button);
		  break;
	  }
  });
});

