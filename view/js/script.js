/**
 * This is the javascript for the website
 * @author Laurent Yu
 */

/**
 *
 */

var standing;//keep information about the standing
var year; //keep information about the year of the race or standing
var race; //keep information about a race

/**
 * @function
 * @description EVENT ready - implements functions
 */
$(document).ready(function(){
  console.log("jQuery est prêt !");

  /**
   * @function
   * @description EVENT click - pop up the selection form for f1 standing
   */
  $('#select').click(function(){
    $('#form_f1_selection').css({"display":"block"});
  });

  /**
   * @function
   * @description EVENT click - pop up the selection form for f1
   */
  $('#select_race').click(function(){
    $('#form_f1_selection').css({"display":"block"});
    $('#race').empty();
    $('#error_message').empty();
  });

  /**
   * @function
   * @description EVENT click - close the form
   */
  $('span.close').click(function(){
    $('#form_f1_selection').css({"display":"none"});
  });

  /**
   * @function
   * @description EVENT click - get the selected year then call function to have the year
   */
  $('#selected_year').click(function(){
    $('#form_f1_selection').css({"display":"none"});
    console.log($('#year').val());
    year = $('#year').val();
    function_load_standings_f1();
  });

  /**
   * @function
   * @description EVENT change - get the selected year then call function races in this year
   */
  $('#year_race').change(function(){
    if($('#year_race').val() == "")
    {
      $('#error_message').html('year missing');
    }
    else
    {
      $('#error_message').empty();
      console.log($('#year_race').val());
      year = $('#year_race').val();
      function_load_races_in_season_f1();
    }
  });

  /**
   * @function
   * @description EVENT click - get the other standing
   */
  $('#standing_input').click(function(){
    console.log($('#standing_input')[0].checked);
    if($('#standing_input')[0].checked)
    {
      standing = 'constructor';
      $('#change_standing').empty();
      $('#change_standing').html("Change Standings to Driver");
    }
    else
    {
      standing = 'driver';
      $('#change_standing').empty();
      $('#change_standing').html("Change Standings to Constructor");
    }
    function_load_standings_f1();
  });

  /**
   * @function
   * @description EVENT click - get the result of the race
   */
  $('#selected_race').click(function(){
    if($('#race').val() == null)
    {
      $('#error_message').html('data missing');
    }
    else
    {
      $('#form_f1_selection').css({"display":"none"});
      race = $('#race').val();
      console.log($('#race').val());
      function_load_race_f1();
    }
  });

  /**
   * @function
   * @description EVENT click - if you click outside of the form. it will close the form
   * @param e - the event
   */
  var form_f1 = document.getElementById('form_f1_selection');
  $(window).on("click",function(e) {
      if(e.target == form_f1){
        form_f1.style.display = "none";
      };
  });

  /**
   * @function
   * @description EVENT click - get the result of the race
   */
  $('#select_race_nascar').click(function(){
    $('#form_nascar_selection').css({"display":"block"});
    $('#race_nascar').empty();
  });

  /**
   * @function
   * @description EVENT change - get races of the year of nascar
   */
  $('#year_race_nascar').change(function(){
    console.log($('#year_race_nascar').val());
    if($('#year_race_nascar').val() == "")
    {
      $('#error_message').html('year missing');
    }
    else
    {
      $('#error_message').empty();
      year = $('#year_race_nascar').val();
      function_load_race_nascar();
    }
  });
});

/**
 * @function function_load_standings_f1
 * @description get f1 standing of the year driver or constructor from the API Ergast
 */
