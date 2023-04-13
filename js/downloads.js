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
	
	let curtheme;
	for(let bodyclass of document.body.classList){
		if(bodyclass.startsWith('theme-')){
			curtheme = bodyclass.slice(6);
			break;
		}
	}
	let newtheme = getURLParam(
		'theme',
		"http://localhost"+themecard.getAttribute('href').slice(1)
	);
	
	themebox.getElementsByClassName('current')[0].classList.remove('current');
	themecard.classList.add('current');
	
	setURLParam('theme',newtheme);
	document.body.classList.remove('theme-'+curtheme);
	document.body.classList.add('theme-'+newtheme);
	
	// loading the new url to make change persistent
	fetch(window.location.toString());
}