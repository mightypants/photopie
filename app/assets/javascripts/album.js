// $(window).load(function(){
// 		lazyLoad();
// 		setInterval(function(){
// 			lazyLoad();
// 		}, 500);
// 	});

// 	function lazyLoad(){
// 		console.log('ll called');
// 		w = $(window).width();
// 		h = $(window).height();

// 		$('.placeholder').each(function(){		
// 			console.log($(this).attr('id') + ' is at ' + $(this).position().top);
// 			console.log('height is ' + h);
// 			console.log($(this).attr('id') + ' is ' + $(this).height() + 'tall');
			
// 			if ($(this).position().top < h){

// 				if ($(this).prop('tagName') == 'H3'){
// 					$(this).text($(this).attr('id'));
// 				}
// 				else if ($(this).prop('tagName') == 'SPAN'){
// 					img = new Image;
// 					img.src = $(this).attr('data-urlThumb');
// 					img.title = $(this).attr('data-caption');
// 					img.alt = 'photo ' + $(this).attr('id');
// 					img.id = $(this).attr('id');
// 					img.className = 'photo';


// 					$(this).parent().append(img);
// 					$(this).remove();
// 				}
// 			}
// 		});
// 	}


// 	var slideshowPhotos = new Array();
// 	var slideshowIndex = 0;

// 	$(".photo").each(function(){
// 		slideshowPhoto = new Image();
// 		$(slideshowPhoto).attr('src',$(this).attr('src').replace('med/', 'original/'));
// 		$(slideshowPhoto).addClass('slideshowPhoto');
// 		slideshowPhotos.push(slideshowPhoto);
// 	});

// 	function changeSlide(){
// 		slideshowIndex++;
// 		$("#slideshowContainer").empty();
// 		$("#slideshowContainer").append(slideshowPhotos[slideshowIndex]);
// 		$(slideshowPhotos[slideshowIndex]).animate({
// 		    opacity:'100',
// 		  	}, 'slow');
// 		}

// 	$("#slideshowContainer").click(function(){
// 		$(this).children().animate({
// 		    opacity:'0',
// 		  	}, 'medium', changeSlide);
// 	});

// 	$(".photo").click(function(){
// 		$(slideshowPhotos[slideshowIndex]).css('opacity', '100');
// 		$("#slideshowContainer").append(slideshowPhotos[slideshowIndex]);
// 		$("#slideshowContainer").css('display', 'flex');
// 		$("body").toggleClass('no-scroll');
// 	});