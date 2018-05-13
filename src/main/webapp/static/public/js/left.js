$(document).ready(function(){
    window.topURL = {
        report: ''
    }
   gainUrl();
});
function gainUrl(word){
    var r = /[\w/\-:]+index#/g,
        url = window.location.href,
        newURL = '';
    newURL = r.exec(url);
    var $navs = $('#nav-menu>li');
    $navs.each(function(index, el) {
        if($(this).children('a').text() == '报表管理'){
            topURL.report = newURL + (index + 1);
        }
    });
}
// function jump(){
    
//     setTimeout('hideDOM()',10);
    
// }

// function hideDOM(){
//     $('#left-menu-item .panel').each(function(index, el) {
//         $this = $(this);
//         var title = $this.children('.panel-header').children('.panel-title').text(),
//            r2 = /admin$/g;
//         console.log(title);
//         if (r2.test(title)) {
//             console.log($this);
//             // $this.remove();
//             $this.css('opacity', '0');
//             $this.attr('disabled', 'true');
//         }

//    });
// }