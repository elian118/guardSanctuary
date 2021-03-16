<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!-- webapp가 루트이므로, value="컨텍스트명/resources/" -->
<c:set var = "path" value = "/guardSanctuary/resources/" />
<script type = "text/javascript" src = "${path}js/jquery-3.5.1.min.js"></script>
<script type = "text/javascript" src = "${path}js/script.js"></script>

<!-- wc3 부트스트랩 코드 -->
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Mamba 부트스트랩 코드 -->
<!-- Favicons -->
<link href="${path}assets/img/favicon.png" rel="icon">
<link href="${path}assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${path}assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${path}assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${path}assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${path}assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${path}assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${path}assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${path}assets/css/style.css" rel="stylesheet">

<!-- =======================================================
* Template Name: Mamba - v4.0.2
* Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->