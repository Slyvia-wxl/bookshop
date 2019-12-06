    var index = 0;
    //图片总个数
    var imgnum = $('.banner ul li').length;
    var nmun='';
    //计算单个图片的宽度
    var imgwidth = $('.banner ul li').width(); 
    //计算所有左浮动图片的宽度
    var allimgwidth = imgwidth*imgnum; 
    //设置ul宽度 
    $('.banner ul').css('width',allimgwidth); 
    
    
    $('.banner').hover(function(){
            //鼠标移动上来停止轮播
        clearInterval(p);
        //显示两边切换按钮
        $('.banner .u').fadeIn();
    },function(){
            //鼠标移开继续轮播
        pic();
        //隐藏两边按钮
        $('.banner .u').fadeOut();
    });
    
    //轮播切换图片的函数，
    //思路就是通过定时器不停的改变index的值，
    //然后乘以宽度就是总宽度
    function pic(){
        
        p=setInterval(function(){
            index++; 
            
            if(index>=imgnum){
                index=0;
            }
            //选择对应的图片
            selectimg(index); 
    
        },10000);
        
    }
    
    function selectimg(index){
            //通过改变ul往左边的距离显示对应的图片
        $('.banner ul').animate({'margin-left':'-' + imgwidth*index + 'px'},600);  
        //切换图片并选择对应按钮
        $('.con a').eq(index).addClass('active').siblings('a').removeClass('active');
    }
    
    //点击左边的按钮选择对应的图片，往左切换图
    $('.banner .left').click(function(){
        index-=1; 
        if(index<0){
           index=imgnum-1;
        }
        selectimg(index);
    });
    
    //点击左边的按钮选择对应的图片，往右切换图
    $('.banner .right').click(function(){
        index+=1;
        if(index>imgnum-1){
           index=0;
        }
       selectimg(index);
        
    });
    
    //根据图片个数写入对应按钮的个数
    for(var ni=0;ni<imgnum;ni++){
        nmun +="<a href='javascript:;'></a>";
    }
    $('.banner .con').html(nmun);
    $('.banner .con a').eq(0).addClass('active');
    
    //点击圆点选择对应的图片
    $('.con a').each(function(i){
		$(this).click(function(){
		    index=i;
		    $('.banner ul').animate({'margin-left':'-' + imgwidth*i + 'px'},600);
		    $('.con a').eq(index).addClass('active').siblings('a').removeClass('active');
		});
	});    
    
    //默认开始执行
    pic();
   
