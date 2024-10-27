@echo off
setlocal

set CONTAINER_NAME=car_data_db
set DB_NAME=carData
set USERNAME=postgres
set OUTPUT_FILE= novi_csv.csv

docker exec -it %CONTAINER_NAME% psql -U %USERNAME% -d %DB_NAME% -c "COPY (SELECT c.vin, c.county, c.city, c.state, c.postal_code, c.model_year, mk.name AS make_name, m.name AS model_name, c.electric_vehicle_type, c.cafv_eligibility FROM Car c JOIN Model m ON c.model_id = m.id JOIN Make mk ON m.make_id = mk.id ORDER BY mk.id, m.id) TO STDOUT WITH CSV HEADER" > %OUTPUT_FILE%

endlocal
