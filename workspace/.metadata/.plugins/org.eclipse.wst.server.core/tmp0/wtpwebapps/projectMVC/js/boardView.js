$(function(){
	$.ajax({
		type: 'post',
		url: '/projectMVC/board/getBoardView.do',
		data: 'seq=' + $('#seq').val(),
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if($('#memId').val() == data.id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();
			//자기가 작성한 글인지 확인하기
			//만약 내가 작성한 글이 맞다면 boardViewSpan 보이기
		},
		error: function(err){
			console.log(err);
		}
	});
});
//글수정 - 수정한 페이지번호를 보여준다
$('#boardUpdateFormBtn').click(function(){
	$('#boardViewForm').attr('action', '/projectMVC/board/boardUpdateForm.do');
	$('#boardViewForm').submit(); //seq, pg만 넘어감 (name속성)
});

//글삭제 - 삭제한 후에는 1페이지를 보여준다
$('#boardDeleteFormBtn').click(function(){
	if(confirm('정말로 삭제 하시겠습니까?')){
	$.ajax({
		type: 'post',
		url: '/projectMVC/board/boardDelete.do',
		data: 'seq=' + $('#seq').val(),
		dataType: 'text',
		success: function(data){
			if(data.trim() == 'ok'){
				alert("작성하신 글을 삭제하였습니다.");
				location.href = "/projectMVC/board/boardList.do?pg=1";
			}
		},
		error: function(err){
			console.log(err);
		}
	});
	}//if

});

//답글
$('#boardReplyFormBtn').click(function(){
	$('#boardViewForm').attr('action', '/projectMVC/board/boardReplyForm.do');
	$('#boardViewForm').submit(); //seq, pg만 넘어감 (name속성)
});








