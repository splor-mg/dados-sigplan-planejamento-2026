library(data.table)
library(dplyr)
library(magrittr)

dt <- fread('data-raw/acoes_planejamento.txt',  encoding = "Latin-1")

dt <- fread('data/acoes_planejamento.csv')

dt[,.(uo_acao_cod, acao_cod, is_deleted_acao)]

dt[, .SD[.N > 1], by = .(uo_acao_cod, acao_cod, is_deleted_acao), 
   .SDcols = c("programa_cod")]


dt %>%
  group_by(uo_acao_cod, acao_cod, is_deleted_acao) %>%
  filter(n() > 1) %>% 
  select(uo_acao_cod, acao_cod, is_deleted_acao, programa_cod) 



