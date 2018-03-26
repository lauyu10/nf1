/*
$('p'); // je sélectionne tous les paragraphes

$('.maClasse'); // je sélectionne les éléments ayant .maClasse pour classe

$('#monId'); // je sélectionne l'élément qui possède l'identifiant #monId

jQuery(document).ready(function(){}); = $(document).ready(function(){}); = $(function(){});

*/

/*
function display_hello()
{
  alert("hello world");
}
*/
//display_hello();

var standing;
var year;
var race;

$(document).ready(function(){

  console.log("jQuery est prêt !");

  $('a.text-white').hover(function(){
    console.log("je suis sur un lien");
  });

  $('#select').click(function(){
    $('#form_f1_selection').css({"display":"block"});
  });

  $('#select_race').click(function(){
    $('#form_f1_selection').css({"display":"block"});
    $('#race').empty();
    $('#error_message').empty();
  });

  $('span.close').click(function(){
    $('#form_f1_selection').css({"display":"none"});
  });

  $('#selected_year').click(function(){
    $('#form_f1_selection').css({"display":"none"});
    console.log($('#year').val());
    year = $('#year').val();
    function_load_standings_f1();
  });

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

  var form_f1 = document.getElementById('form_f1_selection');
  $(window).on("click",function(e) {
      if(e.target == form_f1){
        form_f1.style.display = "none";
      };
  });

  $('#select_race_nascar').click(function(){
    $('#form_nascar_selection').css({"display":"block"});
    $('#race_nascar').empty();
  });

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
        //console.log(data);
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
              lignes_tableau += "<th>" + "<a href='"+ element.Driver.url +"'>" + element.Driver.givenName + " " + element.Driver.familyName + "</a>" + "</th>";
              lignes_tableau += "<th>" + "<a href='"+ element.Constructors[0].url +"'>" + element.Constructors[0].name + "</a>" + "</th>";
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
              lignes_tableau += "<th>" + "<a href='"+ element.Constructor.url +"'>" + element.Constructor.name + "</a>" + "</th>";
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
        lignes_tableau += "<table class='table'><thead><tr><th>Position</th><th>NO</th><th>Driver</th><th>Team</th><th>Points</th><th>Lap(s)</th></tr></thead><tbody>";
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
          lignes_tableau += "<th>" + "<a href='"+ element.Driver.url +"'>" + element.Driver.givenName + " " + element.Driver.familyName + "</a>" + "</th>";
          lignes_tableau += "<th>" + "<a href='"+ element.Constructor.url +"'>" +element.Constructor.name + "</a>" +"</th>";
          lignes_tableau += "<th>" + element.points + "</th>";
          lignes_tableau += "<th>" + element.laps + "</th>";
          lignes_tableau += "</tr>";
        });
      }
      $("#tableau").html(lignes_tableau);
    },
    error : function(error){
      console.log(error);
    },
    complete : function(){
      console.log("completed");
    }
  });
};

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

function function_load_race_nascar()
{
  var adresse = "http://api.sportradar.us/nascar-t3/mc/2017/races/schedule.json?api_key=7uerjqcasnrvsejva5ssmu2q";
  $.ajax({
      url : adresse,
      type : 'GET',
      dataType : 'jsonp',
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

function function_load_races_in_season_nascar()
{

}
