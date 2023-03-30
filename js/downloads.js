import {setURLParam,getCurURLParam,getURLParam} from "./main.js";

/* adding click listener to theme cards */
window.addEventListener('load',function(){
	let themebox = document.getElementById('themebox');
	for(let themecard of themebox.getElementsByTagName('a')){
		themecard.addEventListener('click',onChangeTheme);
	}
});

/* stop link activation, update URL, change current theme card, change theme */
function onChangeTheme(e){
	e.preventDefault();
	
	let themebox = document.getElementById('themebox');
	let themecard = e.target;
	//trying to find card in case its contents were clicked instead
	while(!themecard.classList.contains('card')){
		themecard = themecard.parentElement;
	}
	
	let curtheme = getCurURLParam('theme');
	let newtheme = getURLParam(
		'theme',
		"http://localhost"+themecard.getAttribute('href').slice(1)
	);
	
	themebox.getElementsByClassName('current')[0].classList.remove('current');
	themecard.classList.add('current');
	
	setURLParam('theme',newtheme);
	document.body.classList.remove('theme-'+curtheme);
	document.body.classList.add('theme-'+newtheme);
}