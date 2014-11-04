$(document).ready(function() {
  runGame();
  $('#restart-btn').on('click', runGame);
  // $('#end-game p').append(gameWinner())
  // $('#end-game').slideDown();
});

function runGame() {
  restartGame();
   $(document).on('keyup', function(event) {
      // Detect which key was pressed and call the appropriate function
      // Google "jquery keyup what key was pressed" if you don't know how
      //player 1 : q code 80 / player2 : p code 81
      result = gameWinner();

      if (result == false) {
        if (event.which == 80){
           updatePlayerPosition('player1');
        } else if (event.which == 81){
           updatePlayerPosition('player2');
        }
      } else {
        $('#end-game p').append(result);
        $('#end-game').slideDown();
        $(document).off('keyup');
      }

    });
}

function gameWinner() {
  var raceLength = $('#player1_race td').length - 1;

  if ($('#player1_race td.active').index() == raceLength) {
    return 'player 1 wins';
  }
  else if ($('#player2_race td.active').index() == raceLength) {
    return 'player 2 wins';
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

function restartGame() {
  $('#end-game').hide();
  // Restart player1
  $('#player1_race td').removeClass('active');
  $('#player1_race td').eq(0).addClass('active');
  // Restart player2
  $('#player2_race td').removeClass('active');
  $('#player2_race td').eq(0).addClass('active');
}



// TODO: You must provide a way to restart the game, and tell who won the race
