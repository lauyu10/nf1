<?php
/*
the controller uses all the time the model results
*/
require('./model/results.php');

/*
this function asks to the model the list of season competed in a discipline
*/
function loading_season($idDiscipline)
{
  $list_seasons = get_seasons($idDiscipline);
  return $list_seasons;
}

/*
this function asks to the model the list of circuits in a season
*/
function loading_circuits($idSeason)
{
  $list_circuits = get_circuits_season($idSeason);
  return $list_circuits;
}

/*
this function asks to the model the unoficial of a race in a precise circuit
*/
function loading_race($idCircuit)
{
  $unofficial_result = get_race($idCircuit);
  return $unofficial_result;
}

/*
this function asks to the model the year refers to the id season
*/
function get_year($idSeason)
{
  $year = get_year_db($idSeason);
  return $year;
}

/*
this function asks to the model the place of the circuit
*/
function get_country_circuit($idCircuit)
{
  $country = get_country_circuit_db($idCircuit);
  return $country;
}

/*
this function asks to the model the driver standing
*/
function get_standing_driver($idSeason)
{
  $table_standing = get_standing_driver_db($idSeason);
  return $table_standing;
}

/*
this function asks to the model the team standing
*/
function get_standing_team($idSeason)
{
  $table_standing = get_standing_team_db($idSeason);
  return $table_standing;
}

/*
this function asks to the model information of a driver
*/
function get_driver_info($idPilot)
{
  $driver_info = get_driver_info_db($idPilot);
  return $driver_info;
}

/*
this function asks to the model races of a driver
*/
function get_race_one_driver($idPilot)
{
  $driver_race = get_race_one_driver_db($idPilot);
  return $driver_race;
}

/*
this function asks to the model information of a team
*/
function get_team_info($idTeam)
{
  $team_info = get_team_info_db($idTeam);
  return $team_info;
}

/*
this function asks to the model races of a team
*/
function get_race_team($idTeam)
{
  $team_race = get_race_team_db($idTeam);
  return $team_race;
}

/*
this function asks to the model the names of the drivers
*/
function get_driver_team($idTeam)
{
  $list_driver = get_driver_team_db($idTeam);
  return $list_driver;
}
?>
