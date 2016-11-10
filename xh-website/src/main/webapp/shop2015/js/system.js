/**
 * Created by Administrator on 2016/9/2.
 */

$(function(){
	//轮播图
	jQuery.fn.extend({
		slideFocus: function(){
			var This   =$(this);
			var sWidth =$(This).width(),
				len    =$(This).find('ul li').length,
				index  =0,
				speed  =5000,
				Timer;

			// btn event
			var btn = "<div class='btn'>";
			for(var i=0; i < len; i++) {
				btn += "<span></span>";
			};
			// btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
			$(This).append(btn);
			$(This).find('.btn span').eq(0).addClass('on');
			$(This).find('.text p').eq(0).show();

			$(This).find('.btn span').mouseover(function(){
				index = $(This).find('.btn span').index(this);

				Tony(index);
			});

			/*
			 *	上下翻页
			 *
			 $(This).find('.next').click(function(){
			 index++;
			 if(index == len){index = 0;}
			 Tony(index);
			 });

			 $(This).find('.pre').click(function(){
			 index--;
			 if(index == -1){index = len - 1;}
			 Tony(index);
			 });
			 */

			// start setInterval
			$(This).find('ul').css("width",sWidth * (len));
			$(This).hover(function(){
				clearInterval(Timer);
				show($(This).find('.preNext'));
			},function(){
				hide($(This).find('.preNext'));
				Timer=setInterval(function(){
					Tony(index);
					index++;
					if(len == index){index = 0;}
				}, speed)
			}).trigger("mouseleave");

			function Tony(index){
				var new_width = -index * sWidth;
				$(This).find('ul').stop(true,false).animate({'left' : new_width},300);
				$(This).find('.btn span').stop(true,false).eq(index).addClass('on').siblings().removeClass('on');
				$(This).find('.text p').eq(index).show().siblings('p').hide();
			};


			// show hide
			function show(obj){ $(obj).stop(true,false).fadeIn();}
			function hide(obj){ $(obj).stop(true,false).fadeOut();}
		}
	});

	//内容滚动
	jQuery.fn.extend({
		//showNum  显示的个数
		//speed 速度
		slideRoll:function(showNum,speed){
			var This     =$(this),
				oUl      =This.find('ul'),
				aLi      =oUl.find('li'),
				len      =aLi.length,
				aLiWidth =aLi.width()+parseInt(aLi.css('margin-right')),
				prev     =This.find('.prev'),
				next     =This.find('.next'),
				speeded  =speed?speed:300,
				num      =len-showNum,  //默认显示的个数
				index    =0;

			oUl.css('width',aLiWidth*len);

			if(num!=0){next.addClass('active');}

			next.click(function () {
				index< num ? index++ : null;
				Tony(index)
			});

			prev.click(function () {
				index>0 ? index-- : 0;
				Tony(index)
			});

			function Tony(index){
				var new_width = -index * aLiWidth;
				oUl.stop(true,false).animate({marginLeft:new_width},speeded)
				index>0 ? prev.addClass('active') : prev.removeClass('active');
				index==num ? next.removeClass('active') : next.addClass('active');
			};
		}
	});

	//

	$('.social').each(function(){
		var btn=$(this).find('a'),
			layer=$(this).find('.layer');
		btn.click(function () {
			$(this).addClass('active').siblings('a').removeClass('active');
			layer.show().find('img').eq($(this).index()).show().siblings('img').hide();

			$(document).click(function () {
				layer.hide();
			})

			return false;
		});

	});

	//
	$('.btn-list').on('click',function(){
		$(this).toggleClass('active');
		$(this).siblings('.items-list').stop(true).slideToggle('fast');
		return false;
	})


	//
	//X1010604申报查询
	var divList=$('#div-list');
	var divTabBox=divList.find('.div-tab-box');
	divTabBox.eq(0).show();
	divList.find('.div-tab-btn span').click(function(){
		var index=$(this).index();
		$(this).addClass('active').siblings('span').removeClass('active');
		$('.examined').hide()
		divTabBox.eq(index).show().siblings('.div-tab-box').hide();
	});

	//资料下载
	$('.listof .main-right .down li').hover(function () {
		$(this).addClass('hover')
	},function () {
		$(this).removeClass('hover');
	})
})
