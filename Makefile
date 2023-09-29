#!make
SHELL         = /bin/bash
.SHELLFLAGS   = -o pipefail -c

BUILD ?= local
VERSION ?= $$(git describe --tags --always --dirty)
REGISTER ?= registry.gitlab.com
PROJECT_NAME ?= dev.gis/nav-transfer-service
SHELL := /bin/bash
ROOT_DIR := $$(pwd)

VOLUME := pgdata_nav
DB_SERVICE := navDB
DB_PORT := 5000

launch-preparation:
	export OPERATION_TYPE="preparation" && export ROOT_DIR=${ROOT_DIR} && bash nav-transfer-service

launch-update:
	export OPERATION_TYPE="update" && export ROOT_DIR=${ROOT_DIR} && bash nav-transfer-service

launch-insert:
	export OPERATION_TYPE="insert" && export ROOT_DIR=${ROOT_DIR} && bash nav-transfer-service

prepare_db:
	docker run --shm-size=1g --name ${DB_SERVICE} -p ${DB_PORT}:5432 -v ${VOLUME}:/var/lib/postgresql/data -e POSTGRES_DB=nav-db -e POSTGRES_USER=nav-user -e POSTGRES_PASSWORD=mypass -d mdillon/postgis

docker-down:
	export NAV_IMAGE=${REGISTER}/${PROJECT_NAME}/${BUILD}:${VERSION} && \
	docker-compose -f docker-compose.yml down --volumes ; \

clean-up:
	rm -rf data/*;
	rm -rf out/*;

update-data:
	cp -r ./downloads/* ./data

update-geojson:
	rm -r ./data
	#mkdir -p data/2211
	mkdir -p data/2303
	#cp -r ./downloads/2211/GEOJSON data/2211
	#cp -r ./downloads/2301/EXTRA/GEOJSON data/2301
	cp -r ./downloads/2303/GEOJSON data/2303/GEOJSON

update-aixm:
	rm -r ./data
	mkdir -p data/2303/AIXM
	#mkdir -p data/2212/AIXM
	#cp -r ./downloads/2303/AIXM/ data/2303/
	cp  ./downloads/2302/AIXM/UWLL.xml data/2303/AIXM
	cp  ./downloads/2302/AIXM/UWLW.xml data/2303/AIXM

#	cp ./downloads/2301/EXTRA/AIXM/EGOS.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/1AIC.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/1BXQ.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/1EDM.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2AWT.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2BDN.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2CYB.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2DAN.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2ECV.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2FJE.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2GEZ.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2IIJ.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2LAM.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2MDD.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/2NAN.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/BA03.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/UEYS.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/ULMK.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/ULLI.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/URML.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/UNAA.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/ULLI.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/ULNR.xml data/2301/AIXM
	#cp ./downloads/2303/AIXM/ULAH.xml data/2303/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/UNKM.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/OJAI.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/OISS.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/OIBP.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/OIBL.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/UAAA.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/UAUU.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/ENSD.xml data/2301/AIXM
#	cp ./downloads/2301/EXTRA/AIXM/LTAC.xml data/2301/AIXM


load-screen-json:
	rm -r data;
	mkdir -p data/2211/GEOJSON
	mkdir -p data/2212/GEOJSON
	cp -r screen/data/2211/GEOJSON data/2211 ;
	cp -r screen/data/2212/GEOJSON data/2212 ;
	docker rm ${DB_SERVICE} -f;
	docker volume rm ${VOLUME};
	docker volume create ${VOLUME};
	docker run --name ${DB_SERVICE} -p ${DB_PORT}:5432 -v ${VOLUME}:/var/lib/postgresql/data -e POSTGRES_DB=nav-db -e POSTGRES_USER=nav-user -e POSTGRES_PASSWORD=mypass -d mdillon/postgis

load-screen:
	rm -r data;
	cp -r screen/data . ;
	docker rm ${DB_SERVICE} -f;
	docker volume rm ${VOLUME};
	docker volume create ${VOLUME};
	docker run --name ${DB_SERVICE} -p ${DB_PORT}:5432 -v ${VOLUME}:/var/lib/postgresql/data -e POSTGRES_DB=nav-db -e POSTGRES_USER=nav-user -e POSTGRES_PASSWORD=mypass -d mdillon/postgis

load-dump:
	cat screen/screen_db | docker exec -i ${DB_SERVICE} psql -U nav-user -d nav-db

create-screen:
	rm -rf screen/*;
	cp -r data screen ;
	docker exec ${DB_SERVICE} pg_dump -U nav-user nav-db > screen/screen_db

rm-extra:
	# rm data/2302/GEOJSON/1degree.geojson ;
	# rm data/2302/GEOJSON/2_2degree.geojson ;
	# rm data/2302/GEOJSON/2degree.geojson ;
	# rm data/2302/GEOJSON/3degree.geojson ;
	# rm data/2302/GEOJSON/4degree.geojson ;
	#rm data/2302/GEOJSON/5_2degree.geojson ;
	rm data/2303/GEOJSON/ALS.geojson ;
	# rm data/2302/GEOJSON/AMA64.geojson ;
	rm data/2303/GEOJSON/ARP.geojson ;
	rm data/2303/GEOJSON/CAA.geojson ;
	rm data/2303/GEOJSON/CTA.geojson ;
	rm data/2303/GEOJSON/CTR.geojson ;
	rm data/2303/GEOJSON/CTB.geojson ;
	rm data/2303/GEOJSON/RDA.geojson ;
	# rm data/2303/GEOJSON/FIR.geojson ;
	rm data/2303/GEOJSON/HOLD.geojson ;
	rm data/2303/GEOJSON/MET.geojson ;
	rm data/2303/GEOJSON/MVL.geojson ;
	rm data/2303/GEOJSON/NAV.geojson ;
	rm data/2303/GEOJSON/OBS.geojson ;
	rm data/2303/GEOJSON/RDC.geojson ;
	rm data/2303/GEOJSON/RSA.geojson ;
	rm data/2303/GEOJSON/RWY.geojson ;
	rm data/2303/GEOJSON/SECTOR.geojson ;
	rm data/2303/GEOJSON/TMA.geojson ;
	rm data/2303/GEOJSON/TPM.geojson ;
	rm data/2303/GEOJSON/TPT.geojson ;
	rm data/2302/GEOJSON/TRA.geojson ;
	rm data/2303/GEOJSON/UAA.geojson ;

run-sql:
	export OPERATION_TYPE="sql_script" && export ROOT_DIR=${ROOT_DIR} && bash nav-transfer-service


