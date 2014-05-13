var dragIcon = document.createElement('img');
function allowDrop(ev){
	ev.preventDefault();
}
function drag(ev,media,$this){
	dragIcon.style.width = "100px";
	dragIcon.src = $this.src;	
	ev.dataTransfer.setData("Text",'['+media+']');
	ev.dataTransfer.setDragImage(dragIcon,-10,-10);
}
function drop(ev,media){
	ev.preventDefault();
	var data= media;//ev.dataTransfer.getData("Text");
	ev.target.appendChild(document.getElementById(data));
}
$(document).ready(function(){
	$('.thumb .hover_image img').each(function(){
		$(this).hoverZoom();
	});
	$(".hover_video").click(function(e){
		e.preventDefault();
			$(this).jqueryVideoLightning({
            autoplay: 1,
            color: "white"
        });
	});	
});