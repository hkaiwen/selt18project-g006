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

  {:questions => 'transgression means:', :answer => 'violation', :option2 => 'compression', :option3 => 'persuasion',
   :option4 => 'exemption', :explanation => 'A transgression is something that is against a command or law. Whether you
   are cheating on a test, or cheating on a spouse, you are committing transgressions that are not easily forgiven.'},

  {:questions => 'latent means:', :answer => 'not presently active', :option2 => 'perfect and complete in every respect',
   :option3 => 'many and varied', :option4 => 'sudden and strong', :explanation => 'Latent is an adjective that you use
   to describe something that is capable of becoming active or at hand, though it is not currently so.'},

  {:questions => 'arduous means:', :answer => 'laborious', :option2 => 'monstrous', :option3 => 'ominous',
   :option4 => 'perilous', :explanation => 'Use the adjective arduous to describe an activity that takes a lot of
    effort. Writing all those college essays and filling out the applications is an arduous process!'},

  {:questions => 'pragmatic means:', :answer => 'concerned with practical matters', :option2 => 'relating to the study
  of diseases', :option3 => 'completely unordered and unpredictable and confusing', :option4 => 'free from limitation',
   :explanation => 'To describe a person or a solution that takes a realistic approach, consider the adjective pragmatic.
   The four-year-old who wants a unicorn for her birthday isnt being very pragmatic.'},

  {:questions => 'adulterate means:', :answer => 'mixed with impurities', :option2 => 'very small',
   :option3 => 'exhibiting clear and deep perception', :option4 => 'decorated with small pieces of colored glass or stone',
   :explanation => 'If you adulterate something, you mess it up. You may not want to adulterate the beauty of freshly
  fallen snow by shoveling it, but how else are you going to get to work?'},

  {:questions => 'gregarious means:', :answer => 'outgoing', :option2 => 'solemn', :option3 => 'rustic',
   :option4 => 'frequent', :explanation => 'If you know someone whos outgoing, sociable, and fond of the company of
    others, you might want to call her gregarious.'},

  {:questions => 'mitigated means:', :answer => 'made less severe or harsh', :option2 => 'enlarged or increased',
   :option3 => 'described in vivid detail', :option4 => 'caused to become widely known',
   :explanation => 'Choose the verb mitigate when something lessens the unpleasantness of a situation. You can mitigate
   your parents anger by telling them you were late to dinner because you were helping your elderly neighbor.'},


]

questions.each do |question|
  Question.create!(question)
end
