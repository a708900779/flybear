$(function(){
	var firstSelect = $('#first-select'),
		secondSelect = $('#second-select'),
		tableBody = $('#table-body');

	var date = new Date();
	// addSelectOption();

	weekly();
	monthly();

	firstSelect.one('click', function(event) {
		$(this).triggerHandler('change');
	});
	firstSelect.on('change', function(event) {
		if ($('#first-select option:selected').val() == '显示一个月的日报') {
			secondSelect.css('opacity', '1');
			secondSelect.removeAttr('disabled');
			// firstSelect.after('<select id="second-select"></select>');
			$('#second-select option').remove();
			// $('#table-body tr').remove();
			for (var i = 1; i <= 31; i++) {
				// appendRows(tableBody, i+'日', '1月' ,2016 + '年');
			}

			for (var i = 0; i <= 12; i++) {
				secondSelect.append('<option>' + ( i + 1 ) + '月' + '</option>')
			}
			
		}else if ($('#first-select option:selected').val() == '显示一年的日报') {
			secondSelect.css('opacity', '0');
			secondSelect.attr('disabled', 'disabled');
			// $('#table-body tr').remove();
			var year = date.getFullYear();
			// appendYearTable( tableBody ,year );
		}
	});
	$('#second-select').on('change', function(event) {
	    // $('#table-body tr').remove();
		var year = date.getFullYear();
		// appendMonthTable( tableBody , $('#second-select option:selected').val() );
		
	});

	// appendYearTable( tableBody ,date.getFullYear() );

});

function monthly(){
	var monthlyTableBody = $('#monthly-table-body'),
		date = new Date();
	for (var i = 1; i <= 12; i++) {
		// appendMonthlyTable(monthlyTableBody,i,date.getFullYear());
	}
}

function weekly(){
	var weeklyTableBody = $('#weekly-table-body'),
		date = new Date();
	for (var i = 0; i < 53; i++) {
		// addWeeklyDay(date,weeklyTableBody,i);
	}

}

