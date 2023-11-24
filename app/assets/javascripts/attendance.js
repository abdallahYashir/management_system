function bookDate(user, dateObject) {
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


