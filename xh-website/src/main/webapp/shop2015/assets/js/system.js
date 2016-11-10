/**
 * 轮播初始化
 * @param obj
 */
function swiperContaniner(obj) {
    new Swiper(obj, {
        slidesPerView: 'auto',
        centeredSlides: true,
        spaceBetween: 10,
        initialSlide: 0,
        autoHeight: true,
        pagination: '.swiper-pagination'
    })
}

/**
 * a标签点击添加class
 * @param ele  按钮
 * @param obj  目标对象
 * @param className  class名称
 */
function addClassName(ele, obj, className) {
    $(ele).on('click',function () {
        $(obj).addClass(className);
        return false;
    });
}

/**
 * a标签点击去除class
 * @param ele  按钮
 * @param obj  目标对象
 * @param className  class名称
 */
function addRemoveName(ele, obj, className) {
    $(ele).on('click',function () {
        $(obj).removeClass(className);
        return false;
    });
}



$(function () {
    //首页菜单展开和关闭
    addClassName('#menu', 'body', 'drawer_show');
    addRemoveName('#close, div.overbg', 'body', 'drawer_show');

    //首页轮播图
    swiperContaniner('.swiper-container');


});



