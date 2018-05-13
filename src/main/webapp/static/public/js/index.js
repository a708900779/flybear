$(document).ready(function(){

    addUrl();
    addOtherPageUrl();
    gainUrl();
    indexCheckLinkage();

   /*$('#left-menu-item').each(function(index, el) {
       var title = $(this).children('.panel-title').text(),
           r2 = /admin$/g;
        if (r2.test(title)) {
            $(this).children('.panel').remove();
        }

   });*/
});
function indexCheckLinkage(){
    var $thirdpart = $('#thirdpart-radio'),
        $factory = $('#factory-radio'),
        $design = $('#design-radio');

    // $thirdpart.click(function(event) {
    //     $('#q_office').combobox({
    //         url:'${z:u("pulldown/office/list")}?ui=three',
    //     });
    //     console.log($('#q_office'));
    //     $('#q_office').combobox('reload','${z:u("pulldown/office/list")}?ui=three');

    // });

}

function addOtherPageUrl(){
    var $addReportUrl = $('.add-report-page-url');
    $addReportUrl.each(function(index, el) {
        $(this).attr('href', topURL.report + $(this).attr('href'));
    });
}

function addUrl(){
    var url = window.location.href,
        adminHref = $('#admin-a'),
        addHref = $('.add-new-href'),
        userHref = $('#user-a'),
        threeA = $('#three-a'),
        newURL = "",
        adminURL,
        userURL,
        r1 = /[^#]+#\d+/g;

    newURL = r1.exec(url);
    adminURL = newURL + adminHref.attr('href');

    adminHref.attr('href', adminURL);

    userURL = newURL + userHref.attr('href');
    userHref.attr('href',userURL);

    addHref.each(function(index, el) {
        $(this).attr('href', '');
        $(this).attr('href', newURL + $(this).attr('data'));
    });

    $('#three-a li').each(function(index, el) {
        $(this).children('a').attr('href', newURL + $(this).children('a').attr('href'));        
    });
}