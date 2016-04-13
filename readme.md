gem install sinatra
gem install thin
ruby server.rb      (in terminal)


test commands       (in terminal)

curl -X POST -H "Content-type: application/json" -d '{"text":"My cat is gray. It doesn\"t have feathers."}' http://localhost:8080/words/avg_len

curl -X POST -H "Content-type: application/json" -d '{"text":"My my my cat is is is gray. It doesn\"t have feathers."}' http://localhost:8080/words/most_com

curl -X POST -H "Content-type: application/json" -d '{"text":"My my cat cat cat is gray gray. It doesn\"t doesn\"t doesn\"t have have have feathers feathers."}' http://localhost:8080/words/median

curl -X POST -H "Content-type: application/json" -d '{"text":"My cat is gray. It doesn\"t have feathers."}' http://localhost:8080/sentences/avg_len

curl -X POST -H "Content-type: application/json" -d '{"text":"My 201-123-4567 cat is gray. 2017899876 It doesn\"t have feathers."}' http://localhost:8080/phones




Design a system that can take in sample text and perform a variety of functions that process/analyze the text in various ways.

You are to build an API (web) server that has an endpoint for each of the functions described below. You may use any language or framework that you want, as well as any outside resources (Google, libraries, etc.). We do not expect you to be able to finish every aspect of the assignment-- whatever progress you make is acceptable. Several of these functions can be complex, but given the time constraints we expect you to make sensible decisions and document them (noting possible pitfalls) and not spend an inordinate amount of time going down rabbit-holes. Additionally, we'd rather see 3 working endpoints than 6 buggy ones.

These are ordered by expected difficulty from easiest to hardest, but do not feel you need to do them in any particular order.

Functions (and HTTP paths):

Average word length (/words/avg_len)
Given a sample text, find the average length of a word across all the words in the text.
It is left to you to define what constitutes a single word, but generally it should have at least one character and contain no numbers.
Your tokenization need not be perfect, but be sure to document any choices you make that affect tokenization.
Input: text
Ouput: a number
Most common word (/words/most_com)
Given a sample text, find the word that occurs most frequently in the text.
In the case of multiple words having the same frequency, ties should be broken by choosing the word that comes first alphabetically.
Input: text
Output: a single word
Find the word(s) with the median frequency in the corpus (/words/median)
Given a sample text, find the word (or words) that occupy the middle spot of the frequency distribution (commonly known as the "median") of words in the text.
Input: text
Ouput: a list of words
Average sentence length (/sentences/avg_len)
Given a sample text, find the average length of each sentence contained within the text.
It is left to you to define what constitutes a sentence, but be sure to document any choices you make that affect this definition.
Input: text
Output: a number
Find all phone numbers (/phones)
Given a sample text, find all the phone numbers contained within the text.
It is left to you to define what constitutes a phone number, but be sure to document any choices you make that affect this definition. Please also document which formats your phone-number-parsing algorithm will handle and which formats it will not.
Input: a text
Ouput: a list of phone numbers
All endpoints should be HTTP POSTs that consume and produce JSON objects. The JSON request should have a single tag -- "text" -- like the example below:

{ "text" : "My cat is gray. It doesn't have feathers." }

If you get a working server up, you should be able to copy-paste the following command into a terminal and get a result back:

curl -X POST -H "Content-type: application/json" -d '{"text":"My cat is gray. It doesn\"t have feathers."}' http://localhost:8080/words/avg_len

The algorithms to come up with answers to the questions above can be trivial, but there are a number of choices you can make that will affect the answer, and we're interested in seeing how you think about those choices and make reasoned decisions. Additionally, we care a lot about the quality and readability of your code: we're a team of people who work together, and you can be sure that when you write code at Mark43 it will, in time, be modified by other developers. Making your code as easy to read and understand as possible is critical to being a contributing member of the team.