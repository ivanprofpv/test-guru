document.addEventListener('turbolinks:load', function() {

  var timerSelector = document.querySelector('.timer')

  if (timerSelector) {
    timer = timerSelector.dataset.timer
    function startTime() {
      if (timer > 60) {
        timerSelector.innerHTML = Math.round(timer/60)
      } else 
      if (timer <= 0) {
        window.location.href = window.location.href + '/result'
        return
      }
      setTimeout(startTime, 1000);
      timer --
    }
    startTime();
    }
  })
