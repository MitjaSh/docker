PGAdmin Master password: 123456

docker-compose up --build

psql --username=root --dbname=db01

http://localhost:5050/browser/

Теперь я не просто разворачиваю контейнер с базой из image postgres:14.3-alpine.
Еще я устанавливаю на нее расширение plpgsql_check, которое скачал вручную с hithub
https://github.com/okbob/plpgsql_check/archive/refs/tags/v2.3.0.tar.gz
см.файл Docker