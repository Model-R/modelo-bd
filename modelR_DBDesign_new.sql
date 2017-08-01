CREATE TABLE raster (
  idraster INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome INTEGER UNSIGNED NULL,
  data_source VARCHAR NULL,
  resolution VARCHAR NULL,
  description VARCHAR NULL,
  obs VARCHAR NULL,
  period VARCHAR NULL,
  PRIMARY KEY(idraster)
);

CREATE TABLE projects (
  idprojects INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR NULL,
  description VARCHAR NULL,
  PRIMARY KEY(idprojects)
);

CREATE TABLE Occurrences_metadata (
  idOccurrences_metadata INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  dataset VARCHAR NULL,
  parameters VARCHAR NULL,
  PRIMARY KEY(idOccurrences_metadata)
);

CREATE TABLE status_occurrence (
  idstatus_occurrence INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_2 VARCHAR NULL,
  PRIMARY KEY(idstatus_occurrence)
);

CREATE TABLE status_experiment (
  idstatus_experiment INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_2 VARCHAR NULL,
  PRIMARY KEY(idstatus_experiment)
);

CREATE TABLE rgbif_metadata (
  idrgbif_metadata INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  taxonkey NUMERIC NULL,
  scientificname VARCHAR NULL,
  country VARCHAR NULL,
  publishngcountry VARCHAR NULL,
  hascoordinate BOOL NULL,
  typestatus VARCHAR NULL,
  recordnumber VARCHAR NULL,
  lastinterpreted VARCHAR NULL,
  continente VARCHAR NULL,
  geometry VARCHAR NULL,
  geometry_big VARCHAR NULL,
  geom_size VARCHAR NULL,
  geom_n VARCHAR NULL,
  recordedby VARCHAR NULL,
  basisofrecord VARCHAR NULL,
  datasetkey VARCHAR NULL,
  eventdate DATE NULL,
  catalognumber INTEGER UNSIGNED NULL,
  year_2 YEAR NULL,
  month_2 INTEGER UNSIGNED NULL,
  decimallatitute NUMERIC NULL,
  decimallogitude NUMERIC NULL,
  elevation INTEGER UNSIGNED NULL,
  depth INTEGER UNSIGNED NULL,
  institutioncode VARCHAR NULL,
  collectioncode VARCHAR NULL,
  hasgeospatialissue BOOL NULL,
  issue VARCHAR NULL,
  search VARCHAR NULL,
  mediatype VARCHAR NULL,
  sbgenuskey NUMERIC NULL,
  repatriated VARCHAR NULL,
  phylumkey NUMERIC NULL,
  kingdimkey NUMERIC NULL,
  classkey NUMERIC NULL,
  orderkey NUMERIC NULL,
  familykey NUMERIC NULL,
  genuskey NUMERIC NULL,
  stablishmentmeans VARCHAR NULL,
  protocol VARCHAR NULL,
  license VARCHAR NULL,
  organismid NUMERIC NULL,
  publishingorg VARCHAR NULL,
  stateprovince VARCHAR NULL,
  waterbody VARCHAR NULL,
  locality VARCHAR NULL,
  limit_2 INTEGER UNSIGNED NULL,
  start INTEGER UNSIGNED NULL,
  spellcheck BOOL NULL,
  PRIMARY KEY(idrgbif_metadata)
);

CREATE TABLE institution (
  idinstitution INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  institution_name VARCHAR NULL,
  PRIMARY KEY(idinstitution)
);

CREATE TABLE algorithm (
  idalgorithm INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR NULL,
  description VARCHAR NULL,
  PRIMARY KEY(idalgorithm)
);

