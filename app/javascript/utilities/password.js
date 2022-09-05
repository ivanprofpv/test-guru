document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password != null && password_confirmation != null) {
    password.addEventListener('input', addNotification)
    password_confirmation.addEventListener('input', addNotification)
  }
})

function addNotification() {
  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value
  var icon = document.querySelector('.octicon-check')
  if (password_confirmation == ''){
    icon.classList.add('confirmation-bad')
    icon.classList.add('hide')
    return
  }
  if (password === password_confirmation) {
    icon.classList.remove('confirmation-bad')
    icon.classList.remove('hide')

  } else {
    icon.classList.add('confirmation-bad')
    icon.classList.remove('hide')
  }
}
