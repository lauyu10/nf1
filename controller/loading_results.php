<?php
/**
 * This controller is used to get data of a race or a standing from database.
 * this controller is the link between model and controller
 * @author Laurent Yu
 */

/**
 * the controller uses all the time the model results
 */
require('./model/results.php');

/**
 * this function asks to the model the list of season competed in a discipline
 * @param Integer $idDiscipline id of a motorsport's $idDiscipline
 * @return List $list_seasons list of seasons
 */
function loading_season($idDiscipline)
{
  $list_seasons = get_seasons($idDiscipline);
  return $list_seasons;
}

/**
 * this function asks to the model the list of circuits in a season
 * @param Integer $idSeason id of a season
 * @return List $list_circuits list of circuits in the season
 */
function loading_circuits($idSeason)
{
  $list_circuits = get_circuits_season($idSeason);
  return $list_circuits;
}

/**
 * this function asks to the model the unoficial of a race in a precise circuit
 * @param Integer $idCircuit id of a race in a circuit
 * @return List $unofficial_result result of a race (list of drivers)
 */
function loading_race($idCircuit)
{
  $unofficial_result = get_race($idCircuit);
  return $unofficial_result;
}

/**
 * this function asks to the model the year refers to the id season
 * @param Integer $idSeason id of the season
 * @return Integer $year year of the season
 */
function get_year($idSeason)
{
  $year = get_year_db($idSeason);
  return $year;
}

/**
 * this function asks to the model the place of the circuit
 * @param Integer $idCircuit id of the circuit
 * @return String $country name of the country
 */
function get_country_circuit($idCircuit)
{
  $country = get_country_circuit_db($idCircuit);
  return $country;
}

/**
 * this function asks to the model the driver standing
 * @param Integer $idSeason id of the season
 * @return List $table_standing stading of the season (list of drivers)
 */
function get_standing_driver($idSeason)
{
  $table_standing = get_standing_driver_db($idSeason);
  return $table_standing;
}

/**
 * this function asks to the model the team standing
 * @param Integer $idSeason id of the season
 * @return List $table_standing stading of the season (list of team)
 */
function get_standing_team($idSeason)
{
  $table_standing = get_standing_team_db($idSeason);
  return $table_standing;
}

/**
 * this function asks to the model information of a driver
 * @param Integer $idPilot id of the driver
 * @return Object $driver_info information of the driver
 */
function get_driver_info($idPilot)
{
  $driver_info = get_driver_info_db($idPilot);
  return $driver_info;
}

/**
 * this function asks to the model races of a driver
 * @param Integer $idPilot id of the driver
 * @return List $driver_race races of one driver
 */
function get_race_one_driver($idPilot)
{
  $driver_race = get_race_one_driver_db($idPilot);
  return $driver_race;
}

/**
 * this function asks to the model information of a team
 * @param Integer $idTeam id of a team
 * @return Object $team_info information of a team
 */
function get_team_info($idTeam)
{
  $team_info = get_team_info_db($idTeam);
  return $team_info;
}

/**
 * this function asks to the model races of a team
 * @param Integer $idTeam id of a team
 * @return List $team_race races of the team
 */
function get_race_team($idTeam)
{
  $team_race = get_race_team_db($idTeam);
  return $team_race;
}

/**
 * this function asks to the model the names of the drivers
 * @param Integer $idTeam id of a team
 * @return List $list_driver list of drivers in a team
 */
function get_driver_team($idTeam)
{
  $list_driver = get_driver_team_db($idTeam);
  return $list_driver;
}
?>
