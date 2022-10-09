/* making the labels go blue when they're selected */
var sidebar = document.getElementById("sidebar");
sidebar.addEventListener("click",function(event){
	if(event.target.tagName.toLowerCase()=='label'){
		for(let label of sidebar.children){
			label.classList.remove("curpage");
		}
		event.target.classList.add("curpage");
	}
});
/* making them go blue after selection caching & stuff */
for(let label of sidebar.children){
	let radio = document.getElementById(label.getAttribute("for"));
	if(radio.checked){
		label.classList.add("curpage");
	}
}
/* adding delay to details closing to let animation finish playing */
for(let details of document.getElementsByTagName("details")){
	details.onclick = function(event){
		if(this.isExpanding || this.hasAttribute('open')){
			event.preventDefault();
			this.children[1].style["transform"]="var(--rotateAway)";
			setTimeout(()=>{this.removeAttribute("open");this.children[1].style["transform"]=null},200);
		}
	}
}