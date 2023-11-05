window.addEventListener('load',(event)=>{
	let roadmap = document.getElementsByClassName('roadmap')[0];
	let roadrect = roadmap.getClientRects()[0];
	let goals = roadmap.getElementsByClassName('goal');
	
	let svgstring = `<svg viewBox="0 0 ${roadrect.width} ${roadrect.height}" xmlns="http://www.w3.org/2000/svg">`;
	function makeLineThingy(x1,y1,x2,y2,w1,w2,w3,w4){
		svgstring+=`<path d="M${x1} ${y1}C${w1*x1+(1-w1)*x2} ${w2*y1+(1-w2)*y2} ${w3*x1+(1-w3)*x2} ${w4*y1+(1-w4)*y2} ${x2} ${y2}"/>`;
	}
	
	let rects = [];
	for(let goal of goals){
		rects.push(goal.getClientRects()[0]);
	}
	
	makeLineThingy(
		rects[0].x+rects[0].width-roadrect.x,
		rects[0].y+rects[0].height/2-roadrect.y,
		rects[1].x-roadrect.x,
		rects[1].y+rects[1].height/2-roadrect.y,
		0.2,1,
		0.8,0
	);
	makeLineThingy(
		rects[1].x+rects[1].width-roadrect.x,
		rects[1].y+rects[1].height/2-roadrect.y,
		rects[2].x+rects[2].width/2-roadrect.x,
		rects[2].y-roadrect.y,
		0.5,1,
		0,0.2
	);
	makeLineThingy(
		rects[2].x+rects[2].width/2-roadrect.x,
		rects[2].y+rects[2].height-roadrect.y,
		rects[3].x+rects[3].width-roadrect.x,
		rects[3].y+rects[3].height/2-roadrect.y,
		1,0.5,
		1,0
	);
	
	svgstring+="</svg>"
	
	let div = document.createElement('div');
	div.innerHTML = svgstring;
	let svg = div.children[0];
	
	roadmap.appendChild(svg);
});