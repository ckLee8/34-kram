gem install sinatra

gem install thin

ruby server.rb      (in terminal)

test commands       (in terminal)

curl -X POST -H "Content-type: application/json" -d '{"text":"My cat is gray. It doesn\"t have feathers."}' http://localhost:8080/words/avg_len

curl -X POST -H "Content-type: application/json" -d '{"text":"My my my cat is is is gray. It doesn\"t have feathers."}' http://localhost:8080/words/most_com

curl -X POST -H "Content-type: application/json" -d '{"text":"My my cat cat cat is gray gray. It doesn\"t doesn\"t doesn\"t have have have feathers feathers."}' http://localhost:8080/words/median

curl -X POST -H "Content-type: application/json" -d '{"text":"My cat is gray. It doesn\"t have feathers."}' http://localhost:8080/sentences/avg_len

curl -X POST -H "Content-type: application/json" -d '{"text":"My 201-123-4567 cat is gray. 2017899876 It doesn\"t have feathers."}' http://localhost:8080/phones
