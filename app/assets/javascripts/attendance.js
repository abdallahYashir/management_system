
console.log('attendance.js loaded')

function bookDate(user, dateObject) {
  // Your code here
  // alert('test')
  console.log(`user: ${user}`)
  console.log(`dateObject: ${dateObject}`)

  let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  fetch('/attendances', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      },
      body: { user: user, date: dateObject },
    })
}

document.addEventListener('DOMContentLoaded', function() {
  // Your code here
  document.querySelectorAll('td').forEach(function(td) {
    td.addEventListener('click', function() {
      var date = this.id.split('-')[1];

      console.log(`this: ${JSON.stringify(this)}`)
      console.log(`this.id: ${this.id}`)
      console.log('The date for this cell is: ' + date)
  
      // alert('The date for this cell is: ' + date)
  
      // fetch('/your-endpoint', {
      //   method: 'POST',
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: JSON.stringify({ date: date }),
      // })
      // .then(response => response.json())
      // .then(data => console.log(data))
      // .catch((error) => console.error('Error:', error));
    });
  });
});

