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
$(document).ready(function(){

  console.log("jQuery est prêt !");

  $('a.text-white').hover(function(){
    console.log("je suis sur un lien");
  });

  $.ajax();


  /*
  $('#test_button').click(function(){
    $.ajax({
        url : 'http://ergast.com/api/f1/seasons.json',
        type : 'GET',
        dataType : 'JSON',
        success : function(data){
          console.log(data);

        },
        error : function(error){
          console.log(error);
        },
        complete : function()
        {
          console.log("completed");
        }
    });
  });
  */
});

function function_load_last_result_f1()
{
  $.ajax({
      url : 'http://ergast.com/api/f1/current/driverStandings.json',
      type : 'GET',
      dataType : 'JSON',
      success : function(data){
        //console.log(data);
        $('#titre').append("Formula 1 Last Driver Standings season : " + data.MRData.StandingsTable.StandingsLists[0].season + " after round : " + data.MRData.StandingsTable.StandingsLists[0].round );
        var lignes_tableau ="";
        lignes_tableau += "<div class='container'>";
        lignes_tableau += "<table class='table'><thead><tr><th>Position</th><th>NO</th><th>Driver</th><th>Team</th><th>Points</th></tr></thead><tbody>";

        data.MRData.StandingsTable.StandingsLists[0].DriverStandings.forEach(function(element){
          lignes_tableau += "<tr>";
          lignes_tableau += "<th>" + element.position + "</th>";
          lignes_tableau += "<th>" + element.Driver.permanentNumber + "</th>";
          lignes_tableau += "<th>" + "<a href='"+ element.Driver.url +"'>" + element.Driver.givenName + " " + element.Driver.familyName + "</a>" + "</th>";
          lignes_tableau += "<th>" + "<a href='"+ element.Constructors[0].url +"'>" + element.Constructors[0].name + "</a>" + "</th>";
          lignes_tableau += "<th>" + element.points + "</th>";
          lignes_tableau += "</tr>";
        });
        lignes_tableau += "</tbody>";
        lignes_tableau += "</table>";
        lignes_tableau += "</div>";
        $('#tableau').html(lignes_tableau);
      },
      error : function(error){
        console.log(error);
      },
      complete : function(){
        console.log("completed");
      }
  });
};
