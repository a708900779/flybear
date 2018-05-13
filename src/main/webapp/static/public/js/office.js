$(document).contextmenu(function(){
    return false;
});
// 2. 绑定鼠标右键的事件
// $('#network').mousedown(function(event){
//     var $download = $('#download-file'),
//         $newDir = $('#newdir'),
//         $delete = $('#delete-file'),
//         $rename = $('#rename-file');

//     //当点击鼠标右键，显示菜单
//     // if(event.button == 2){
//     //     // 显示自定义菜单
//     //     $("#mymenu").css({
//     //         //定义菜单显示位置为事件发生的X坐标和Y坐标
//     //         top : event.pageY - $('#network').offset().top,
//     //         left : event.pageX - $('#network').offset().left
//     //     }).slideDown(100);
//     //     $download.css('display', 'none');
//     //     $newDir.css('display', 'block');
//     //     $delete.css('display', 'none');
//     //     $rename.css('display', 'none');
//     //     //如果点击鼠标左键，隐藏菜单
//     // }else if(event.button == 0){
//     //     $("#mymenu").slideUp(100);
//     // }
//     if(event.button == 0){
//       $("#mymenu").slideUp(100);
//     }
// });
// $( "#mymenu" ).menu();

$(document).ready(function(){
    window.oldFile;
    window.isMoveFile = false;
    window.nowMoveObj;
    window.isAdmin = true;
    var $newDir = $('#newdir'),
        $fileContent = $('#network'),
        $mymenu = $('#mymenu'),
        $fileClick = $('.file-click'),
        $inputScreen = $('#input-screen'),
        $comfirmBtn = $('#comfirm-btn'),
        $menuDeleteFile = $('#delete-file');
        
    uploading();

    // $('#sortable li').each(function(index, el) {
    //     var $this = $(this);
    //     $this.draggable({
    //         drag: function() {

    //         },
    //     });
    // });
    addMenu();
    
    // addHover();
    //dragFile();

    // $fileClick.draggable({revert:true});
    // $('#sortable').sortable({
    //   revert: true
    // });
    // $('#sortable').disableSelection();


    /*双击文件 重命名*/
    /*$fileClick.on('dblclick',function(event) {
        var $this = $(this);
        console.log('------');
        console.log($this);
        oldFile = $this;
        $inputScreen.css('display', 'block');
        $inputScreen.children().children('input').eq(0).val($this.children().children('span').text());
        $inputScreen.animate({
            "opacity": '1'},
            1000, function() {
            
        });
    });*/
    // 点击重命名文件弹窗的确定按钮
    /*$comfirmBtn.click(function(event) {
        $menuDeleteFile.css('display', 'none');
        $.ajax({
          url: '/path/to/file',
          type: 'default GET (Other values: POST)',
          dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
          data: {param1: 'value1'},
        })
        
        oldFile.children().children('span').text($inputScreen.children().children('input').eq(0).val());
        $inputScreen.animate({
            "opacity": '0'},
            600, function() {
            $inputScreen.css('display', 'none');
        });
    });*/

    // 右键点击新建文件夹
    $newDir.click(function(event) {
        $('#clear-box').before('<li class="dir file-click">'
            + '<a class="newdir-icon" href="javascript:return false;">'
            + '<input type="checkbox" name="file" value="">'
            + '</a>'
            + '文件夹'
            + '</li>');
        $mymenu.slideUp(100);
        // addHover($('.dir:last'));
        //dragFile();
    });
});

function removeFile(){
  if(isReleaseFile){
    console.log('is remove');
    nowMoveObj.remove();
  }
}
// 添加hover事件
function addHover(){
  $('.dir').each(function(index, el) {
    var $this = $(this);
    $this.hover(function() {
      if(isMoveFile){
        console.log(123);
        $this.animate({
            'margin': '10px 30px 20px 30px',
          },
          600, function() {
           
        });
        // setTimeout('removeFile()',400);

      }
    }, function() {
       $this.animate({
          'margin': '30px 30px 20px 30px',
          },
          400
       );
    });
  });
}

