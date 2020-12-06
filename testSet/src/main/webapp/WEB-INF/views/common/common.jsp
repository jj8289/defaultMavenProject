<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="/jj/resources/favicon2.ico"> 
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page.css">       --%>
<script src="https://code.jquery.com/jquery-2.2.1.min.js" type="text/javascript"></script>  

<script>
var CONTEXT_PATH = "${pageContext.request.contextPath}";
 
function goHome(){ 
	location.href = CONTEXT_PATH + "/";
}
</script>