import {setURLParam} from "./main.js";

window.addEventListener('load',function(){

/* making the labels go blue when they're selected and updating URL params */
var sidebar = document.getElementById("sidebar");
sidebar.addEventListener("click",function(event){
	if(event.target.tagName.toLowerCase()=='label'){
		for(let label of sidebar.children){
			label.classList.remove("curpage");
		}
		event.target.classList.add("curpage");
		let sectionId = event.target.getAttribute("for").slice(11);//cuts off the prefix "radio_title"
		setURLParam("section",sectionId);
		setURLParam("heading",null);
	}
});
/* making them go blue after selection caching & stuff */
for(let label of sidebar.children){
	let radio = document.getElementById(label.getAttribute("for"));
	if(radio.checked){
		label.classList.add("curpage");
	}
}
/* various details events */
for(let details of document.getElementsByTagName("details")){
	details.children[0].addEventListener("click",function(event){
		//closing
		if(details.isExpanding || details.hasAttribute('open')){
			/* adding delay to details closing to let animation finish playing */
			event.preventDefault();
			details.children[1].style["transform"]="var(--rotateAway)";
			setTimeout(()=>{details.removeAttribute("open");details.children[1].style["transform"]=null},200);
			
			let oldHeadingId = details.dataset.headingId;
			let newHeadingId = null;
			for(let sibling of details.parentElement.children){
				if(sibling.hasAttribute('open') && sibling!=details){
					let tmpHeadingId = sibling.dataset.headingId;
					//if current details is closer to old details than cached details
					if(newHeadingId==null ||
						Math.abs(oldHeadingId-tmpHeadingId)
						< Math.abs(oldHeadingId-newHeadingId))
					{
						newHeadingId = tmpHeadingId;
					}
				}
			}
			setURLParam("heading",newHeadingId);
		//opening
		}else{
			setURLParam("heading",details.dataset.headingId);
		}
	});
	/* scroll details into view if open on load */
	if(details.hasAttribute('open')){
		window.addEventListener('load',function(){
			details.scrollIntoView();
		});
	}
}
/* makes images fullscreen on click */
let modalcontainer = document.getElementById('modalcontainer');
let modalclose = document.getElementById('modalclose');
let modalstate = {};
for(let imgc of document.getElementsByClassName('img')){
	imgc.addEventListener('click',function(_event){
		//assuming the image container only has this one image as a child
		let img = imgc.children[0];
		//getting absolute position and size of image in page layout for transition
		let originBox = img.getBoundingClientRect();
		//extracting image and putting a placeholder in its place to preserve page layout
		let placeholder = document.createElement('div');
		placeholder.style.height=img.clientHeight+'px';
		placeholder.style.width=img.clientWidth+'px';
		img.remove();
		imgc.appendChild(placeholder);
		//injecting image into modal container and un-deactivate it
		//deactivating just means display:none, so we're essentially removing that
		modalcontainer.appendChild(img);
		modalcontainer.classList.remove('inactive');
		//getting absolute position and size of image in popup for transition
		let targetBox = img.getBoundingClientRect();
		
		//saving some elements for easier access later when closing the popup
		modalstate.placeholder = placeholder;
		modalstate.imgc = imgc;
		modalstate.img = img;
		
		//calculating a translate that transforms the image to its place inside the page layout
		//settings transition value via CSS variable as to not cause problems with rule importance
		img.style.setProperty("--origintransform",
			 "translate("
			+(originBox.left-targetBox.left)
			+"px,"
			+(originBox.top-targetBox.top)
			+"px) scale("
			+(originBox.width/targetBox.width)
			+","
			+(originBox.height/targetBox.height)
			+")"
		);
		
		//timeout so the previous styles get computed and this transition actually works correctly
		setTimeout(()=>{
			//untransform just resets the transform, essentially
			img.classList.add('untransform')
			img.style.transition="transform 0.2s";
			//active modalcontainer just has background, which also transitions here
			modalcontainer.classList.add('active');
		},100);
	});
}
modalclose.addEventListener('click',function(_event){
	//check if the modalstate has been populated by the above eventlistener
	if(modalstate.imgc!=undefined){
		//trigger transitions for image and modal container
		modalstate.img.classList.remove('untransform');
		modalcontainer.classList.remove('active');
		
		//wait for the transition to finish (0.2s) before doing all this
		setTimeout(()=>{
			//removing placeholder, extracting image from popup and reinjecting it into page layout
			modalstate.img.remove();
			modalstate.placeholder.remove();
			modalstate.imgc.appendChild(modalstate.img);
			
			//resetting transform value & transition rule so the next transition works as intended
			modalstate.img.style.removeProperty('--origintransform');
			modalstate.img.style.removeProperty('transition');
			//display:none the container
			modalcontainer.classList.add('inactive');
			
			//clear modalstate
			modalstate.placeholder=undefined;
			modalstate.imgc=undefined;
			modalstate.img=undefined;
		},200);
	}
});
//clicking on the non-image parts also makes the popup close
modalcontainer.addEventListener('click',function(event){
	if(event.target==modalcontainer)
		modalclose.click();
});
//pressing esc also makes the popup close
document.addEventListener('keydown',function(event){
	if(event.key=="Escape")
		modalclose.click();
});

});
