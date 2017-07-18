# install.packages("RPostgreSQL")
library("RPostgreSQL")
library(data.table)

# ?PostgreSQL
# PostgreSQL(max.con = 16, fetch.default.rec = 500, force.reload = FALSE)
# The following commands must be usefuls to check the result from query!
# dbHasCompleted(creationQuery)
# info <- dbGetInfo(creationQuery)

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {"postgres"}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "ModelR",
                 host = "localhost", port = 5432,
                 user = "postgres", password = pw)
rm(pw) # removes the password


if ( # check for the evaluate table
!dbExistsTable(con, "evaluate")) {
  # FALSE
  sql_tableCreate <- "CREATE TABLE evaluate
(--id integer PRIMARY KEY,
  kappa numeric(12, 10),
  spec_sens numeric(12, 10),
  no_omission numeric(12, 10),  
  prevalence numeric(12, 10),
  equal_sens_spec numeric(12, 10),
  sensitivity numeric(12, 10),
  AUC numeric(12, 10),
  TSS numeric(12, 10),
  algoritmo character varying NOT NULL, --#como usar o ID do algoritmo salvo no banco?
  partition numeric(12, 10),
  specie character varying NOT NULL
  )
  WITH (
  OIDS=FALSE
  );
  ALTER TABLE evaluate
  OWNER TO postgres;"
dropSQL <- "DROP TABLE public.evaluate;"  
# sends the command and creates the table
# creationQuery <- dbGetQuery(con, sql_tableCreate)
creationQuery <- dbSendQuery(con, sql_tableCreate)
# dbGetQuery(con, dropSQL)
# dropQuery <- dbSendQuery(con, dropSQL)
} 

# creates df, a data.frame with the necessary columns
# The following code won't be necessary ... ----
evaluate <- list.files("./examples", full.names = TRUE)
evaluate <- lapply(evaluate, read.table)
evaluate <- rbindlist(evaluate, use.names = TRUE)
evaluate <- as.data.frame(evaluate)
specie <- list.files("./examples")[1]
# #this part is to get the species names. Must be changed acording to modellingprocess ----
specie <- stringr::str_split(specie, pattern="_")[[1]][1]
specie <- stringr::str_split(specie, pattern="evaluate")[[1]][2]
evaluate$specie <- specie
evaluate$algoritmo <- as.character(evaluate$algoritmo)

names(evaluate) <- tolower(names(evaluate))
rm(specie)

# test if evaluate dataframe has same columns from database
if (!all.equal(colnames(evaluate), dbListFields(con, "evaluate"))){
  stop("Different columns from database!")
} else {
  # if true, append the result to database table
  # writes df to the PostgreSQL database "postgres"
  # ?dbWriteTable
  dbWriteTable(con, "evaluate", value = evaluate, append = TRUE, row.names = FALSE)
}

# Retrieve data from database
# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "SELECT * from evaluate")
# df_postgres <- dbSendQuery(con, "SELECT * from evaluate")

# compares the two data.frames
identical(evaluate, df_postgres)
# can be FALSE
all.equal(evaluate, df_postgres) # identifying the differences
# TRUE


# Other methods from appending data ----
sql_tableCreate <- "CREATE TABLE teste
(id integer PRIMARY KEY,
  kappa numeric(12, 10),
  spec_sens numeric(12, 10),
  no_omission numeric(12, 10),  
  prevalence numeric(12, 10),
  equal_sens_spec numeric(12, 10),
  sensitivity numeric(12, 10),
  AUC numeric(12, 10),
  TSS numeric(12, 10),
  algoritmo character varying NOT NULL, --#como usar o ID do algoritmo salvo no banco?
  partition numeric(12, 10),
  specie character varying NOT NULL
)
WITH (
OIDS=FALSE
);
ALTER TABLE teste
OWNER TO postgres;"
dropSQL <- "DROP TABLE public.teste;"  

# sends the command and creates the table
# creationQuery <- dbGetQuery(con, sql_tableCreate)
creationQuery <- dbSendQuery(con, sql_tableCreate)
# dbGetQuery(con, dropSQL)
# dropQuery <- dbSendQuery(con, dropSQL)

# ?dbWriteTable
# Teste com pacote Caroline
# install.packages("caroline")
library(caroline)
# evaluate$id <- as.integer(rownames(evaluate))
dbWriteTable2(con, "teste", evaluate, fill.null = FALSE, add.id=FALSE,
              row.names=FALSE, pg.update.seq=TRUE, append = TRUE)

# Retrieve data from database
# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "SELECT * from teste")

# compares the two data.frames
identical(evaluate, df_postgres[,2:length(df_postgres)])
# can be FALSE
all.equal(evaluate, df_postgres[,2:length(df_postgres)]) # identifying the differences
# TRUE