function function_load_standings_f1(){
  var adresse;
  if(standing == null || year == null)
  {
    adresse = 'http://ergast.com/api/f1/current/driverStandings.json'
    standing = 'driver';
  }
  else
  {
    adresse = 'http://ergast.com/api/f1/'+ year + '/'+standing+'Standings.json'
  }
  $.ajax({
      url : adresse,
      type : 'GET',
      dataType : 'jsonp',
      success : function(data){
        console.log(data);
        $('#titre').empty();
        $('#tableau').empty();
        if(data.MRData.total == 0)
        {
          $('#titre').html("No result");
        }
        else
        {
          if(standing == 'driver')
          {
            year = data.MRData.StandingsTable.StandingsLists[0].season;
            $('#titre').html("Formula 1 Driver Standings season : " + data.MRData.StandingsTable.StandingsLists[0].season + " after round : " + data.MRData.StandingsTable.StandingsLists[0].round );
            var lignes_tableau ="";
            lignes_tableau += "<div class='container'>";
            lignes_tableau += "<table class='table'><thead><tr><th>Position</th><th>NO</th><th>Driver</th><th>Team</th><th>Win(s)</th><th>Points</th></tr></thead><tbody>";

            data.MRData.StandingsTable.StandingsLists[0].DriverStandings.forEach(function(element){
              lignes_tableau += "<tr>";
              lignes_tableau += "<th>" + element.positionText + "</th>";

              if(element.Driver.permanentNumber == null){
                lignes_tableau += "<th>N/A</th>";
              }
              else {
                lignes_tableau += "<th>" + element.Driver.permanentNumber + "</th>";
              }
              lignes_tableau += "<th>" + "<a class='driver' id='" + element.Driver.driverId + "' href='"+ element.Driver.url +"'>" + element.Driver.givenName + " " + element.Driver.familyName + "</a>" + "</th>";
              lignes_tableau += "<th>" + "<a class='constructor' id='" + element.Constructors[0].constructorId + "' href='"+ element.Constructors[0].url +"'>" + element.Constructors[0].name + "</a>" + "</th>";
              lignes_tableau += "<th>" + element.wins + "</th>";
              lignes_tableau += "<th>" + element.points + "</th>";
              lignes_tableau += "</tr>";
            });
            lignes_tableau += "</tbody>";
            lignes_tableau += "</table>";
            lignes_tableau += "</div>";
            $('#tableau').html(lignes_tableau);
          }
          else
          {
            year = data.MRData.StandingsTable.StandingsLists[0].season;
            $('#titre').html("Formula 1 Constructor Standings season : " + data.MRData.StandingsTable.StandingsLists[0].season + " after round : " + data.MRData.StandingsTable.StandingsLists[0].round );
            var lignes_tableau ="";
            lignes_tableau += "<div class='container'>";
            lignes_tableau += "<table class='table'><thead><tr><th>Position</th><th>Name</th><th>Nationality</th><th>Win(s)</th><th>Points</th></tr></thead><tbody>";

            data.MRData.StandingsTable.StandingsLists[0].ConstructorStandings.forEach(function(element){
              lignes_tableau += "<tr>";
              lignes_tableau += "<th>" + element.positionText + "</th>";
              lignes_tableau += "<th>" + "<a class='constructor' id='" + element.Constructor.constructorId + "' href='"+ element.Constructor.url +"'>" + element.Constructor.name + "</a>" + "</th>";
              lignes_tableau += "<th>" + element.Constructor.nationality + "</a>" + "</th>";
              lignes_tableau += "<th>" + element.wins + "</th>";
              lignes_tableau += "<th>" + element.points + "</th>";
              lignes_tableau += "</tr>";
            });
            lignes_tableau += "</tbody>";
            lignes_tableau += "</table>";
            lignes_tableau += "</div>";
            $('#tableau').html(lignes_tableau);
          }

          $('.driver').mouseover(function(event){
            pop_up_window(event);
          });

          $('.constructor').mouseover(function(event){
            pop_up_window(event);
          });

          $('.driver').mouseout(function(){
            $('.info').css({'display':'none'});
            $('.info').empty();
          });

          $('.constructor').mouseout(function(){
            $('.info').css({'display':'none'});
            $('.info').empty();
          });
        }
      },
      error : function(error){
        console.log(error);
      },
      complete : function(){
        console.log("completed");
      }
  });
};

/**
 * @function function_load_race_f1
 * @description get f1 race from the API Ergast
 */
function function_load_race_f1()
{
  var adresse;
  if(year == null || race == null)
  {
    adresse = "http://ergast.com/api/f1/current/last/results.json";
  }
  else
  {
     adresse = "http://ergast.com/api/f1/"+ year +"/" + race + "/results.json";
  }
  $.ajax({
    url : adresse,
    type : 'GET',
    dataType : 'jsonp',
    success : function(data){
      console.log(data);
      $("#titre").empty();
      $("#tableau").empty();
      if(data.MRData.total == 0)
      {
        $("#titre").html("No results");
      }
      else
      {
        $("#titre").html("Formula 1 season : " + data.MRData.RaceTable.Races[0].season + " / round : " + data.MRData.RaceTable.Races[0].round + " / at : " + data.MRData.RaceTable.Races[0].raceName);
        var lignes_tableau = "";
        lignes_tableau += "<div class='container'>";
        lignes_tableau += "<table class='table'><thead><tr><th>Position</th><th>NO</th><th>Driver</th><th>Team</th><th>Time</th><th>Status</th><th>Points</th><th>Lap(s)</th></tr></thead><tbody>";
        data.MRData.RaceTable.Races[0].Results.forEach(function(element)
        {
          lignes_tableau += "<tr>";
          lignes_tableau += "<th>" + element.positionText + "</th>";
          if(element.Driver.permanentNumber == null)
          {
            lignes_tableau += "<th>N/A</th>";
          }
          else
          {
            lignes_tableau += "<th>" + element.Driver.permanentNumber + "</th>";
          }

          lignes_tableau += "<th>" + "<a class='driver' id='" + element.Driver.driverId + "' href='"+ element.Driver.url +"'>" + element.Driver.givenName + " " + element.Driver.familyName + "</a>" + "</th>";
          lignes_tableau += "<th>" + "<a class='constructor' id='" + element.Constructor.constructorId + "' href='"+ element.Constructor.url +"'>" +element.Constructor.name + "</a>" +"</th>";

          if(element.status == 'Finished')
          {
            lignes_tableau += "<th>" + element.Time.time + "</th>";
          }
          else
          {
            lignes_tableau += "<th>N/A</th>";
          }
          lignes_tableau += "<th>" + element.status + "</th>";
          lignes_tableau += "<th>" + element.points + "</th>";
          lignes_tableau += "<th>" + element.laps + "</th>";
          lignes_tableau += "</tr>";
        });
      }
      $("#tableau").html(lignes_tableau);

      $('.driver').mouseover(function(event){
        pop_up_window(event);

      });

      $('.constructor').mouseover(function(event){
        pop_up_window(event);
      });

      $('.driver').mouseout(function(){
        $('.info').css({'display':'none'});
        $('.info').empty();
      });

      $('.constructor').mouseout(function(){
        $('.info').css({'display':'none'});
        $('.info').empty();
      });
    },
    error : function(error){
      console.log(error);
    },
    complete : function(){
      console.log("completed");
    }
  });
};

