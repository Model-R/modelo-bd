# install.packages("RPostgreSQL")
library("RPostgreSQL")
library(data.table)

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
!dbExistsTable(con, "evaluate")){
  # FALSE
  sql_tableCreate <- "CREATE TABLE evaluate
(--idevaluate integer PRIMARY KEY,
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
dbGetQuery(con, sql_tableCreate)
#dbGetQuery(con, dropSQL)
}

# if true follow

# creates df, a data.frame with the necessary columns
#data(mtcars)
evaluate <- list.files("./examples", full.names = TRUE)
evaluate <- lapply(evaluate, read.table)
evaluate <- rbindlist(evaluate, use.names = TRUE)
class(evaluate)
evaluate <- as.data.frame(evaluate)
specie <- list.files("./examples")[1]

specie <- stringr::str_split(specie, pattern="_")[[1]][1]
specie <- stringr::str_split(specie, pattern="evaluate")[[1]][2]
evaluate$specie <- specie

str(evaluate)
evaluate$algoritmo <- as.character(evaluate$algoritmo)

names(evaluate)[7:8] <- c("auc", "tss")
rm(specie)

# writes df to the PostgreSQL database "postgres", table "cartable" 
dbWriteTable(con, "evaluate", 
             value = evaluate, append = TRUE, row.names = FALSE)

# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "SELECT * from evaluate")

# compares the two data.frames
identical(evaluate, df_postgres)
# can be FALSE
all.equal(evaluate, df_postgres) # identifying the differences
# TRUE