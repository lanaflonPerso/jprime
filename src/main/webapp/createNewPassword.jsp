<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/user"%>

<!doctype html>
<html lang="en">
<head>

    <!-- Basic -->
    <title>Reset Password</title>

    <meta charset="utf-8">

    <!-- Responsive Metatag -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%--    <jsp:directive.include file="theme-colors.jsp" />--%>

    <!-- Page Description and Author -->

    <user:pageJavaScriptAndCss/>

</head>
<body>


<user:header/>

<!-- Page Banner Start -->
<div id="page-banner-area" class="page-banner">
    <div class="page-banner-title">
        <div class="text-center">
            <h2>Pick a new password</h2>
        </div>
    </div>
</div>
<!-- Page Banner End -->


<section id="about" class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <p>
                <p>
                <form:form modelAttribute="changePassword" action="/createNewPassword" method="post" enctype="multipart/form-data">
                    <div class="form-wrapper">
                        <label for="password">Password *</label><br/>
                        <input type="password" name="password" id="password"><br/>
                        <form:errors path="password"/>
                    </div>
                    <div class="form-wrapper">
                        <label for="cpassword">Confirm password *</label><br/>
                        <input type="password" name="cpassword" id="cpassword"><br/>
                        <form:errors path="cpassword"/>
                    </div>
                    <input type="hidden" name="tokenId"
                           value="${tokenId}" />
                    <p><strong>${error_msg}</strong></p>
                    <br/>
                    <input type="submit" value="Submit" class="btn">
                </form:form>
                </p>
            </div>
        </div>
    </div>
</section>


<user:footer/>



</body>
</html>
