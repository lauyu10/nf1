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
$(document).ready(function(){

  console.log("jQuery est prêt !");

  $('a.text-white').hover(function(){
    console.log("je suis sur un lien");
  });

  $('#select_year').click(function(){
    $('#form_f1_season_selection').css({"display":"block"});
  });

  $('span.close').click(function(){
    $('#form_f1_season_selection').css({"display":"none"});
  });

  $('#selected_year').click(function(){
    $('#form_f1_season_selection').css({"display":"none"});
    console.log($('#year').val());
    year = $('#year').val();
    function_load_standings_f1();
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

  var form_f1 = document.getElementById('form_f1_season_selection');
  $(window).on("click",function(e) {
      if(e.target == form_f1){
        form_f1.style.display = "none";
      };
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
      dataType : 'JSON',
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
              if($.isNumeric(element.positionText))
              {
                lignes_tableau += "<th>" + element.position + "</th>";
              }
              else
              {
                lignes_tableau += "<th>DSQ</th>";
              }
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
              if($.isNumeric(element.positionText))
              {
                lignes_tableau += "<th>" + element.position + "</th>";
              }
              else
              {
                lignes_tableau += "<th>DSQ</th>";
              }
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

function function_load_racef1()
{
  $.ajax({
      url : http://ergast.com/api/f1/current/last/results.json,
      type : 'GET',
      dataType : 'JSON',
      success : function(data){
        console.log(data);
      },
      error : function(error){
        console.log(error);
      },
      complete : function(){
        console.log("completed");
      }
  });
};
