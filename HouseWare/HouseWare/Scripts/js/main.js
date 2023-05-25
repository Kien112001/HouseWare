jQuery(document).ready(function($){
  $('[data-toggle="tooltip"]').tooltip(); 
	$('.main-slideshow').owlCarousel({	    
      slideSpeed : 300,
      pagination: true,
      paginationSpeed : 400,
      singleItem:true,      
      autoHeight : true,
      goToFirstSpeed : 2000,
      autoPlay: 8000,
      navigation: true,
      navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
	});     
  $(".mainmenu-mobile").accordion({
      accordion: false,
      speed: 300,
      closedSign: '+',
      openedSign: '-'
  });  
  $(function(){
	  var menuLeft = $('#offset-menu-s1'),
		  showLeftPush = $( '.toggle-m-menu' ),
		  body = $('body');
	  showLeftPush.on('click',function(){
		  $(this).toggleClass('active');
		  body.toggleClass('offset-push-right');
		  menuLeft.toggleClass('offset-menu-left-open');
	  });
	  $(document).on('click touchstart',function(i){		  
	  		menuLeft.is(i.target) || 0 !== menuLeft.has(i.target).length || showLeftPush.is(i.target) || 0 !== showLeftPush.has(i.target).length || (closeLeftPush())
	  });
	  function closeLeftPush(){
		    $( 'toggle-m-menu' ).removeClass('active');
			$('#offset-menu-s1').removeClass('offset-menu-left-open');
			$('body').removeClass('offset-push-right');
	  }
  });
  $(".owl-special-collection").owlCarousel({
    items : 4,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,3],
    itemsTablet: [768,2],            
    itemsMobile : [479,1],
    slideSpeed : 300,
    pagination: false,
    paginationSpeed : 400,  
    goToFirstSpeed : 2000,
    autoPlay: 12000,
    navigation: true,
    navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
  });
  $(".owl-brands, .owl-related").owlCarousel({
     items : 4,
     itemsDesktopSmall : [980,3],
     itemsTablet: [768,2],            
     itemsMobile : [479,1],
     slideSpeed : 300,
     pagination: false,
     paginationSpeed : 400, 
     autoPlay: 12000,
     navigation: true,
     navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'] 
  });
  $('.product-detail .thumbnail-image').owlCarousel({
    items : 4,
    itemsDesktopSmall : [980,4],
    itemsTablet: [768,3],            
    itemsMobile : [479,2],
    pagination: false,
    navigation: true,
    navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
  });
  $('.big-collection').each(function(){
    var $this = $(this);
    $this.find('content-tabs').first().show();
    $this.find('head-tabs').first().addClass('active');
    var $link_default = $this.find('.head-tabs').first().attr('data-link'); 	
    $this.find('.title').children('a').attr('href',$link_default);
    $this.find('.owl-big-collection').owlCarousel({
      items : 4,
      itemsDesktop : [1199,4],
      itemsDesktopSmall : [992,2],
      itemsTablet: [768,2],            
      itemsMobile : [479,1],
      slideSpeed : 300,
      pagination: false,
      paginationSpeed : 400,    
      goToFirstSpeed : 2000,
      autoPlay: 12000,
      navigation: true,
      navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
    });
    
    $this.find('.head-tabs').on('click',function(){          
      if(!$(this).hasClass('active')) {
        $this.find('.head-tabs').removeClass('active');
        var $link_coll = $(this).attr('data-link');
        var $src_tab = $(this).attr('data-src');            
        $this.find($src_tab).addClass('active');
		 
        $this.find('.title').children('a').attr('href',$link_coll);
        $this.find('.content-tabs').hide();
        var $selected_tab = $(this).attr("href");
        $($selected_tab).show();
      }
      return false;
    })
  });
  /* -----  ZOOM PRODUCT ------*/
 
	   $('#large-image').elevateZoom({
		  zoomType: "window",
		  cursor: "pointer",
		  scrollZoom: true,
		  zoomWindowFadeIn: 300,
		  zoomWindowFadeOut: 500,
		  zoomWindowOffetx: 15
	   });
	
   $('.thumbnail-image a').click(function () {
      var smallImage = $(this).attr('data-image');
      var largeImage = $(this).attr('data-zoom-image');
      var ez = $('#large-image').data('elevateZoom');
      
      ez.swaptheimage(smallImage, largeImage);
      return false;
  });
  $('.product-detail').find('.head-tabs').on('click', function(){
      if(!$(this).hasClass('active')) {
         $('.product-detail .head-tabs').removeClass('active');
         var $src_tab = $(this).attr('data-src');
         $($src_tab).addClass('active');
         $('.product-detail').find('.content-tabs').hide();
         var $selected_tab = $(this).attr("href");
         $($selected_tab).show();
      }
      return false;    
  });
  $(function(){
	  $('.toggle-tool-header').click(function(){
		  if ($(this).hasClass('active')){
			  $('.list--tool').stop(true,true).slideUp(300);
			  $(this).removeClass('active');
		  } else {
			  $('.list--tool').stop(true,true).slideDown(300);
			  $(this).addClass('active');
		  }
	  });
	  
	  function closeListTool(){
		  $('.list--tool').stop(true,true).slideUp(300);
		  $('.toggle-tool-header').removeClass('active');
	  }
  });
  $('img.lazy').lazyload({
	  effect: 'fadeIn',
	  threshold:200
  })
  $("#back-top").click(function() {				
	  return $("body,html").animate({
		  scrollTop: 0
	  }, 400), !1	 
  })
});
$(window).load(function(){	
	$(this).scroll(function(){
		$(this).scrollTop() > 200 ? $('#back-top').fadeIn() : $('#back-top').fadeOut();		
	});
	$("html,body").trigger("scroll");

});
$(window).resize(function(){
	Visibilitytoolheader()
});
function Visibilitytoolheader(){
	var ww = $(window).width();
	if (ww > 991){		
		$('.list--tool').removeAttr('style');	
		$('.list--tool').removeClass('mobile');
	} else {
		$('.list--tool').addClass('mobile');
	}
}
