const scriptURL = 'https://script.google.com/macros/s/AKfycbwAnJrujtWZcL3QVoaZAjjP_PvnHCM_g-xYB8CvIeQ_gJEgLD3Mcn6pcYgDKHBU6ybs/exec';
const form = document.getElementById('content-form');

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
                alert("Thank you Joining Info Era Software Services Pvt.Ltd !!! Your form is submitted successfully.");
                window.location.reload();
            } else {
                console.error('Error!', data.message);
            }
        })
        .catch(error => console.error('Error!', error.message));
});
