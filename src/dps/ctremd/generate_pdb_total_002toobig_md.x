#!/bin/bash


TEMPLIST=`cat temperatures.dat`


## AQUI EU ESTOU GERANDO, A PARTIR DOS rend_00x.Ttraj.TEMP, usando os  .PARMS,  os NCDF TOTAL PARA CADA TEMPERATURA!!!


for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do ## TEM QUE DIMINUIR A ENTRADA 002 , por isso estou fazendo tudo isso
        mkdir BACKUPS
        cp /BACKUPS/remd_002.ncdf.$ext.backup2 BACKUPS/remd_002.ncdf.$ext.backup3 
        cp remd_002.ncdf.$ext.backup BACKUPS/remd_002.ncdf.$ext.backup2 
        cp remd_002.ncdf.$ext remd_002.ncdf.$ext.backup
        rm remd_002.ncdf.$ext
	cpptraj $1.prmtop << EOF
	trajin remd_002.ncdf.$ext.backup 1 last 2
	parm $2                                                                                                       
        reference $2 parm $2 [pdb-file]                                                                               
        trajout remd_002.ncdf.$ext append                                                         
        go 
EOF

done

for ext in 001 002 003 004 005 006 007 008 009 010 011 012 013 014 ; do
	rm remd_total.$ext.pdb
	for co in 001 002 003 004 005 006 ; do

	cpptraj $1.prmtop << EOF
	trajin remd_$co.ncdf.$ext
	parm $2
	reference $2 parm $2 [pdb-file]
	trajout remd_total.$ext.pdb pdb append
	go
EOF
	done
done


