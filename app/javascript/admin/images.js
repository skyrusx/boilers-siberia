function displaySelectedImage(event, elementId) {
    const selectedImage = document.getElementById(elementId);
    const fileInput = event.target;

    if (selectedImage == null) {
        var image = window.URL.createObjectURL(fileInput.files[0]);
        console.log(image)
        $(".img-thumbnail").empty().append("<img id='selected_image' src="+image+">");
    } else {
        if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();

            reader.onload = function(e) {
                selectedImage.src = e.target.result;
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    }
}