/*function addWeeklyDay(date,tableBody,week){
	var day = week * 7 +　1,
		feb = isLeapYear(date.getFullYear()) ? 29 : 28;
	console.log(feb);
	
	var startWord = '',
		endWord = '';
	if( day <= 31 ){
		startWord = '1月' + day+ '日';
		endWord = day + 5 < 31 ? '1月' + ( day + 5 ) + '日' : '2月' + (day + 5 -31) + '日';
	}else if( day <= 31 + feb ){
		day = day - 31;
		startWord = '2月' + (day) + '日';
		endWord = day + 5 < 31 ? '2月' + ( day + 5 ) + '日' : '3月' + (day + 5 -feb) + '日';
	}else if( day <= 62 + feb){
		day = day - 31 - feb;
		startWord = '3月' + (day)+ '日';
		endWord = day + 5 < 31 ? '3月' + ( day + 5 ) + '日' : '4月' + (day + 5 -31) + '日';
	}else if( day <= 92 + feb){
		day = day - 62 - feb;
		startWord = '4月' + (day)+ '日';
		endWord = day + 5 < 31 ? '4月' + ( day + 5 ) + '日' : '5月' + (day + 5 -30) + '日';
	}else if( day <= 123 + feb){
		day = day - 92 - feb;
		startWord = '5月' + (day)+ '日';
		endWord = day + 5 < 31 ? '5月' + ( day + 5) + '日' : '6月' + (day + 5 -31) + '日';
	}else if( day <= 153 + feb){
		day = day - 123 - feb;
		startWord = '6月' + (day)+ '日';
		endWord = day + 5 < 31 ? '6月' + ( day + 5) + '日' : '7月' + (day + 5 -30) + '日';
	}else if( day <= 184 + feb){
		day = day - 153 - feb;
		startWord = '7月' + (day)+ '日';
		endWord = day + 5 < 31 ? '7月' + ( day + 5) + '日' : '8月' + (day + 5 -31) + '日';
	}else if( day <= 215 + feb){
		day = day - 184 - feb;
		startWord = '8月' + (day)+ '日';
		endWord = day + 5 < 31 ? '8月' + ( day + 5) + '日' : '9月' + (day + 5 -31) + '日';
	}else if( day <= 245 + feb){
		day = day - 215 - feb;
		startWord = '9月' + (day)+ '日';
		endWord = day + 5 < 31 ? '9月' + ( day + 5) + '日' : '10月' + (day + 5 -30) + '日';
	}else if( day <= 276 + feb){
		day = day - 245 - feb;
		startWord = '10月' + (day)+ '日';
		endWord = day + 5 < 31 ? '10月' + ( day + 5) + '日' : '11月' + ( day + 5 -31) + '日';
	}else if( day <= 306 + feb){
		day = day - 276 - feb;
		startWord = '11月' + (day)+ '日';
		endWord = day + 5 < 31 ? '11月' + ( day + 5) + '日' : '12月' + (day + 5 -30) + '日';
	}else if( day <= 337 + feb){
		day = day - 306 - feb;
		startWord = '12月' + (day)+ '日';
		endWord = day + 5 < 31 ? '12月' + ( day + 5) + '日' : '1月' + (day + 5 -31) + '日';
	}
	// 增加表格的行
	appendWeeklyTable(tableBody,week,date.getFullYear(),startWord,endWord);
}
function appendMonthlyTable(TableBody,month,year){
	TableBody.append(
		'<tr>' +
          '<td>'+
            year+
          '</td>'+
          '<td>'+
            '杭州移动优化2016'+
          '</td>'+
          '<td>'+
            '张欢'+
          '</td>'+
          '<td>'+
            '第<span class="week-sign"> ' + month + '</span>月' +
          '</td>'+
          '<td>'+
            '无'+
          '</td>'+
          '<td>'+
            '<div class="week-file"><img src="static/images/copy.png" alt="">杭州移动分优化2016aaaaaaaaaaaassssssssssssssss</div>'+
          '</td>'+
        '</tr>'
    );
}
function appendWeeklyTable(TableBody,week,year,startWord,endWord){
	TableBody.append(
		'<tr>' +
          '<td>'+
            year+
          '</td>'+
          '<td>'+
            '杭州移动优化2016'+
          '</td>'+
          '<td>'+
            '张欢'+
          '</td>'+
          '<td>'+
            '第<span class="week-sign"> ' + ( week + 1 ) +'</span>周：<span>' + startWord + 
            '</span>~<span>' + endWord + '</span>  '+
          '</td>'+
          '<td>'+
            '无'+
          '</td>'+
          '<td>'+
            '<div class="week-file"><img src="static/images/copy.png" alt="">杭州移动分优化2016aaaaaaaaaaaassssssssssssssss</div>'+
          '</td>'+
        '</tr>'
    );
}
// 增加表格的行
function appendRows(target,day,month,year){
	target.append(
		'<tr>' +
         '<td>' +
         year + month +
         '</td>' +
         '<td>' +
         '杭州移动优化2016' +
         '</td> ' +
         '<td>' +
         '张欢' +
         '</td>' +
         '<td>' +
          day +
         '</td>' +
         '<td>' +
         '无' +
         '</td>' +
         '<td> ' +
         '<div class="week-file"><img src="static/images/copy.png" alt="">杭州移动分优化2016aaaaaaaaaaaassssssssssssssss</div>' +
         '</td>' +
         '</tr>'
    )
}

// 计算是否是闰年
function isLeapYear (Year) {
	if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
		return (true);
	} else { 
		return (false); 
	}
}

function appendYearTable(tableBody,year){
	var day = isLeapYear(year) ? 366 : 365,
		feb = isLeapYear(year) ? 29 : 28;

	var dayword = '';
	for (var i = 1; i <= day; i++) {
		if( i <= 31){
			dayword = '1月' + i+ '日';
		}else if( i <= 31 + feb ){
			dayword = '2月' + ( i - 31 ) + '日';
		}else if( i <= 62 + feb){
			dayword = '3月' + ( i - 31 - feb ) + '日';
		}else if( i <= 92 + feb){
			dayword = '4月' + ( i - 62 - feb ) + '日';
		}else if( i <= 123 + feb){
			dayword = '5月' + ( i - 121 - feb ) + '日';
		}else if( i <= 153 + feb){
			dayword = '6月' + ( i - 152 - feb ) + '日';
		}else if( i <= 184 + feb){
			dayword = '7月' + ( i - 182 - feb ) + '日';
		}else if( i <= 215 + feb){
			dayword = '8月' + ( i - 213 - feb ) + '日';
		}else if( i <= 245 + feb){
			dayword = '9月' + ( i - 244 - feb ) + '日';
		}else if( i <= 276 + feb){
			dayword = '10月' + ( i - 274 - feb ) + '日';
		}else if( i <= 306 + feb){
			dayword = '11月' + ( i - 305 - feb ) + '日';
		}else if( i <= 337 + feb){
			dayword = '12月' + ( i - 335 - feb ) + '日';
		}
		// 增加表格的行
		appendRows(tableBody,dayword,'',2016);
	}
	
}
function appendMonthTable(tableBody,month){
	switch($('#second-select option:selected').val()){
		case '1月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '2月':
			for (var i = 1; i <= 29; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '3月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '4月':
			for (var i = 1; i <= 30; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '5月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '6月':
			for (var i = 1; i <= 30; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '7月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '8月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '9月':
			for (var i = 1; i <= 30; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '10月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '11月':
			for (var i = 1; i <= 30; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
		case '12月':
			for (var i = 1; i <= 31; i++) {
				appendRows(tableBody, i+'日', month,2016 + '年');
			}
		  break;
	}
	
}
*/


