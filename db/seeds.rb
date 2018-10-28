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

  {:questions => 'celebration means:', :answer => 'a joyful occasion for festivities to mark some happy event',
  :option2 => 'the business given to an establishment by its customers', :option3 => 'a venture off the beaten path',
  :option4 => 'by a person in bringing about a result', :explanation => 'A celebration is a joyful diversion.
  Your math class might have a celebration when you learn that the midterm has been postponed for a week.'},

  {:questions => 'assemble means to:', :answer => 'get together', :option2 => 'keep out', :option3 => 'shut out',
   :option4 => 'let off', :explanation => 'To assemble means to bring together, as in people or parts. The volunteers
   assembled to assemble the bikes for the needy kids.'},

  {:questions => 'The opposite of vanishing is:', :answer => 'appearance', :option2 => 'indirection', :option3 => 'traveling',
   :option4 => 'banishment', :explanation => 'When something is there one minute and gone the next, you can describe its
    disappearance as a vanishing.'},

  {:questions => 'connect means to:', :answer => 'link', :option2 => 'submit', :option3 => 'assist',
   :option4 => 'flood', :explanation => 'Connect means to join together. When a puzzle piece fits into another, they
   connect. You might fly to Chicago and then connect to a flight to LA.'},

  {:questions => 'energy means:', :answer => 'power', :option2 => 'medicine', :option3 => 'weaponry',
   :option4 => 'experimentation', :explanation => 'The general meaning of energy is the ability to be active. If you
   have a lot of energy, it means you like to be active.'},

  {:questions => 'store means:', :answer => 'shop', :option2 => 'college', :option3 => 'habit',
   :option4 => 'passage', :explanation => 'As the sentence "This store stores a large store of rubber ducks" will tell
   you, store is a word with a lot of definitions.'},


  {:questions => 'The opposite of false is:', :answer => 'true', :option2 => 'tame', :option3 => 'public',
   :option4 => 'skillful', :explanation => 'Something thats false is wrong or untrue. If you spread false rumors about
  a friend, youre telling lies.'},

  {:questions => 'What would you most likely do in a gymnasium?', :answer => 'play basketball', :option2 => 'buy clothing',
   :option3 => 'paint a picture', :option4 => 'cook a meal', :explanation => 'A gymnasium is a place people go to exercise
    or participate in sports.'},

  {:questions => 'delete means to:', :answer => 'remove or make invisible', :option2 => 'cause to move faster',
   :option3 => 'provide with abilities or understanding', :option4 => 'give a statement representing something',
   :explanation => 'The author looked at the computer screen in horror. With one keystroke she had deleted her entire
    manuscript. Delete means to erase.'},

  {:questions => 'simple means:', :answer => 'easy', :option2 => 'naive', :option3 => 'stupid',
   :option4 => 'rare', :explanation => 'Simple refers to something thats easy and uncomplicated, without too many steps
   to follow.'},

  {:questions => 'wonderful means:', :answer => 'fantastic', :option2 => 'average', :option3 => 'direct',
   :option4 => 'possible', :explanation => 'Wonderful is better than good — its even better than great, like your
   wonderful luck — finding buried treasure on your very first diving expedition.'},

  {:questions => 'The opposite of healthy is:', :answer => 'sick', :option2 => 'suitable', :option3 => 'modest',
   :option4 => 'apt', :explanation => 'Healthy means having good health. Its the opposite of sick, but also can mean
   "doing well" in a general sense. '},









]

questions.each do |question|
  Question.create!(question)
end
