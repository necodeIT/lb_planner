/**
 * sets one URL parameter and updates the history and url field
 */
export function setURLParam(name,value){
	let cururl = new URL(window.location.toString());
	let params = cururl.searchParams;
	if(value!=null)
		params.set(name,value);
	else
		params.delete(name);
	window.history.replaceState(params,"","?"+params.toString());
}
export function getCurURLParam(name){
	let cururl = new URL(window.location.toString());
	return cururl.searchParams.get(name);
}
export function getURLParam(name,url){
	return (new URL(url)).searchParams.get(name);
}
