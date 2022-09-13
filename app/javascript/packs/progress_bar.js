document.addEventListener('turbolinks:load', function() {

  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var currentTest = progressBar.dataset.currentTest
    var allTest = progressBar.dataset.allTest

    var progressBarPercentage = document.querySelector('.progress-bar_percentage')
    var percentage = Math.round((currentTest * 100 / allTest)).toString() + '%'
    progressBarPercentage.innerHTML = percentage

    progressBar.style.width = percentage
  }

})

