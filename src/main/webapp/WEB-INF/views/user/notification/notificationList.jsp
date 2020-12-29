<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<style>
	.row{
		width : 1300px;	
		margin-left : auto;
		margin-right : auto;
	}
</style>
<script>
	$(function(){
		$("button[name^='delBtn']").on("click", function(){
			var del = $(this).val();
			if(confirm("삭제 하시겠습니까?")){
				document.location="/user/deleteNotification?notifyId="+del;
			}else{
				return;
			}
		})
	})
</script>
<div class="row">

        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">알림 목록</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">알림 내용</th>
                    <th scope="col">발신자</th>
                    <th scope="col">알림 날짜</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                
				<tbody id="pointList">
					<c:forEach items="${notifyList}" var="notify">
						<c:if test="${notify.senderId != MEMBER_INFO.userId}">
			         	  <tr>
				              <td>
				                <span class="badge badge-dot mr-4">
				               	 ${notify.notifyCont}
						  		</span>
							  </td>
							  <td>
							    <span class="badge badge-dot mr-4">
							    	 ${notify.senderId}
							    </span>
						  	  </td>
						  	  <td>
							     <span class="badge badge-dot mr-4">
							 	   ${notify.notifyDate}
							    </span>
							  </td>
							  <td>
							     <span class="badge badge-dot mr-4">
							 	   <button type="button" name="delBtn" id="delBtn" value="${notify.notifyId}">삭제</button>
							      </span>
							  </td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
              </table>
            </div>
            </div>
            </div>
</div>