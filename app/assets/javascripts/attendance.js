function bookDate(user, dateObject) {
  let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  fetch('/attendances', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      },
      body: JSON.stringify({ user: user, date: dateObject }),
    })
}


