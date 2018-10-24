# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
questions = [
  {:questions => 'efficacy means:', :answer => 'capacity or power to produce a desired result', :option2 => 'the state
   of being restored to a former condition', :option3 => 'good-natured tolerance of delay or incompetence',
   :option4 => 'the act of concealing something from the public', :explanation => 'The degree to which a method or
   medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the
   efficacy of broccoli as a health benefit.'},


  {:questions => 'pragmatic means:', :answer => 'alterable', :option2 => 'realistic', :option3 => 'relaxing',
   :option4 => 'domesticated', :explanation => 'To describe a person or a solution that takes a realistic approach,
  consider the adjective pragmatic. The four-year-old who wants a unicorn for her birthday isnt being very pragmatic.'},

  {:questions => 'efficacy means:', :answer => 'capacity or power to produce a desired result', :option2 => 'the state
   of being restored to a former condition', :option3 => 'good-natured tolerance of delay or incompetence',
   :option4 => 'the act of concealing something from the public', :explanation => 'The degree to which a method or
   medicine brings about a specific result is its efficacy. You might not like to eat it, but you cant question the
   efficacy of broccoli as a health benefit.'},


]

questions.each do |question|
  CreateQuestions.change!(question)
end
