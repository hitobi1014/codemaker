<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <!-- Main css -->
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">

<html>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<script>


</script>


<body>

  <div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
<!--       <h2 class="mb-5">Profile Card</h2> -->
      <div class="row">
        <div class="col-xl-8 m-auto order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                   <img src="${cp }/mypage/profileImg?userId=${userVo.userId}"/><br>
                  </a>
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
                <a href="#" class="btn btn-sm btn-info mr-4">Connect</a>
                <a href="#" class="btn btn-sm btn-default float-right">Message</a>
              </div>
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                    <div>
                      <span class="heading">22</span>
                      <span class="description">Friends</span>
                    </div>
                    <div>
                      <span class="heading">10</span>
                      <span class="description">Photos</span>
                    </div>
                    <div>
                      <span class="heading">89</span>
                      <span class="description">Comments</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h3>
                 <i class="ni location_pin mr-2"></i><label class="control-label" >${userVo.userNm }</label><br>
                  <i class="ni location_pin mr-2"></i><label class="control-label" >${userVo.userId }</label><br>
                  <i class="ni education_hat mr-2"></i><label id="userTel" class="control-label" >${userVo.userTel }</label>
                </h3>
                <div class="h5 mt-4">
                </div>
                <div class="h5 mt-4">
<!--                   <i class="ni business_briefcase-24 mr-2"></i>Solution Manager - Creative Tim Officer -->
                </div>
                <div>
<!--                   <i class="ni education_hat mr-2"></i>University of Computer Science -->
                </div>
                <hr class="my-4">
                <p>CODEMAKER</p>
                           <a href="${cp }/mypage/updateUser?userId=${userVo.userId}" class="btn btn-info">Edit profile</a>
                           <a href="${cp }/mypage/deleteUser" class="btn btn-info">회원탈퇴</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="footer">
    <div class="row align-items-center justify-content-xl-between">
      <div class="col-xl-6 m-auto text-center">
        <div class="copyright">
          <p>Made with <a href="https://www.creative-tim.com/product/argon-dashboard" target="_blank">Argon Dashboard</a> by Creative Tim</p>
        </div>
      </div>
    </div>
  </footer>
</body>


</html>