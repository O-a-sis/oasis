/**
 * 
 */
 $(document).ready(function(){
 
 const id = $("#id").val();
 console.log(id);
 
 if(id!==''){
  const eventSource = new EventSource('/Oasis/subscribe/' + id);

        eventSource.addEventListener("sse", function (event) {
            console.log(event.data);
            if(!event.data.includes("EventStream")){
            const data = JSON.parse(event.data);
            
            if(data.receiver!==undefined){
            (async () => {
                // 브라우저 알림
                const showNotification = () => {
                    
                    const notification = new Notification('알림', {
                        body: data.content
                    });
                    
                    setTimeout(() => {
                        notification.close();
                    }, 10 * 1000);
                    
                    notification.addEventListener('click', () => {
                        location.href = data.url;
                    });
                    
                    console.log(notification);
                }

                // 브라우저 알림 허용 권한
                let granted = false;
                if (Notification.permission === 'granted') {
                    granted = true;
                } else if (Notification.permission !== 'denied') {
                    let permission = await Notification.requestPermission();
                    granted = permission === 'granted';
                }

                // 알림 보여주기
                if (granted) {
                    showNotification();
                }
            })();
            }
           }
        });
     }
});