CREATE TABLE usuario (
  iduser INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  institution_idinstitution INTEGER UNSIGNED NOT NULL,
  name VARCHAR NULL,
  email VARCHAR NULL,
  type_2 VARCHAR NULL,
  login VARCHAR NULL,
  salt VARCHAR NULL,
  salted_hash VARCHAR NULL,
  PRIMARY KEY(iduser),
  FOREIGN KEY(institution_idinstitution)
    REFERENCES institution(idinstitution)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE experiment (
  idexperiment INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_experiment_idstatus_experiment INTEGER UNSIGNED NOT NULL,
  projects_idprojects INTEGER UNSIGNED NOT NULL,
  name VARCHAR NULL,
  description VARCHAR NULL,
  partition VARCHAR NULL,
  num_partition INTEGER UNSIGNED NULL,
  buffer BOOL NULL,
  projection BOOL NULL,
  datetime_inicio TIMESTAMP NULL,
  datetime_fim TIMESTAMP NULL,
  status_experiment VARCHAR NULL,
  extent_model VARCHAR NULL,
  extent_projection VARCHAR NULL,
  PRIMARY KEY(idexperiment),
  FOREIGN KEY(projects_idprojects)
    REFERENCES projects(idprojects)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status_experiment_idstatus_experiment)
    REFERENCES status_experiment(idstatus_experiment)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE occurrences (
  idoccurrences INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_occurrence_idstatus_occurrence INTEGER UNSIGNED NOT NULL,
  Occurrences_metadata_idOccurrences_metadata INTEGER UNSIGNED NOT NULL,
  species_name INTEGER UNSIGNED NULL,
  x_original NUMERIC NULL,
  y_original NUMERIC NULL,
  modified BOOL NULL,
  excluded BOOL NULL,
  x_used NUMERIC NULL DEFAULT NULL,
  y_used NUMERIC NULL DEFAULT NULL,
  group_partition INTEGER UNSIGNED NULL,
  delete_reason LONGTEXT NULL,
  PRIMARY KEY(idoccurrences),
  FOREIGN KEY(Occurrences_metadata_idOccurrences_metadata)
    REFERENCES Occurrences_metadata(idOccurrences_metadata)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status_occurrence_idstatus_occurrence)
    REFERENCES status_occurrence(idstatus_occurrence)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE internal_rating (
  idinternal_rating INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_iduser INTEGER UNSIGNED NOT NULL,
  experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  rating BOOL NULL,
  PRIMARY KEY(idinternal_rating),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(usuario_iduser)
    REFERENCES usuario(iduser)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE experiment_use_raster (
  experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  raster_idraster INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(experiment_idexperiment, raster_idraster),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(raster_idraster)
    REFERENCES raster(idraster)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE experiment_use_algorithm (
  experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  algorithm_idalgorithm INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(experiment_idexperiment, algorithm_idalgorithm),
  FOREIGN KEY(experiment_idexperiment)
    REFERENCES experiment(idexperiment)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(algorithm_idalgorithm)
    REFERENCES algorithm(idalgorithm)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE projects_has_usuario (
  projects_idprojects INTEGER UNSIGNED NOT NULL,
  usuario_iduser INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(projects_idprojects, usuario_iduser),
  FOREIGN KEY(projects_idprojects)
    REFERENCES projects(idprojects)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(usuario_iduser)
    REFERENCES usuario(iduser)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE raster_partition_results (
  idraster_results INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER UNSIGNED NOT NULL,
  experiment_use_algorithm_experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idraster_results),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE raster_final_model (
  idraster_final_model INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER UNSIGNED NOT NULL,
  experiment_use_algorithm_experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idraster_final_model),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE evaluate (
  idevaluate INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  experiment_use_algorithm_algorithm_idalgorithm INTEGER UNSIGNED NOT NULL,
  experiment_use_algorithm_experiment_idexperiment INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idevaluate),
  FOREIGN KEY(experiment_use_algorithm_experiment_idexperiment, experiment_use_algorithm_algorithm_idalgorithm)
    REFERENCES experiment_use_algorithm(experiment_idexperiment, algorithm_idalgorithm)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


