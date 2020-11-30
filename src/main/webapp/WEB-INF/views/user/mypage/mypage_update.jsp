<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <!-- Main css -->

<html>
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style2.css">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<script>

$(document).ready(function(){
	$('#pictureViewImg').attr('src', '${cp }/mypage/profileImg?userId=${userVo.userId}');  
	
	// picture input의 파일 변경시 이벤트 
	$("#picture").change(function(){
	   readURL(this);
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
	  
		reader.onload = function (e) {
			$('#pictureViewImg').attr('src', e.target.result);  
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>


<body>
  <div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
<!--       <h2 class="mb-5">My Account Card</h2> -->
<form  action="${cp}/mypage/updateUser" method="POST" enctype="multipart/form-data">
      <div class="row">
        <div class="col-xl-8 m-auto order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
            
            <!-- 프로필 이미지 -->
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                   <img  id="pictureViewImg" src="${cp }/mypage/profileImg?userId=${userVo.userId}" /><br>
                  </a>
                </div>
              </div>
            </div>
            
            
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">EDIT PROFILE</h3>
                </div>
                <div class="col-4 text-right">
<!--                   <a href="#!" class="btn btn-sm btn-primary"> -->
                  <input id="picture" type="file" name="file" value="${userVo.userProfile }" accept=".gif, .jpg, .png" >
                  <input type="submit"  class="btn btn-sm btn-primary" value="EDIT">
                </div>
              </div>
            </div>
            
            <div class="card-body">
              <br><br>
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-username">USERID</label>
                        <input type="text" id="input-email" name="userId" class="form-control form-control-alternative" placeholder="jesse@example.com" value="${userVo.userId }" READONLY>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">USERNAME</label>
                         <input type="text" id="input-username" class="form-control form-control-alternative" placeholder="username" name="userNm" value="${userVo.userNm }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">USERPASSWORD</label>
                        <input type="password" id="input-first-name" class="form-control form-control-alternative" placeholder="password" name="userPass" value="${userVo.userPass }">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">USERTEL</label>
                        <input type="text" id="input-last-name" class="form-control form-control-alternative" name="userTel" placeholder="usertel" value="${userVo.userTel}">
                      </div>
                    </div>
                  </div>
                </div>
      
                </div>
            </div>
          </div>
        </div>
        </form>
      </div>
    </div>
   
<!--   <footer class="footer"> -->
<!--     <div class="row align-items-center justify-content-xl-between"> -->
<!--       <div class="col-xl-6 m-auto text-center"> -->
<!--         <div class="copyright"> -->
<!--           <p>Made with <a href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Argon Dashboard</a> by Creative Tim</p> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!-- <!--   </footer> --> -->
</body>


</html>