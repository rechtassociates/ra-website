$(function popOut(){				
	$('.product-name').bind({
		click: function(stop){
			stop.preventDefault();
			$(this).next('div').toggle('slide', { direction: 'left' }, 200);
			$(this).toggleClass('activated');
		}
	});
});