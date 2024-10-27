@echo off
setlocal

set CONTAINER_NAME=car_data_db
set DB_NAME=carData
set USERNAME=postgres
set OUTPUT_FILE=novi_json.json

rem Izvrši SQL upit i sačuvaj rezultate u JSON format
docker exec -i %CONTAINER_NAME% psql -U %USERNAME% -d %DB_NAME% -c "COPY (SELECT json_agg(json_build_object('Naziv', m.name, 'Auti', (SELECT json_agg(json_build_object('vin', c.vin, 'county', c.county, 'city', c.city, 'state', c.state, 'postal_code', c.postal_code, 'model_year', c.model_year, 'model_name', mo.name, 'electric_vehicle_type', c.electric_vehicle_type, 'cafv_eligibility', c.cafv_eligibility)) FROM Car c JOIN Model mo ON c.model_id = mo.id WHERE mo.make_id = m.id))) AS json_data FROM Make m) TO STDOUT" > %OUTPUT_FILE%

echo JSON datoteka je kreirana kao %OUTPUT_FILE%.

endlocal
pause
