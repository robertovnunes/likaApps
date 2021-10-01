#!/bin/bash -x
#Intelectual property of Rafael Lima (ragpl)
#by bolds

hoje=$(date +%F)

#acesse a pasta temporaria crie uma pasta com a data de hoje e acesse-a
cd /home/temp/
mkdir $hoje
cd $hoje

#backup www===========================
if [ $# -eq 4 ]; then
		
	if [ "$4" = "full" ]; then

		
		mkdir www
		cp -r /var/www/* www/
		zip -r www.zip www/*
		rm -r www/
		
		
		
#fim backup www=============================

#backup webapps===============================
		mkdir  webapps
		

		
		cp -r /var/lib/tomcat6/webapps/* webapps/
		zip -r webapps.zip webapps/*
		rm -r webapps/
		
	fi
fi

#fim backup webapps==================


mkdir svn



cp -r /var/svn/* svn/
zip -r svn.zip svn/*
rm -r svn/



#fim backup svn======================



#backup mysql===========================================


mkdir mysql


cd mysql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases cenas > cenas.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases clin > clin.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases forumcenas > forumcenas.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases moodle > moodle.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases pbl > pbl.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases ped > ped.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases sae > sae.sql
mysqldump --opt --user=root --password=ksw2@01Sxw1S --databases saemental > saemental.sql

cd ..

zip -r mysql.zip mysql/*
rm -r mysql/



#fim do backup mysql ===============================

#armazenando o backup em outra máquina ===================

cd ..
zip -r $hoje$4.zip $hoje/*
rm -r $hoje/





#enviando pelo dropbox
if [ "$1" = "dropbox" ]; then
	mv $hoje.zip /root/Dropbox/
	~/.dropbox-dist/dropboxd &
	 sleep $2
	killall -9 dropboxd
fi

#enviando por ssh
if [ "$1" = "ssh" ]; then
	sftp -b /home/scripts/sftp root@150.161.67.14
fi

#se compacto
if [ "$3" = "compact" ]; then

	rm -r /home/temp/*

	
fi

#fim do envio ======================================


#enviar email de notificacao =======================
sendemail -f monitoramentoideias@gmail.com -t monitoramentoideias@gmail.com ragpl07@gmail.com rosaliebelian@gmail.com  -u backup $4 completo -m backup $4 realizado com sucesso em $hoje -s smtp.gmail.com -o tls=yes message-content-type=html -xu monitoramentoideias -xp xciv8fvDs52Swoxs
#fim do envio do email =============================


#fim de tudo =======================================




#exemplo de chamada do script

#nome do script, tipo de backup, tempo de backup, remover arquivos temporarios, backup sistemas
#backup.sh dropbox 1 compact full
#backup.sh dropbox 3
#backup.sh ssh 2 compact
