<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>
+<%@ taglib prefix="user" tagdir="/WEB-INF/tags/user"%>

<!doctype html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><html lang="en" class="no-js"> <![endif]-->
<html lang="en">
<head>
  
  <!-- Basic -->
  <title>Buy conference tickets</title>
  
  <!-- Define Charset -->
  <meta charset="utf-8">
  
  <!-- Responsive Metatag -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- Page Description and Author -->
  <meta name="description" content="Margo - Responsive HTML5 Template">
  <meta name="author" content="ZoOm Arts">
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <user:pageJavaScriptAndCss/>

</head>
<body>

	<!-- Container -->
	<div id="container">

        <user:header/>

<!-- Start Content -->
<div id="content">
 <div class="container">
  <div class="row blog-post-page">
   <div class="col-md-9 blog-box">

    <!-- Start Single Post Area -->
    <div class="blog-post gallery-post">
	
    <!-- Start Single Post Content -->
    <div class="post-content">
        <h2>Buy conference tickets</h2>
        <p>
        <p>The conference fee is <strong>100</strong>.00 BGN (VAT included).</p>

        <%--Buy a ticket:--%>
        <%--<a href="/tickets/register">Buy</a>--%>
        <form action="${DEMO_epayUrl}" method=post>
            <input type="hidden" name="PAGE" value="paylogin">
            <input type="hidden" name="ENCODED" value="${DEMO_ENCODED}">
            <input type="hidden" name="CHECKSUM" value="${DEMO_CHECKSUM}">
            <input type="hidden" name="URL_OK" value="http://jprime.io/tickets/result/ok">
            <input type="hidden" name="URL_CANCEL" value="http://jprime.io/tickets/result/ok">
            <input type="submit" value="DEMO Buy a ticket from epay.bg (if you have an epay account)"/>
        </form>
        <form action="${DEMO_epayUrl}" method=post>
            <input type="hidden" name="PAGE" value="credit_paydirect">
            <input type="hidden" name="LANG" value="en">
            <input type="hidden" name="ENCODED" value="${DEMO_ENCODED}">
            <input type="hidden" name="CHECKSUM" value="${DEMO_CHECKSUM}">
            <input type="hidden" name="URL_OK" value="http://jprime.io/tickets/result/ok">
            <input type="hidden" name="URL_CANCEL" value="http://jprime.io/tickets/result/ok">
            <input type="submit" value="DEMO Buy a ticket from epay.bg (if you want to pay with a credit card directly)"/>
        </form>
        <form action="${epayUrl}" method=post>
            <input type="hidden" name="PAGE" value="paylogin">
            <input type="hidden" name="ENCODED" value="${ENCODED}">
            <input type="hidden" name="CHECKSUM" value="${CHECKSUM}">
            <input type="hidden" name="URL_OK" value="http://jprime.io/tickets/result/ok">
            <input type="hidden" name="URL_CANCEL" value="http://jprime.io/tickets/result/ok">
            <input type="submit" value="REAL (1lv) Buy a ticket from epay.bg (if you have an epay account)"/>
        </form>
        <form action="${epayUrl}" method=post>
            <input type="hidden" name="PAGE" value="credit_paydirect">
            <input type="hidden" name="LANG" value="en">
            <input type="hidden" name="ENCODED" value="${ENCODED}">
            <input type="hidden" name="CHECKSUM" value="${CHECKSUM}">
            <input type="hidden" name="URL_OK" value="http://jprime.io/tickets/result/ok">
            <input type="hidden" name="URL_CANCEL" value="http://jprime.io/tickets/result/ok">
            <input type="submit" value="REAL (1lv) Buy a ticket from epay.bg (if you want to pay with a credit card directly)"/>
        </form>

        <p>In case of questions, contact us at <a href="mailto:conference@jprime.io">conference@jprime.io</a>.</p>
</div>
 <!-- End Single Post Content -->
 
</div>
<!-- End Single Post Area -->

</div>



<user:sidebar/>

</div>

</div>
</div>
<!-- End content -->


        <user:footer/>
</div>
<!-- End Container -->

<!-- Go To Top Link -->
<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

<div id="loader">
 <div class="spinner">
  <div class="dot1"></div>
  <div class="dot2"></div>
</div>
</div>



</body>
</html>