CREATE TABLE projects (
  idprojects SERIAL  NOT NULL ,
  name VARCHAR    ,
  description VARCHAR      ,
PRIMARY KEY(idprojects));

CREATE TABLE Occurrences_metadata (
  idOccurrences_metadata SERIAL  NOT NULL ,
  dataset VARCHAR    ,
  parameters VARCHAR      ,
PRIMARY KEY(idOccurrences_metadata));

CREATE TABLE raster (
  idraster SERIAL  NOT NULL ,
  nome INTEGER    ,
  data_source VARCHAR    ,
  resolution VARCHAR    ,
  description VARCHAR    ,
  obs VARCHAR    ,
  period VARCHAR      ,
PRIMARY KEY(idraster));

CREATE TABLE status_occurrence (
  idstatus_occurrence SERIAL  NOT NULL ,
  status_2 VARCHAR      ,
PRIMARY KEY(idstatus_occurrence));

CREATE TABLE status_experiment (
  idstatus_experiment SERIAL  NOT NULL ,
  status_2 VARCHAR      ,
PRIMARY KEY(idstatus_experiment));

CREATE TABLE institution (
  idinstitution SERIAL  NOT NULL ,
  institution_name VARCHAR      ,
PRIMARY KEY(idinstitution));

CREATE TABLE algorithm (
  idalgorithm SERIAL  NOT NULL ,
  name VARCHAR    ,
  description VARCHAR      ,
PRIMARY KEY(idalgorithm));

CREATE TABLE usuario (
  iduser SERIAL  NOT NULL ,
  institution_idinstitution INTEGER   NOT NULL ,
  name VARCHAR    ,
  email VARCHAR    ,
  type_2 VARCHAR    ,
  login VARCHAR    ,
  salt VARCHAR    ,
  salted_hash VARCHAR      ,
PRIMARY KEY(iduser),
  FOREIGN KEY(institution_idinstitution)
    REFERENCES institution(idinstitution));

CREATE TABLE experiment (
  idexperiment SERIAL  NOT NULL ,
  status_experiment_idstatus_experiment INTEGER   NOT NULL ,
  projects_idprojects INTEGER   NOT NULL ,
  name VARCHAR    ,
  description VARCHAR    ,
  partition VARCHAR    ,
  num_partition INTEGER    ,
  buffer BOOL    ,
  projection BOOL    ,
  datetime_inicio TIMESTAMP    ,
  datetime_fim TIMESTAMP    ,
  status_experiment VARCHAR    ,
  extent_model VARCHAR    ,
  extent_projection VARCHAR      ,
PRIMARY KEY(idexperiment),
  FOREIGN KEY(projects_idprojects)
    REFERENCES projects(idprojects),
  FOREIGN KEY(status_experiment_idstatus_experiment)
    REFERENCES status_experiment(idstatus_experiment));

CREATE TABLE occurrences (
  idoccurrences SERIAL  NOT NULL ,
  status_occurrence_idstatus_occurrence INTEGER   NOT NULL ,
  Occurrences_metadata_idOccurrences_metadata INTEGER   NOT NULL ,
  species_name INTEGER    ,
  x_original NUMERIC    ,
  y_original NUMERIC    ,
  modified BOOL    ,
  excluded BOOL    ,
  x_used NUMERIC  DEFAULT NULL  ,
  y_used NUMERIC  DEFAULT NULL  ,
  group_partition INTEGER    ,
  delete_reason text      ,
PRIMARY KEY(idoccurrences),
  FOREIGN KEY(Occurrences_metadata_idOccurrences_metadata)
    REFERENCES Occurrences_metadata(idOccurrences_metadata),
  FOREIGN KEY(status_occurrence_idstatus_occurrence)
    REFERENCES status_occurrence(idstatus_occurrence));

CREATE TABLE internal_rating (
  idinternal_rating SERIAL  NOT NULL ,
  usuario_iduser INTEGER   NOT NULL ,
  experiment_idexperiment INTEGER   NOT NULL ,
  rating BOOL      ,
PRIMARY KEY(idinternal_rating),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment),
  FOREIGN KEY(usuario_iduser)
    REFERENCES usuario(iduser));

CREATE TABLE experiment_use_raster (
  experiment_idexperiment INTEGER   NOT NULL ,
  raster_idraster INTEGER   NOT NULL   ,
PRIMARY KEY(experiment_idexperiment, raster_idraster),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment),
  FOREIGN KEY(raster_idraster)
    REFERENCES raster(idraster));

CREATE TABLE projects_has_usuario (
  projects_idprojects INTEGER   NOT NULL ,
  usuario_iduser INTEGER   NOT NULL   ,
PRIMARY KEY(projects_idprojects, usuario_iduser),
  FOREIGN KEY(projects_idprojects)
    REFERENCES projects(idprojects),
  FOREIGN KEY(usuario_iduser)
    REFERENCES usuario(iduser));

CREATE TABLE experiment_use_algorithm (
  experiment_idexperiment INTEGER   NOT NULL ,
  algorithm_idalgorithm INTEGER   NOT NULL   ,
PRIMARY KEY(experiment_idexperiment, algorithm_idalgorithm),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment),
  FOREIGN KEY(algorithm_idalgorithm)
    REFERENCES algorithm(idalgorithm));

CREATE TABLE raster_partition_results (
  idraster_results SERIAL  NOT NULL ,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER   NOT NULL ,
  experiment_use_algorithm_experiment_idexperiment INTEGER   NOT NULL   ,
PRIMARY KEY(idraster_results),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm));

CREATE TABLE raster_final_model (
  idraster_final_model SERIAL  NOT NULL ,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER   NOT NULL ,
  experiment_use_algorithm_experiment_idexperiment INTEGER   NOT NULL   ,
PRIMARY KEY(idraster_final_model),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm));

CREATE TABLE evaluate (
  idevaluate SERIAL  NOT NULL ,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER   NOT NULL ,
  experiment_use_algorithm_experiment_idexperiment INTEGER   NOT NULL   ,
PRIMARY KEY(idevaluate),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm));