function addSelectOption(){
	var $select1 = $('#daily-item-select1'),
		$select2 = $('#daily-item-select2'),
		date = new Date(),
		year = date.getFullYear(),
		month = date.getMonth() + 1;

	for (var i = 0; i < 24; i++) {
		if(i < 12){
			$select1.append('<option>'+ (year - 1) + '-' + ((month + i)%12 + 1) +'</option>');
			$select2.append('<option>'+ (year - 1) + '-' + ((month + i)%12 + 1) +'</option>');
		}else{
			$select1.append('<option>'+ year + '-' + ((month + i)%12 + 1) +'</option>');
			$select2.append('<option>'+ year+ '-' + ((month + i)%12 + 1) +'</option>');
		}
		
	}

	var oldSelect1 = $select1.children('option:selected'),
		oldSelect2 = $select2.children('option:selected');

	$select1.change(function(event) {
		console.log($(this).children('option:selected').val());

		var time2 = returnMonthAndYear($select2),
			time1 = returnMonthAndYear($(this));

		if(time1.year >= time2.year && time1.month > time2.month){
			console.log('1');
			alert("结束日期不能超过开始日期");
			oldSelect1.prop('selected', 'true');
		}else{
			oldSelect1 = $select1.children('option:selected');
		}


	});
	$select2.change(function(event) {
		console.log($(this).children('option:selected').val());

		var time1 = returnMonthAndYear($select1),
			time2 = returnMonthAndYear($(this));
		console.log(time1);
		console.log(time2);
		if(time1.year >= time2.year && time1.month > time2.month){
			console.log(2);
			alert("结束日期不能超过开始日期");
			oldSelect2.prop('selected', 'true');
		}else{
			oldSelect2 = $select2.children('option:selected');
		}


	});

}

function returnMonthAndYear($DOM){
	var arr = $DOM.children('option:selected').val().split("-");
	var date = {
		month : 1,
		year : 1970
	}
	date.year = arr[0] - 0;
	date.month = arr[1] - 0;

	return date;
}