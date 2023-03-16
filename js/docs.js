window.addEventListener('load',function(){

/**
 * sets one URL parameter and updates the history and url field
 */
function setURLParam(name,value){
	let cururl = new URL(window.location.toString());
	let params = cururl.searchParams;
	if(value!=null)
		params.set(name,value);
	else
		params.delete(name);
	window.history.replaceState(params,"","?"+params.toString());
}
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

});
