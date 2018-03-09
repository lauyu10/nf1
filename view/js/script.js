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
  $('#classement').empty();
  $.ajax({
      url : 'http://ergast.com/api/f1/current/driverStandings.json',
      type : 'GET',
      dataType : 'JSON',
      success : function(data){
        console.log(data);
        $('#titre').prepend("Formula 1 Last Driver Standings season : " + data.MRData.StandingsTable.StandingsLists[0].season + " after round : " + data.MRData.StandingsTable.StandingsLists[0].round);
        $('#tableau').prepend(
          
        );
      },
      error : function(error){
        console.log(error);
      },
      complete : function()
      {
        console.log("completed");
      }
  });
};
