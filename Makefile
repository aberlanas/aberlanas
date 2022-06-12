#!/usr/bin/make -f 


prepare-dirs: 
	@echo " * [ Building directories ] "



install : prepare-dirs

	cp Games/utils/vassal /usr/bin/
	cp Games/utils/vassal /home/aberlanas/bin/

	cp Games/utils/vassal-turno /usr/bin/
	cp Games/utils/vassal-turno /home/aberlanas/bin/

