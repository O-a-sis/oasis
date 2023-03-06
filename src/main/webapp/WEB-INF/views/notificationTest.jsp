<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <meta charset="UTF-8">
    <title>Notification Test Page</title>
</head>
<body>
    <input type="text" id="id"/>
    <button type="button" id="btn">로그인</button>
    <script src="<c:url value='/js/notification.js'/>"></script>
</body>
</html>
<script type="text/javaScript">
//     function login() {
//         const id = document.getElementById('id').value;

//         const eventSource = new EventSource('/Oasis/subscribe/' + id);

//         eventSource.addEventListener("sse", function (event) {
//             console.log(event.data);

//             const data = JSON.parse(event.data);

//             (async () => {
//                 // 브라우저 알림
//                 const showNotification = () => {
                    
//                     const notification = new Notification('알림', {
//                         body: data.content
//                     });
                    
//                     setTimeout(() => {
//                         notification.close();
//                     }, 10 * 1000);
                    
//                     notification.addEventListener('click', () => {
//                         window.open(data.url, '_blank');
//                     });
//                 }

//                 // 브라우저 알림 허용 권한
//                 let granted = false;

//                 if (Notification.permission === 'granted') {
//                     granted = true;
//                 } else if (Notification.permission !== 'denied') {
//                     let permission = await Notification.requestPermission();
//                     granted = permission === 'granted';
//                 }

//                 // 알림 보여주기
//                 if (granted) {
//                     showNotification();
//                 }
//             })();
//         });
//     }
</script>
