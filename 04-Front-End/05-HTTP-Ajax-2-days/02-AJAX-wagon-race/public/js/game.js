$(document).ready(function() {

  var sessionId = 0;

  $.get('/session/create', function(data) {
    sessionId = data.id;
    $('#new-game').css('display', 'block');
  });

  $('#start-game-btn').click(function(e) {
    e.preventDefault();
    $('#new-game').hide();
    $('#players-names').show();
  });

  $('#submit-btn').click(function(e) {
    e.preventDefault();
    var name1 = $('#player1Name').val();
    var name2 = $('#player2Name').val();
    var url = "/session/" + sessionId + "/game/create";
    var stringJSON = JSON.stringify({
        "players": [
        { "name": name1 },
        { "name": name2 }
        ]
      });

    $.post(url, stringJSON, function(data) {
      var gameId = data.game.id
      $('#players-names').hide();
      runGame(gameId);
    });
  });
});


function runGame(id) {
  $('#racer_table').show();
  var timeInit = $.now();
  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    //player 1 : q code 80 / player2 : p code 81

    result = gameWinner();

    if (result == false) {
      if (event.which == 80){
         updatePlayerPosition('player1');
      } else if (event.which == 81) {
var winnerName = data.game.players[hash.game.winner -1 ].name      }
    } else {
      var timeElapsed = ($.now() - timeInit)/1000;
      var  url = "/game/" + id + "/finish";
      var stringJSON = JSON.stringify( {
        "winner": result,
        "elapsed_time": timeElapsed
      });
      var text = ""

      $.post(url, stringJSON, function(data) {
        $.get("/game/" + id + "/results", function(data) {
          var index = data.game.winner - 1;
          var winnerName = data.game.players[index].name;
          text = winnerName + " won the game - time elapsed:" + timeElapsed;
          $('#end-game p').text(text);
          $('#end-game').slideDown();
          $(document).off('keyup');
        });
      });

      $("#restart-btn").click(function(e) {

      });

    }
  });
}

function gameWinner() {
  var raceLength = $('#player1_race td').length - 1;

  if ($('#player1_race td.active').index() == raceLength) {
    return 1;
  }
  else if ($('#player2_race td.active').index() == raceLength) {
    return 2;
  }
  else {
    return false;
  }
}


function updatePlayerPosition(player) {
  var index = $('#' + player + '_race').find('.active').index();
  $('#' + player + '_race td').eq(index).removeClass('active');
  $('#' + player + '_race td').eq(index + 1).addClass('active');
}

// function restartGame() {
//   $('#end-game').hide();
//   // Restart player1
//   $('#player1_race td').removeClass('active');
//   $('#player1_race td').eq(0).addClass('active');
//   // Restart player2
//   $('#player2_race td').removeClass('active');
//   $('#player2_race td').eq(0).addClass('active');
// }



// TODO: You must provide a way to restart the game, and tell who won the race
