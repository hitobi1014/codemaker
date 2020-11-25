<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/user/signup/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/css/user/signup/style.css">
    
    
    
</head>

<style>

</style>


<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">CODE MAKER<br>
                        					회원가입</h2>
                        <form method="POST" class="register-form" id="register-form">
		
							<div class="input-group mb-3">
								<div class="mailbox-attachments clearfix"
									style="text-align: center; width: 100%;">
									<div class="mailbox-attachment-icon has-img" id="pictureView"
										style="border: 1px solid green; height: 100px; width: 100px; margin: 0 auto;">
										<img id="pictureViewImg" style="width: 100%; height: 100%;" />
									</div>
									<div class="mailbox-attachment-info">
										<div class="input-group input-group-sm">
											<input id="picture" class="form-control" type="file"
												name="realFile" accept=".gif, .jpg, .png"
												style="height: 37px;" />
										</div>
									</div>
								</div>
								<br />
							</div>


							<div class="form-group">
                                <label for="userid"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userid" id="userid" placeholder="ID"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                             <div class="form-group">
                              <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Name"/>
                            </div>
                            <div class="form-group">
                              <label for="tel"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="tel" id="tel" placeholder="Tel"/>
                            </div>
                            <div class="form-group">
								<dt>가입하면 <strong>이용 약관</strong> 및 <strong>개인정보</strong> 수집 및 활용에 &nbsp;&nbsp;<strong>동의</strong>하게 됩니다.
								</dt>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="/images/codemaker_logo3.png" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>


    </div>

    <!-- JS -->
    <script src="/vendor/user/signup/jquery/jquery.min.js"></script>
    <script src="/js/user/signup/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>