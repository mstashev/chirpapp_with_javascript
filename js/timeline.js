var test = getTimeline()

function getTimeline() {
  fetch('https://chirpyapp.herokuapp.com/timeline', {
    // Method is set as a post.
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then(function(response) {
    if(response.ok) {
      return response.json();
    }
    throw new Error('Network response was not ok.')
  })
  .then(function(timeline) {
    console.log(timeline)
    renderTimeline(timeline)
  })
  .catch(function(error) {
    console.log('There has been a problem with your fetch operation: ' + error.message)
  });
}

function renderTimeline(timeline) {
  timeline.forEach(function(timeline) {
    var time = moment(timeline.created_at).format("MMMM Do YYYY, h:mm:ss a");

    var message = `<div class="chirpies col-sm-8">
      <img class="avatar" src="${timeline.user.avatar_url}">
      <section>
        <div class="message-box">
          <div class="info-row">
            <h4>${timeline.user.name}</h4>
            <button type="button" class="btn btn-info">
              <span id="follow" data-id="${timeline.user.id}" class="glyphicon glyphicon-plus" aria-hidden="true"></span> Follow
            </button>
          </div>
          <div class="message-row">
            <h5>${timeline.body}</h5>
            <h6 class="date">${time}</h6>
          </div>
        </div>
      </section>
    </div>`;
    document.querySelector('#posts').innerHTML += message;
  });
}
