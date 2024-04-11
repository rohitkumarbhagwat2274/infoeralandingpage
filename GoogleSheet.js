const scriptURL = 'https://script.google.com/macros/s/AKfycbwAnJrujtWZcL3QVoaZAjjP_PvnHCM_g-xYB8CvIeQ_gJEgLD3Mcn6pcYgDKHBU6ybs/exec';
const form = document.getElementById('content-form');
const popupForm = document.getElementById('popup-form'); // Assuming the popup form has the ID 'popup-form'

form.addEventListener('submit', e => {
    e.preventDefault();

    fetch(scriptURL, { method: 'POST', body: new FormData(form) })
        .then(response => {
            if (response.ok) {
                console.log("done");
                return response.json();
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            if (data) {
                alert("Thank you for joining Info Era Software Services Pvt.Ltd! Your form has been submitted successfully.");
                // Hide the form and all related popup elements after successful submission
                form.style.display = "none";
                popupForm.style.display = "none"; // Hide the popup form
                // You may need to add additional code here to hide other popup elements if needed
            } else {
                console.error('Error!', data.message);
            }
        })
        .catch(error => console.error('Error!', error.message));
});
