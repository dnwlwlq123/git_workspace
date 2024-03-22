$(function(){
	$.ajax({
		type: 'post',
		url: '/projectMVC/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			console.log(data.list[0].subject);
			
			$.each(data.list, function(index, items){
				
				
				$('<tr/>').append($('<td/>',{
					align: 'center', 
					text: items.seq
					
				})).append($('<td/>',{}).append($('<a/>',{
					text: items.subject,
					class: 'subjectA  subjectA_'+items.seq
					
				}))
				
				).append($('<td/>',{
					align: 'center',
					text: items.id
					
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
					
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
					
				})).appendTo($('#boardListTable')); 
				
				/*var result =  `<tr>`  
							+ `<td align='center'>` + items.seq + `</td>` 
							+ `<td>` + items.subject + `</td>` 
							+ `<td align='center'>` + items.id + `</td>` 
							+ `<td align='center'>` + items.hit + `</td>` 
							+ `<td align='center'>` + items.logtime + `</td>`    
							+ `</tr>`;
				$('#boardListTable').append(result);*/     
				
				//답글
				//1. lev만큼 안으로 들어간다.
				//2. subject 앞에 이미지를 붙인다.
				 for (var i = 1; i < items.lev; i++) {
         	
          			$('.subjectA_' + items.seq).before('&emsp;');
        		}

        		if (items.pseq != 0) {
          
          		$('.subjectA_' + items.seq).before($('<img src="../image/reply.gif" alt="reply">' + items.subject));
        	}
		           
			}); //each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.pagingHTML);
			
			//제목을 클릭 했을 때 로그인 여부
			$('.subjectA').click(function(){
				if($('#memId').val() == ''){
					alert('먼저 로그인 하세요');
					location.href = '/projectMVC/member/loginForm.do';
				}else{
					var seq = $(this).parent().prev().text();
					var pg = $('#pg').val();
					location.href = '/projectMVC/board/boardView.do?seq='+seq+'&pg='+pg;
				}
					
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});