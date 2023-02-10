$(document).ready(function(){
	


	
	$("header .gnb .open").on("click", function(){
		$("header .gnb .menu_slide").animate({
			left:0
		  }, 400);

	});
	
	$("header .menu_slide .gnb_bg .close").on("click", function(){
		$("header .gnb .menu_slide").animate({
			left:-1300
		  }, 400);

		
	});
	
	$("footer .bottomnav .gnb_open").on("click", function(){
		$("header .gnb_mobile .m_slide").animate({
			right:0
		  }, 400);

	});
	
	$("header .gnb_mobile .m_slide .gnb_close").on("click", function(){
		$("header .gnb_mobile .m_slide").animate({
			right:-650
		  }, 400);

		
	});
	
	
	
	var window_h = $(window).height();
	var window_w = $(window).width();
	var menu_top_h = 50;
	var menu_sub = $("header .gnb_mobile .m_slide .menu_sub");
	menu_sub.height(window_h - menu_top_h);
	
	$(window).resize(function(){
		window_h = $(window).height();
		window_w = $(window).width();
		menu_sub.height(window_h - menu_top_h);
		resize_mobile();
	});
	

	
	$("footer .bottomnav .gnb_open").on("click", function(){
		$("header .h_top .login").show();
		$("header .gnb_mobile .menu_top").show();
		$("header .gnb_mobile .m_slide .menu_sub").show();
		$("header .gnb_mobile .m_slide .gnb_close").show();
		$("header .gnb_mobile .m_slide .gnb_bg").show();

	
	});
	$("header .gnb_mobile .m_slide .gnb_close").on("click", function(){
		$("header .h_top .login").hide();
		$("header .gnb_mobile .menu_top").hide();
		$("header .gnb_mobile .m_slide .menu_sub").hide();
		$("header .gnb_mobile .m_slide .gnb_close").hide();
		$("header .gnb_mobile .m_slide .gnb_bg").hide();
	
	});
	

	var pc_mobile;
	if(window_w>390){
		pc_mobile = "pc";
	}else{
		pc_mobile = "mobile";
	}
	
	function resize_mobile(){
		if(window_w>640){
			if(pc_mobile == "mobile"){
				$("header .h_top .login").show();

				$("header .gnb_mobile .menu_top").show();
				$("header .gnb_mobile .m_slide .menu_sub").show();
				$("header .gnb_mobile .m_slide .gnb_close").show();
				$("header .gnb_mobile .m_slide .gnb_bg").show();

		
				$("body").css({overflow : "auto"}).unbind('touchmove');
				pc_mobile = "mobile";
				console.log(pc_mobile);
			}
		}else{
			if(pc_mobile == "pc"){//mobile로 전환된 순간
				$("header .h_top .login").show();

				pc_mobile = "mobile";
				console.log(pc_mobile);
			}
		}
	}	

	
});
