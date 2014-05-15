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
	var data= media;
	ev.target.appendChild(document.getElementById(data));
}
function loadVid(){
		$(".hover_video").click(function(e){
				e.preventDefault();
				$('.hovered').remove();
				
				var id = $(this).attr('data-video-id');				
				var iframe = '<iframe src="http://www.youtube.com/embed/'+id+'?autoplay=1&amp;autohide=2&amp;controls=1&amp;iv_load_policy=1&amp;loop=0&amp;modestbranding=0&amp;playlist=&amp;rel=0&amp;showinfo=1&amp;start=0&amp;theme=dark&amp;color=white" width="640" px="" height="390" frameborder="0" allowfullscreen=""></iframe>';
				$(this).next('.video-wrapper').find('.video').append(iframe);
				$(this).next('.video-wrapper').show();				
				$(this).parent('.video-target').siblings('.close').show();			
		});		
}
function closeVid(){
	var offset = $(".close").offset();
	var width = $('.close').width();
	var pos = width + offset;
	$('.close').css('left',pos);
	$(window).resize(function(){
		var offset = $(".close").offset();
		var width = $('.close').width();
		var pos = width + offset;
		$('.close').css('left',pos+'px');	
	});	
	$('.close').click(function(e){
		e.preventDefault();
		$(this).hide();			
		$('iframe').remove();
		$('.video-wrapper').hide();
	});
	
}
function stopimgClick(){
$('.hover_image').click(function(e){
		e.preventDefault();		
	});
}
function loadImg(){
	$('.tabbed li').hover(function(){
		$('.edit').hide();
		$(this).find('.edit').show();					
	},function(){
		$('.edit').hide();	
	});
	$('.hover_image, .hover_video').hover(function(){
			
			$('.hovered').remove();
			
			if($(this).attr('href') != undefined){
				var src = $(this).attr('href');
				var caption = $(this).attr('data-caption');
			}else{
				var src = $(this).parent('.video-target').attr('data-caption');
				var caption = $(this).parent('.video-target').attr('data-caption');
			}

			var div = $('<div></div>');
			var span = $('<span></span>').html('Caption : ' + caption);
			div.addClass('hovered');			
			var img = $('<img />');
			img.attr('src',src);
			img.attr('id','drag1');
			img.attr('width','300px;');
			div.append(img);
			div.append(span);
			if($(this).attr('href') != undefined){
				$(this).after(div);
			}else{
				$(this).parent('.video-target').after(div);
			}
			
			$('.hovered').stop().fadeTo(150, 1); 
	},function(){
			$('.hovered').remove();		
			
	});

};
function pagination(){
	$('ul.pagination li a').click(function(e){
		e.preventDefault();
		var page = $(this).attr('href');
		var fullurl = Symphony.Context.get('root')+'/images/'+ page;
		$('.content-block').html("<img src='data:image/gif;base64,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' alt='loading...' />");
		$('.content-block').load(fullurl,function(response,status){			
				var height = parseInt($('.tabbed').height()) + 69;
				$('.inline.frame').css('min-height',height);	
				loadVid();
				closeVid();
				stopimgClick();
				loadImg();
				pagination();
		});	
	});
	
}
$(document).ready(function(){	
	
	var fullurl = Symphony.Context.get('root')+'/images/';
	$('.content-block').html("<img src='data:image/gif;base64,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' alt='loading...' />");
	$('.content-block').load(fullurl,function(response,status){			
			var height = parseInt($('.tabbed').height()) + 69;
			$('.inline.frame').css('min-height',height);	
			loadVid();
			closeVid();
			stopimgClick();
			loadImg();
			pagination();
	});	
		
	$('.inline.frame h1 a').click(function(e){
		e.preventDefault();		
		var fullurl = Symphony.Context.get('root')+'/'+ $(this).attr('id') + '/';
		$('.content-block').html("<img src='data:image/gif;base64,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' alt='loading...' />");
		$('.content-block').load(fullurl,function(response,status){
			var height = parseInt($('.tabbed').height()) + 69;
			$('.inline.frame').css('min-height',height);			
			loadVid();
			closeVid();
			stopimgClick();
			loadImg();
			pagination();
		});				
	});
});