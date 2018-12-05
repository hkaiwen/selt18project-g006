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
   efficacy of broccoli as a health benefit.', :level => 'Hard'},

  {:questions => 'transgression means:', :answer => 'violation', :option2 => 'compression', :option3 => 'persuasion',
   :option4 => 'exemption', :explanation => 'A transgression is something that is against a command or law. Whether you
   are cheating on a test, or cheating on a spouse, you are committing transgressions that are not easily forgiven.',:level => 'Hard'},

  {:questions => 'latent means:', :answer => 'not presently active', :option2 => 'perfect and complete in every respect',
   :option3 => 'many and varied', :option4 => 'sudden and strong', :explanation => 'Latent is an adjective that you use
   to describe something that is capable of becoming active or at hand, though it is not currently so.',:level => 'Medium'},

  {:questions => 'arduous means:', :answer => 'laborious', :option2 => 'monstrous', :option3 => 'ominous',
   :option4 => 'perilous', :explanation => 'Use the adjective arduous to describe an activity that takes a lot of
    effort. Writing all those college essays and filling out the applications is an arduous process!',:level => 'Medium'},

  {:questions => 'pragmatic means:', :answer => 'concerned with practical matters', :option2 => 'relating to the study
  of diseases', :option3 => 'completely unordered and unpredictable and confusing', :option4 => 'free from limitation',
   :explanation => 'To describe a person or a solution that takes a realistic approach, consider the adjective pragmatic.
   The four-year-old who wants a unicorn for her birthday isnt being very pragmatic.',:level => 'Medium'},

  {:questions => 'adulterate means:', :answer => 'mixed with impurities', :option2 => 'very small',
   :option3 => 'exhibiting clear and deep perception', :option4 => 'decorated with small pieces of colored glass or stone',
   :explanation => 'If you adulterate something, you mess it up. You may not want to adulterate the beauty of freshly
  fallen snow by shoveling it, but how else are you going to get to work?',:level => 'Easy'},

  {:questions => 'gregarious means:', :answer => 'outgoing', :option2 => 'solemn', :option3 => 'rustic',
   :option4 => 'frequent', :explanation => 'If you know someone whos outgoing, sociable, and fond of the company of
    others, you might want to call her gregarious.',:level => 'Medium'},

  {:questions => 'mitigated means:', :answer => 'made less severe or harsh', :option2 => 'enlarged or increased',
   :option3 => 'described in vivid detail', :option4 => 'caused to become widely known',
   :explanation => 'Choose the verb mitigate when something lessens the unpleasantness of a situation. You can mitigate
   your parents anger by telling them you were late to dinner because you were helping your elderly neighbor.',:level => 'Hard'},

  {:questions => 'celebration means:', :answer => 'a joyful occasion for festivities to mark some happy event',
   :option2 => 'the business given to an establishment by its customers', :option3 => 'a venture off the beaten path',
   :option4 => 'by a person in bringing about a result', :explanation => 'A celebration is a joyful diversion.Your math
  class might have a celebration when you learn that the midterm has been postponed for a week.',:level => 'Easy'},

  {:questions => 'assemble means to:', :answer => 'get together', :option2 => 'keep out', :option3 => 'shut out',
   :option4 => 'let off', :explanation => 'To assemble means to bring together, as in people or parts. The volunteers
   assembled to assemble the bikes for the needy kids.',:level => 'Easy'},

  {:questions => 'The opposite of vanishing is:', :answer => 'appearance', :option2 => 'indirection', :option3 => 'traveling',
   :option4 => 'banishment', :explanation => 'When something is there one minute and gone the next, you can describe its
    disappearance as a vanishing.',:level => 'Easy'},

  {:questions => 'connect means to:', :answer => 'link', :option2 => 'submit', :option3 => 'assist',
   :option4 => 'flood', :explanation => 'Connect means to join together. When a puzzle piece fits into another, they
   connect. You might fly to Chicago and then connect to a flight to LA.',:level => 'Easy'},

  {:questions => 'energy means:', :answer => 'power', :option2 => 'medicine', :option3 => 'weaponry',
   :option4 => 'experimentation', :explanation => 'The general meaning of energy is the ability to be active. If you
   have a lot of energy, it means you like to be active.',:level => 'Easy'},

  {:questions => 'store means:', :answer => 'shop', :option2 => 'college', :option3 => 'habit',
   :option4 => 'passage', :explanation => 'As the sentence "This store stores a large store of rubber ducks" will tell
   you, store is a word with a lot of definitions.',:level => 'Easy'},

  {:questions => 'The opposite of false is:', :answer => 'true', :option2 => 'tame', :option3 => 'public',
   :option4 => 'skillful', :explanation => 'Something thats false is wrong or untrue. If you spread false rumors about
  a friend, youre telling lies.',:level => 'Easy'},

  {:questions => 'What would you most likely do in a gymnasium?', :answer => 'play basketball', :option2 => 'buy clothing',
   :option3 => 'paint a picture', :option4 => 'cook a meal', :explanation => 'A gymnasium is a place people go to exercise
    or participate in sports.',:level => 'Easy'},

  {:questions => 'delete means to:', :answer => 'remove or make invisible', :option2 => 'cause to move faster',
   :option3 => 'provide with abilities or understanding', :option4 => 'give a statement representing something',
   :explanation => 'The author looked at the computer screen in horror. With one keystroke she had deleted her entire
    manuscript. Delete means to erase.',:level => 'Easy'},

  {:questions => 'simple means:', :answer => 'easy', :option2 => 'naive', :option3 => 'stupid',
   :option4 => 'rare', :explanation => 'Simple refers to something thats easy and uncomplicated, without too many steps
   to follow.',:level => 'Easy'},

  {:questions => 'wonderful means:', :answer => 'fantastic', :option2 => 'average', :option3 => 'direct',
   :option4 => 'possible', :explanation => 'Wonderful is better than good — its even better than great, like your
   wonderful luck — finding buried treasure on your very first diving expedition.',:level => 'Easy'},

  {:questions => 'The opposite of healthy is:', :answer => 'sick', :option2 => 'suitable', :option3 => 'modest',
   :option4 => 'apt', :explanation => 'Healthy means having good health. Its the opposite of sick, but also can mean
    "doing well" in a general sense.',:level => 'Easy'},


  {:questions => 'The opposite of leader is:', :answer => 'follower', :option2 => 'avatar', :option3 => 'mourner',
   :option4 => 'agent', :explanation => 'A leader is the one in the charge, the person who convinces other people to
    follow. A great leader inspires confidence in other people and moves them to action.',:level => 'Medium'},

  {:questions => 'Which of the following is most likely a characteristic of a lizard?', :answer => 'a long tail',
   :option2 => 'a pointy beak', :option3 => 'bushy fur', :option4 => 'tapered fins', :explanation => 'A lizard is a type
   of reptile that has scales for skin, a long body, a pointy tail, and usually four legs. And they breathe fire. Okay,
    maybe not that last part, but that would be awesome.',:level => 'Easy'},

  {:questions => 'vote means:', :answer => 'election', :option2 => 'instruction', :option3 => 'conclusion',
   :option4 => 'reflection', :explanation => 'Your vote is your official choice on some specific question. You might feel
  that your vote hardly counts in a Presidential election, though your vote for student council treasurer might feel like
   it has a lot more importance.',:level => 'Medium'},

  {:questions => 'zealot means:', :answer => 'fanatic', :option2 => 'pauper', :option3 => 'narrator',
   :option4 => 'traveler', :explanation => 'The hamburger zealot was so fanatical about his burgers that he camped
    outside his favorite fast-food joint for hours every morning, waiting for it to open. And he would never put mustard
    on them, only ketchup.',:level => 'Hard'},

  {:questions => 'digression means:', :answer => 'detour', :option2 => 'delight', :option3 => 'debate',
   :option4 => 'demand', :explanation => 'Digression means detour.',:level => 'Hard'},


  {:questions => 'Which of the following would be considered the most anthropoid?', :answer => 'a chimpanzee',
   :option2 => 'a dragonfly', :option3 => 'a wolf', :option4 => 'a birch tree', :explanation => 'Next time you are in
   need of a subtle insult that will completely go over your oafish brother’s head, accuse him of being just barely
   anthropoid, or somewhat resembling a human.',:level => 'Medium'},

  {:questions => 'repudiate means to: ', :answer => 'disown', :option2 => 'educate', :option3 => 'detain',
   :option4 => 'employ', :explanation => 'To repudiate something is to reject it, or to refuse to accept or support it.
  If you grow up religious, but repudiate all organized religion as an adult, you might start spending holidays at the
  movies, or just going to work.',:level => 'Hard'},


  {:questions => 'Which of the following might ward off birds?', :answer => 'a scarecrow', :option2 => 'feathers',
   :option3 => 'bird seed', :option4 => 'a birdhouse', :explanation => 'A ward is a group of rooms or a section in a
  hospital or prison; in a hospital, different wards deal with different needs, like the psychiatric ward or maternity
  ward.',:level => 'Medium'},

  {:questions => 'insipid means:', :answer => 'uninteresting', :option2 => 'scurvy', :option3 => 'glib',
   :option4 => 'vernacular', :explanation => 'Something insipid is lacking in flavor or interest. You will probably find
   the generic poems inside of greeting cards insipid.',:level => 'Medium'},

  {:questions => 'derivative means:', :answer => 'not original, secondary', :option2 => 'limited to a particular area',
   :option3 => 'not capable of being understood', :option4 => 'suitable to your needs', :explanation => 'Alert: shifting
   parts of speech! As a noun, a derivative is kind of financial agreement or deal. As an adjective, though, derivative
   describes something that borrows heavily from something else that came before it.',:level => 'Easy'},

  {:questions => 'loquacious means:', :answer => 'chatty', :option2 => 'felicitous', :option3 => 'statutory',
   :option4 => 'gusty', :explanation => 'A loquacious person talks a lot, often about stuff that only they think is
  interesting. You can also call them chatty or gabby, but either way, theyre loquacious.',:level => 'Medium'},

  {:questions => 'precarious means:', :answer => 'not secure', :option2 => 'incapable of physical sensation',
   :option3 => 'practicing great self-denial', :option4 => 'located beneath or below', :explanation => 'Grab for the
  adjective precarious when something is unstable, dangerous or difficult and likely to get worse. Are you totally broke
   and the people you owe money to keep calling? Youre in a precarious financial situation!',:level => 'Hard'},

  {:questions => 'dogmatic means:', :answer => 'characterized by assertion of unproved principles',
   :option2 => 'characterized by very careful or fastidious choice', :option3 => 'filled with or evoking sadness',
   :option4 => 'suffering severe physical strain', :explanation => 'To be dogmatic is to follow a set of rules no
    matter what. The rules might be religious, philosophical, or made-up, but dogmatic people would never waver in their
   beliefs so don’t even think of trying to change their minds.',:level => 'Hard'},

  {:questions => 'neophyte means:', :answer => 'beginner', :option2 => 'instructor', :option3 => 'researcher',
   :option4 => 'benefactor', :explanation => 'A neophyte is someone whos brand new at something. Youre a neophyte the
  first time you pick up a guitar and start learning to play.',:level => 'Hard'},

  {:questions => 'indolent means:', :answer => 'lazy', :option2 => 'incidental', :option3 => 'consecutive',
   :option4 => 'lurid', :explanation => 'Indolent is an adjective meaning slow or lazy. It can take an indolent teenager
  hours to get out of bed on a weekend morning. Often its noon before he finally comes shuffling down to breakfast in
  his pajamas.',:level => 'Hard'},

  {:questions => 'benevolent means:', :answer => 'kind', :option2 => 'careful', :option3 => 'personal',
   :option4 => 'unbelievable', :explanation => 'Choose the adjective benevolent for someone who does good deeds or shows
  goodwill. If your teacher collects homework with a benevolent smile, shes hoping that youve done a good job.',:level => 'Medium'},


  {:questions => 'benignant means:', :answer => 'kindly', :option2 => 'careful', :option3 => 'uncertain',
   :option4 => 'sensible', :explanation => 'Someone whos benignant is goodhearted and kind. Your favorite teacher in
   elementary school was probably the most benignant of them all.',:level => 'Hard'},

  {:questions => 'eleemosynary means:', :answer => 'philanthropic', :option2 => 'illegible', :option3 => 'soluble',
   :option4 => 'migratory', :explanation => 'Eleemosynary is an adjective that describes things that are related to
  charitable giving, especially when youre talking about assistance to the poor. Monetary donations to eleemosynary
  institutions are usually tax deductible',:level => 'Hard'},

  {:questions => 'gracious means:', :answer => 'characterized by kindness and warm courtesy', :option2 => 'involving
  intelligence rather than emotions or instinct', :option3 => 'derived from direct participation in events or activities',
   :option4 => 'marked by care and effort', :explanation => 'Gracious means "kind, courteous, and compassionate," like
  your gracious reply to a rude question like, "So, did you ever learn to hit a softball?"',:level => 'Medium'},

  {:questions => 'considerate means:', :answer => 'unselfish', :option2 => 'unlucky', :option3 => 'unafraid',
   :option4 => 'unashamed', :explanation => 'Being considerate is being polite and caring. People like it when youre
  considerate of their feelings.',:level => 'Medium'},

  {:questions => 'beneficent means:', :answer => 'generous in assistance to the poor', :option2 => 'named',
   :option3 => 'working or spreading in a hidden and usually injurious way', :option4 => 'of the most contemptible kind',
   :explanation => 'Beneficent is the type of act that helps others. If youre a beneficent person, you probably spend a
  lot of your time volunteering at soup kitchens or homeless shelters, helping people who are less fortunate than you
    are.', :level => 'Easy'},

  {:questions => 'lurid means:', :answer => 'shining with an unnatural red glow', :option2 => 'slow to heal or develop
  and usually painless', :option3 => 'successive', :option4 => 'serving during an intermediate interval of time',
   :explanation => 'When people are lured into looking at something, they may be drawn to it because its a shocking,
  graphic, or horrible scene, something lurid and very vivid that pulls them in. Your mother might complain that she
  hates lurid TV shows — ones that are overly sensationalized and meant to shock.',:level => 'Hard'},


  {:questions => 'profusion means:', :answer => 'abundance', :option2 => 'tranquility', :option3 => 'mobility',
   :option4 => 'independence', :explanation => 'If theres an abundance of something, you can say that theres a profusion
  of it. Hilarious and bizarre YouTube videos certainly exist in profusion.',:level => 'Medium'},


  {:questions => 'rage means:', :answer => 'a state of extreme anger', :option2 => 'the second of two or the second
  mentioned of two', :option3 => 'an unstated doubt that prevents you from accepting something', :option4 => 'a level of
 existence or development', :explanation => 'Rage is a really intense anger. Some frustrated drivers let their emotions
  boil over into road rage when another car cuts them off, for example.',:level => 'Medium'},

  {:questions => 'coarse means:', :answer => 'unrefined', :option2 => 'unpopular', :option3 => 'unavoidable',
   :option4 => 'undaunted', :explanation => 'Coarse can mean rough to the touch or vulgar. Its good to have coarse sand
  paper, but not good to have coarse manners.',:level => 'Easy'},

  {:questions => 'mocking means:', :answer => 'playfully vexing, especially by ridicule', :option2 => 'aroused to
  impatience or anger', :option3 => 'devoted to a cause or ideal or purpose', :option4 => 'barely credible',
   :explanation => 'When you talk to or about someone in a mocking tone, youre making fun of them in a nasty, mean way.',
    :level => 'Easy'},

  {:questions => 'courteous means:', :answer => 'gracious', :option2 => 'secure', :option3 => 'conscientious',
   :option4 => 'conventional', :explanation => 'If you are courteous, your good manners show friendliness and concern for
   others, like your courteous habit of holding the door for people entering a building with you.',:level => 'Medium'},

  {:questions => 'imperious means:', :answer => 'overbearing', :option2 => 'ascetic', :option3 => 'dubious',
   :option4 => 'sordid', :explanation => 'Someone who is imperious gives orders in a way that shows they feel superior or
   more important than other people. You might want the smartest kid in the class as your lab partner, but not if they
  have an imperious attitude and boss you around.',:level => 'Hard'},

  {:questions => 'harsh means:', :answer => 'unpleasantly stern', :option2 => 'difficult to find', :option3 => 'large in
   spatial extent or range or scope or quantity', :option4 => 'deserving or inciting pity', :explanation => 'Harsh means
   severe or strict, particularly when referring to punishment. It would be a harsh punishment if you got grounded for
    two weeks just for coming home a little late for dinner.',:level => 'Easy'},

  {:questions => 'salve means:', :answer => 'ointment', :option2 => 'reservoir', :option3 => 'figurine',
  :option4 => 'heirloom', :explanation => 'A salve is something that soothes. You can use an ointment as a salve for an
  itchy rash, or maybe your kind words can act as a salve to comfort a heartsick friend.', :level => 'Medium'},

  {:questions => 'militancy means:', :answer => 'aggressiveness', :option2 => 'responsiveness', :option3 => 'inquisitiveness',
   :option4 => 'deliberateness', :explanation => 'Militancy means using violence or aggressiveness, usually to support a cause.
    Militancy make sense on the battlefield but is unwelcome in the school cafeteria during lunch. So no food fights.',
   :level => 'Hard'},

  {:questions => 'putrefy means to:', :answer => 'decay with an offensive smell', :option2 => 'cause to be frightened',
   :option3 => 'divide into two branches', :option4 =>'get cleansed', :explanation => 'When eggs rot, they putrefy or
  start to smell really, really bad. Putrefy is to begin stinking, usually when rotting or decomposing.',
    :level => 'Hard'},


  {:questions => 'unkempt means:', :answer => 'untidy', :option2 => 'adaptable', :option3 => 'voracious',
   :option4 => 'undefined', :explanation => 'Unkempt literally means “not combed,” but use it to describe anything with
    a sloppy appearance. Your hair probably looks unkempt when you roll out of bed in the morning. Keep it that way if
    youre going for the rock star look', :level => 'Medium'},

  {:questions => 'vicinity means:', :answer => 'locality', :option2 => 'development', :option3 => 'address',
   :option4 => 'direction', :explanation => 'If something is in your vicinity, its in the surrounding area or nearby
   region — its in the neighborhood, so to speak. If theres a garbage dump in your vicinity, youll certainly smell it.',
   :level => 'Easy'},

  {:questions => 'jovial means:', :answer => 'jolly', :option2 => 'joined', :option3 => 'jealous',
   :option4 => 'judicial', :explanation => 'Use jovial to describe people who show good humor and are full of joy.
  Santa Claus, with his constant "ho-ho-hoing" is a jovial figure.', :level => 'Easy'},

  {:questions => 'whet means to:', :answer => 'sharpen by rubbing', :option2 => 'reject outright and bluntly',
   :option3 => 'destroy completely, as if down to the roots', :option4 => 'be or do something to a greater degree',
   :explanation => 'To whet is to sharpen. You could whet a knifes blade with a whetting stone, or you could whet your
    appetite by having some Doritos.', :level => 'Medium'},

  {:questions => 'fallible means:', :answer => 'likely to fail or make errors', :option2 => 'capable of being transmitted
 by infection', :option3 => 'reduced to the smallest possible size or amount or degree', :option4 => 'rejecting any belief
 in gods', :explanation => 'As humans we are all fallible, because fallible means likely to make errors or fail. Nobodys
   perfect, after all.', :level => 'Easy'},

  {:questions => 'dispirited means:', :answer => 'dejected', :option2 => 'tenuous', :option3 => 'delayed',
   :option4 => 'circuitous', :explanation => 'Dispirited means being down in the dumps or depressed. Losing his girlfriend
    and job on the same day could make someone dispirited — feeling gloomy and absolutely miserable.',
   :level => 'Medium'},

  {:questions => 'luster means:', :answer => 'sheen', :option2 => 'inaccuracy', :option3 => 'topography',
   :option4 => 'fluency', :explanation => 'Something with luster has a certain kind of sheen or shininess, like the way
    a new pair of shoes looks right before you step into a pile of mud.', :level => 'Medium'},

  {:questions => 'sleek means:', :answer => 'groomed', :option2 => 'scrupulous', :option3 => 'plastic',
   :option4 => 'collective', :explanation => 'If you hair is sleek, it is smooth and glossy. If your car is sleek, its
  shiny and looks like it goes fast. Sleek always means smooth, glossy, and streamlined.',
   :level => 'Easy'},

 {:questions => ' bandy means to:', :answer => 'discuss', :option2 => 'disguise', :option3 => 'survey',
   :option4 => 'assume', :explanation => 'Bandy is a verb that means to toss many ideas around without focusing on just
  one. If youve ever brainstormed, you know what this is like — you bandy about different ideas until you find one that works.',
   :level => 'Medium'},

  {:questions => 'taut means:', :answer => 'tight', :option2 => 'piquant', :option3 => 'stoic',
   :option4 => 'indelible', :explanation => 'Taut means tight rather than slack. The tightrope ought to be taut and not
   dangling down by the lion cage.',
   :level => 'Hard'},

  {:questions => 'lax means:', :answer => 'loose', :option2 => 'laden', :option3 => 'lengthy',
   :option4 => 'laborious', :explanation => 'Those parents who let their kids eat all their Halloween candy the night of
 October 31st? Their parenting style might be described as lax. A paperclip chain used as a bike lock? Thats an example of
 lax security.', :level => 'Medium'},

  {:questions => 'bog means:', :answer => 'marsh', :option2 => 'channel', :option3 => 'bonfire', :option4 => 'cluster',
   :explanation => 'Youd be pretty soggy by morning if you accidentally set your tent up in a bog. A bog is a swampy kind
   of ground made up mostly of decomposing plants and mosses.', :level => 'Hard'},

  {:questions => 'forswear means to:', :answer => 'recant', :option2 => 'quaff', :option3 => 'vitiate',
   :option4 => 'visualize', :explanation => 'To forswear is to give up an idea, belief, or habit that you’ve had
    previously. New Year’s is a popular time to forswear anything from sweets to bad relationships.', :level => 'Hard'},

  {:questions => 'personification means:', :answer => 'incarnation', :option2 => 'segregation', :option3 => 'importation',
   :option4 => 'legislation', :explanation => 'Personification means "giving humans qualities to an abstract idea," as in
  a movie villain who is the personification of evil.', :level => 'Medium'},

  {:questions => 'caesura means:', :answer => 'rest', :option2 => 'strophe', :option3 => 'couplet',
   :option4 => 'rhyme', :explanation => 'A caesura is a break in a conversation, a line of verse, or a song. Usually,
  a caesura means total silence, but not for long.', :level => 'Hard'},

  {:questions => 'litotes means:', :answer => 'understatement for rhetorical effect', :option2 => 'unintelligible talking',
   :option3 => 'frivolous banter', :option4 => 'using words that imitate the sound they denote', :explanation => 'You
  probably use litotes every day. Ever say "This dessert isnt bad to mean "Its pretty good"? Or "Our teacher wasnt in
  the best mood today" to mean "He was really grouchy"? Well, those are examples of litotes — a way of saying something
  by saying what its not.', :level => 'Hard'},

  {:questions => 'consonance means:', :answer => 'harmoniousness', :option2 => 'constancy', :option3 => 'instability',
   :option4 => 'haste', :explanation => 'The noun consonance refers to a state of agreement or harmony of parts, and
  it often refers to a pleasing combination of musical sounds.', :level => 'Medium'}
]

users = [{:first_name => 'admin', :last_name => 'admin', :email => 'admin@account.com', :admin => true, :password => '123456'}]
questions.each do |question|
  Question.create!(question)
end

users.each do |user|
  User.create!(user)
end