/**
 * @function function_load_races_in_season_f1
 * @description get f1 races in a season from the API Ergast
 */
function function_load_races_in_season_f1()
{
  var adresse = "http://ergast.com/api/f1/"+ year +".json"
  $.ajax({
      url : adresse,
      type : 'GET',
      dataType : 'jsonp',
      success : function(data){
        console.log(data);

        if(data.MRData.total == 0)
        {
          $('#error_message').empty();
          $('#error_message').html("No result");
        }
        else
        {
          year = data.MRData.RaceTable.season;
          var lignes_course;
          data.MRData.RaceTable.Races.forEach(function(element){
            lignes_course += "<option value='"+ element.round +"'>"+ element.raceName + " / " + element.Circuit.circuitName + "</option>";
          });
          $("#race").html(lignes_course);
        }
      },
      error : function(error){
        console.log(error);
      },
      complete : function(){
        console.log("completed");
      }
  });
}

/**
 * @function function_load_race_nascar
 * @description get f1 races in a season from the API SportRadar not working
 */
function function_load_race_nascar()
{
  var adresse = "http://api.sportradar.us/nascar-t3/mc/2017/races/schedule.json?api_key=7uerjqcasnrvsejva5ssmu2q";
  $.ajax({
      url : adresse,
      type : 'GET',
      dataType : 'json',
      success : function(data){
        console.log(data);
      },
      error : function(error){
        console.log("error");
        console.log(error);
      },
      complete : function(){
        console.log("completed");
      },
  });
}

/**
 * @function pop_up_window
 * @description get information of a driver or a team targeted
 * @param event - the event
 */
function pop_up_window(event)
{
  console.log(event.clientY);
  $('.info').empty();
  var y = event.clientY - 70;
  var adresse;
  if($(event.target).attr('class') == "driver")
  {
    adresse = "http://ergast.com/api/f1/drivers/"+ $(event.target).attr('id') +".json";
    $.ajax({
        url : adresse,
        type : 'GET',
        dataType : 'jsonp',
        success : function(data){
          console.log(data);
          var lignes = "<table>";
          lignes += "<tr><th>Name : </th><td>" + data.MRData.DriverTable.Drivers[0].givenName + " " + data.MRData.DriverTable.Drivers[0].familyName + "</td></th>";
          lignes += "<tr><th>Nationality : </th><td>" + data.MRData.DriverTable.Drivers[0].nationality + "</td></tr>";
          lignes += "<tr><th>Date of birth : </th><td>" + data.MRData.DriverTable.Drivers[0].dateOfBirth + "</td></tr>";
          lignes += "<tr><th>Permanent number : </th><td>" + data.MRData.DriverTable.Drivers[0].permanentNumber + "</td></tr>";
          lignes += "<tr><th>Link Wikipedia : </th><td>Click on the name</td></tr>";
          lignes += "</table>";
          $('.info').css({'display':'block','top':""+y+"px"});
          $('.info').html(lignes);
        },
        error : function(error){
          console.log("error");
          console.log(error);
        },
        complete : function(){
          console.log("completed");
        },
    });
  }
  else
  {
    adresse = "http://ergast.com/api/f1/constructors/"+ $(event.target).attr('id') +".json";
    $.ajax({
        url : adresse,
        type : 'GET',
        dataType : 'jsonp',
        success : function(data){
          console.log(data);
          var lignes = "<table>";
          lignes += "<tr><th>Name : </th><td>" + data.MRData.ConstructorTable.Constructors[0].name + "</td></tr>";
          lignes += "<tr><th>Nationality : </th><td>" + data.MRData.ConstructorTable.Constructors[0].nationality + "</td></tr>";
          lignes += "<tr><th>Link Wikipedia : </th><td>Click on the name</td></tr>";
          lignes += "</table>";
          $('.info').css({'display':'block'});
          $('.info').html(lignes);
        },
        error : function(error){
          console.log("error");
          console.log(error);
        },
        complete : function(){
          console.log("completed");
        },
    });
  }
}
