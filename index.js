	function allowDrop(ev)
	{
		ev.preventDefault();
	}

	function drag(ev,media,$this)
	{
		ev.dataTransfer.setData("Text",'['+media+']');
		ev.dataTransfer.setDragImage($this,0,0);
	}

	function drop(ev,media)
	{
		ev.preventDefault();
		var data= media;//ev.dataTransfer.getData("Text");
		ev.target.appendChild(document.getElementById(data));
	}