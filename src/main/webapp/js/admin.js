var formData = new FormData($('#fileForm')[0]);

$.ajax({ //파일 업로드 
	type: "POST",
	enctype: 'multipart/form-data',	// 필수
	url: '/multipartUpload.do',
	data: formData,		// 필수
	processData: false,	// 필수
	contentType: false,	// 필수
	cache: false,
	success: function (result) {
	},
	error: function (e) {
	}
});