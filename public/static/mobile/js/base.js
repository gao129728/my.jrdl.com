
$(function () {
    // 头部导航栏
    $('header .right .lines').on('click',function(){
		$('header .nav').stop().slideToggle();
		$('.headerbg').stop().slideToggle();
		if ($(this).hasClass('cur')) {
			$(this).removeClass('cur');
		} else{
			$(this).addClass('cur');
		};
	})
	$('header .nav ul li .tit').on('click',function(){
		var _this=$(this).parent('li');
		if (_this.hasClass('cur')) {
			_this.removeClass('cur');
			_this.find('.box').stop().slideUp();
			_this.removeClass('on');
		} else{
			_this.addClass('on').siblings('li').removeClass('on');
			_this.addClass('cur').siblings('li').removeClass('cur');
			_this.find('.box').stop().slideDown().parents('li').siblings('li').find('.box').stop().slideUp();
		};
	})
	$('header .right .serch').on('click',function(){
		$('header .nav').stop().slideUp();
		$('.headerbg').stop().slideUp();
		$('.hserch').fadeIn();
		$('header .right .lines').removeClass('cur')
	})
	$('.hserch i').on('click',function(){
		$('.hserch').fadeOut();
	})
	$('.header .mian .serch').on('click',function(){
		if ($('.header .mian .ser-box').hasClass('on')) {
			$('.header .mian .ser-box').removeClass('on');
			$('.header .mian .ser-box').stop().fadeOut();
		}else{
			$('.header .mian .ser-box').addClass('on');
			$('.header .mian .ser-box').stop().fadeIn();
		}
	})
	$('.header .mian .ser-box form i').on('click',function(){
		$('.header .mian .ser-box').removeClass('on');
		$('.header .mian .ser-box').stop().fadeOut();
	})
	$('.header .mian .nav ul .chi').hover(function(){
		$(this).find('.child').stop().fadeIn();
		$('.header .bgi').stop().slideDown();
	},function(){
		$(this).find('.child').stop().fadeOut();
		$('.header .bgi').stop().slideUp();
	})
    //返回顶部
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 200) {
            $(".backTop").fadeIn(200);
        } else {
            $(".backTop").fadeOut(100);
        }
    });
    $(".backTop").click(function () {
        $("html,body").animate({ scrollTop: 0 }, 500);
    });
    // 首页banner
    var swiper1 = new Swiper('.banner .swiper-container', {
        loop: true, // 循环模式选项
        speed: 300,
        autoplay: {
            delay: 2000
        },
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
        },
    });
    // 数字滚动
    var options = {
        useEasing: false,
        useGrouping: false,
        separator: ',',
        decimal: '.',
    };
    var num1txt = $('#num1txt').text()
    var num2txt = $('#num2txt').text()
    var num3txt = $('#num3txt').text()
    var demo1 = new CountUp("num1txt", 0, num1txt, 0, 1.5, options);
    var demo2 = new CountUp("num2txt", 0, num2txt, 0, 1.5, options);
    var demo3 = new CountUp("num3txt", 0, num3txt, 0, 1.5, options);
    demo1.start();
    demo2.start();
    demo3.start();
    if ($(window).scrollTop() > 200) {
        isplay = false;
        demo1.start();
        demo2.start();
        demo3.start();
    };
    // 首页part3
    var swiper2 = new Swiper('.part3 .swiper-container', {
        speed: 300,
        slidesPerView: 2,
        spaceBetween:10,
        navigation: {
            nextEl: '.lawyer-next',
            prevEl: '.lawyer-prev',
        },
    });
     // 首页part4
     var swiper3 = new Swiper('.part4 .swiper-container', {
        loop: true, // 循环模式选项
        speed: 300,
        autoplay: {
            delay: 3000
        },
        // 如果需要分页器
        pagination: {
            el: '.part4 .swiper-pagination',
        },
    });
    // 内页面包屑导航
    var TouchNav = new Swiper('#searchNav', {
        freeMode: true,
        freeModeMomentumRatio: 0.5,
        centeredSlides: true,
        centeredSlidesBounds: true,
        slidesPerView: 'auto',
        on: {
            tap: function () {
                $("#searchNav .active").removeClass('active');
                $("#searchNav .swiper-slide").eq(this.clickedIndex).addClass('active');
                TouchNav.slideTo(this.clickedIndex);
            }
        }

    });
    // 人才招聘下拉
    $('.post-item').eq(0).find('.post-summary').show()
    $('.post-item').eq(0).addClass('active')
    $('.click-btn').click(function () {
        if ($(this).parent().parent().parent().hasClass('active')) {
            $(this).parent().parent().parent().removeClass('active')
            $(this).parent().parent().parent().find('.post-summary').slideUp()
        } else {
            $(this).parent().parent().parent().addClass('active')
            $(this).parent().parent().parent().find('.post-summary').slideDown()
            $(this).parent().parent().parent().siblings().find('.post-summary').slideUp()
            $(this).parent().parent().parent().siblings().removeClass('active')
        }
    })
    // 人才招聘弹窗
    var w, h, className;
    function getSrceenWH() {
        w = $(window).width();
        h = $(window).height();
        $('#dialogBg').width(w).height(h);
    }
    window.onresize = function () {
        getSrceenWH();
    }
    $(window).resize();
    $(function () {
        getSrceenWH();
        // 索赔入口 弹出框 
        $('.post-apply').click(function () {
            var id=$(this).data('id');
            $('#cateId').prop('value',id);
            className = $(this).attr('class');
            $('#dialogBg').fadeIn();
            $('#dialog1').removeAttr('class').fadeIn();
            $('body').addClass('noroll')
        });
        $('.claseDialogBtn').click(function () {
            $('#dialogBg').fadeOut(function () {
                $('#dialog1').fadeOut();
            });
            $('body').removeClass('noroll')
        });
        $('.close').click(function () {
            $('#dialogBg').fadeOut(function () {
                $('#dialog1').fadeOut();
            });
            $('body').removeClass('noroll')
        });
    });
   
});