function addSingleHover($obj){
    $obj.hover(function() {
      if(isMoveFile){
        console.log(123);
        $this.animate({
            'margin-top': '20px',
          },
          600, function() {
           
        });
        // setTimeout('removeFile()',400);

      }
    }, function() {
       $this.animate({
          'margin-top': '50px',
          },
          400
       );
    });
}
// 移动文件
function dragFile(){
  $('.file-click').draggable({
      // revert:true,
      start: function(event) {
        isReleaseFile = false;
        isMoveFile = true;
        nowMoveObj = $(this);
        $(this).css('z-index', '1');
      },
      drag: function(event) {
        
        // console.log(event.pageY);
        // console.log($('.dir').position().top);
        // console.log($('.dir').height());
        // console.log(nowMoveObj.height());
        // console.log("---------");

      },
      stop: function(event) {
        isMoveFile = false;
        isReleaseFile = true;
        $(this).css('z-index', '');

        if($(this).hasClass('dir'))
          return;
        $('.dir').each(function(index, el) {
          var $this = $(this);
          if($this.position().left < event.pageX && 
            ($this.position().left + $this.width() +nowMoveObj.width()) > event.pageX &&
            $this.position().top < event.pageY && 
            ($this.position().top + $this.height() + nowMoveObj.height()) > event.pageY){
            console.log('remove success');
            nowMoveObj.remove();
          }
          
        });
      }
    })
}
//显示菜单
function addMenu(){
    var $download = $('#download-file'),
        $newDir = $('#newdir'),
        $delete = $('#delete-file'),
        $fileList = $('#file-list'),
        $myPopup = $('#myPopup'),
        $rename = $('#rename-file'),
        $inputScreen = $('#input-screen');

    $('#network').click(function(event) {
      event.stopPropagation();
      $("#mymenu").slideUp(100);
    });

    $('#flieList input').on('click', 'input', function(event) {
      event.preventDefault();
      event.stopPropagation();
      if(!$(this).prop('checked')){
        $(this).prop('checked', true);
      }else{
        $(this).prop('checked', false);
      }
      
    });

    // $fileList.on('click', '.file', function(event) {
    //     var $this = $(this);
    //     if (!$this.children('a').children('input').prop('checked')) {
    //       console.log($this.children('a').children('input').prop('checked'));
    //       $this.children('a').children('input').prop('checked', true);
    //     }else{
    //       console.log($this);
    //       $this.children('a').children('input').prop('checked', false);
    //     }
        
    // });
    $fileList.delegate('.file-click','mousedown',function(){
      // 禁用事件冒泡
      event.stopPropagation();
      var $this = $(this);
      oldFile = $this;
      if($this.hasClass('file')){
        if(event.button == 2){
          $("#mymenu").css({
              //定义菜单显示位置为事件发生的X坐标和Y坐标
            top : event.pageY - $('#network').offset().top,
            left : event.pageX - $('#network').offset().left
          }).slideDown(100);
          $download.css('display', 'block');
          $newDir.css('display', 'none');
          $delete.css('display', 'block');
          $rename.css('display', 'block');

          // if($this.children('a').attr('data') == undefined){
          //   alert("文件下载错误");
          //   $("#mymenu").slideUp(100);
          // }
          $download.attr('href',encodeURI($this.children('a').children('p').text()));
          $download.one('click', function(event) {
            $("#mymenu").slideUp(100);
          });
         /* $delete.one('click', function(event) {
            console.log($this);
            $this.remove();
            $("#mymenu").slideUp(100);
          });*/
        }else if(event.button == 0){
          $("#mymenu").slideUp(100);
        }
      }else if($this.hasClass('dir')){
        if(event.button == 2){
          $("#mymenu").css({
              //定义菜单显示位置为事件发生的X坐标和Y坐标
            top : event.pageY - $('#network').offset().top,
            left : event.pageX - $('#network').offset().left
          }).slideDown(100);
          $download.css('display', 'none');
          $newDir.css('display', 'none');
          $delete.css('display', 'block');
          $rename.css('display', 'block');

          $delete.click(function(event) {
            $("#mymenu").slideUp(100);
            $myPopup.css('display', 'block');
            $myPopup.animate({'opacity': 1}, 600);
            $('#pop-comfirm-btn').click(function(event) {
              $this.remove();
              $myPopup.animate({'opacity': 0}, 200,function(){
                $myPopup.css('display', 'none');
              });
              $(this).unbind('click');
            });
            $('#pop-cancel-btn').click(function(event) {
              $myPopup.animate({'opacity': 0}, 200,function(){
                $myPopup.css('display', 'none');
              });
              $(this).unbind('click');
            });
            $delete.unbind('click');
          });
        }
      }
      $('#rename-file').one('click', function(event) {
        $("#mymenu").slideUp(100);
        $inputScreen.css('display', 'block');
        $inputScreen.children().children('input').eq(0).val($this.children().children('span.word').text());
        $inputScreen.animate({
          "opacity": '1'},
          1000, function() {
          
        });
      });

    });
    /*$rename.click(function(event) {
      console.log(111);
      $("#mymenu").slideUp(100);
      // console.log($this.children().children('span').text());
      // console.log(oldFile.children().children('span').text());
      $inputScreen.css('display', 'block');
      // $inputScreen.children().children('input').eq(0).val($this.children().children('span').text());
      $inputScreen.animate({
        "opacity": '1'},
        1000, function() {
        
      });
    });*/

}

//打开或下载文件
function openmydoc(path){
  var doc = new ActiveXObject("Word.Application");
  doc.visible=true;
  doc.Documents.Open(path);
}


function uploading(){
  var $deleteBtn = $('#operate-delete'),
      $uploadingBtn = $('#operate-uploading'),
      $addBtn = $('#operate-add'),
      $myPopup = $('#myPopup');

  $deleteBtn.click(function(event) {
    console.log("hello world");
    var hasChecked = false;
    $("input[name='file']").each(function(index, el) {
      var $this = $(this);
      if($this.prop('checked')){
        hasChecked = true;
        $myPopup.css('display', 'block');
        $myPopup.animate({'opacity': 1}, 600);
        if($this.parent().parent().hasClass('file')){
          $myPopup.children().children('h4').text('确认删除文件吗');
        }
        $('#pop-comfirm-btn').click(function(event) {
          console.log($this.parent().parent());
          $this.parent().parent().remove();
          $myPopup.animate({'opacity': 0}, 200,function(){
            $myPopup.css('display', 'none');
          });
          $(this).unbind('click');
        });
        $('#pop-cancel-btn').click(function(event) {
          $myPopup.animate({'opacity': 0}, 200,function(){
            $myPopup.css('display', 'none');
          });
          $(this).unbind('click');
        });
      }
    });
//    if(!hasChecked){
//      alert("未选中任何文件");
//    }
  });

}
