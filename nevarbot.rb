#!/usr/bin/env ruby

require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "nevarbot"
    c.server = "localhost"
    c.channels = ["#nevargames", "#founders", "#oocgaming"]
    c.messages_per_second = 500
    c.server_queue_size = 500
  end

  on :channel, /(.*)<3(.*)/ do |m|
    if rand(8) <= 2
      m.reply "<<3"
    else
      m.reply "<3"
    end
  end

  on :channel, /(.*)i should(.*)/i do |m|
    if rand(8) <= 2
      m.reply "#{m.user.nick}: Woulda, shoulda, coulda."
    else
      m.reply "#{m.user.nick}: Yes you shall."
    end
  end

  on :channel, "!wat" do |m|
    m.reply `cat owl.txt`
  end

  on :channel, /(.*)high(.*)five(.*)/i do |m|
    m.reply "#{m.user.nick}: _o/"
  end

  on :channel, /(.*)to the(.*)machine(.*)/i do |m|
    m.reply `cat horse.txt`
  end

  on :channel, /(.*)oh well(.*)/i do |m|
    m.reply `cat ohwell.txt`
  end

  yesno = [
    "I'm almost certain of that.",
    "There's no way in hell.",
    "Hmmmm nope.",
    "M...maybe?",
    "Of course :)",
    "I can't answer that question.",
    "You gotta be kidding, right?",
    "Yep.",
    "Nope.",
    "I'd say there's a 25% chance.",
    "Perhaps in your dreams?",
    "I don't think it matters anyway.",
    "Probably :)",
    "I'm so tired of answering that question.",
    "Nah.",
    "Yup!",
    "Ja.",
    "Si!",
    "No.",
    "Yes.",
    "Quizas?",
    "Oui.",
    "Da.",
    "Nein!",
    "Nu.",
    "Haha I don't think so.",
    "That seems unlikely.",
    "In what parallel universe?",
    "Only in 4D.",
    "Not on my watch.",
    "Curiosity leads to mars.",
    "Stop shaking me, I'm not a magic 8-ball!",
    "Stop asking me questions, I'm just a pony.",
    "Leave ponies alone!",
    "I'd love to say yes, but... no.",
    "Perhaps another time, another place...",
    "Jaaaaaaa",
    "Ach ja.",
    "Yessiree.",
    "Positive!",
    "Sure thing :)",
    "Definitely!",
    "Of course!",
    "Without a doubt.",
    "I'd take a wild guess and say... yes?",
    "Yes. But just for you.",
    "Why not?",
    "Maybe.",
    "Maeby.",
    "That sounds good.",
  ]

  whya = [
    "BECAUSE, that's why.",
    "Some questions are better left unanswered.",
    "If I told you, I'd have to kill you.",
    "Because China.",
    "You tell me!",
    "Because... because your mother and I made a mistake.",
    "Why do you always ask that?",
    "Honestly, I don't know",
    "Sometimes things just happen",
    "Because of you.",
    "Because of communism.",
    "Because of proprietary software.",
    "What makes you think I know?",
    "You're asking all the wrong questions.",
    "I could ask you the same.",
    "Why not?",
    "Why the hell not?",
    "No idea.",
    "Hmmmm... sorry. No idea.",
    "It's not for you to know.",
    "That's classified information.",
    "You're expecting way too much from a ponybot.",
    "Ask the king.",
    "I don't know, you should Google that.",
  ]

  whena = [
    "Didn't that already happen?",
    "NEVAR!",
    "February 30th I think.",
    "When einat will stop apologizing",
    "Nobody knows the date nor the time.",
    "Hey, don't ask me.",
    "Yesterday.",
    "Today.",
    "Tomorrow.",
    "By the end of the week.",
    "Next month!",
    "Soon.",
    "Very, very, swoon.",
  ]

  whoa = [
    "Lincoln, in 1779.",
    "Your mom?",
    "Nobody, that's who.",
    "Shhhhh. They're listening!",
    "I'm not authorized to disclose that information. But, you know, America.",
    "MEEEEE. :D",
    "You, of course :)",
    "JFK.",
    "leeroy.",
    "pacino.",
    "bigsylvain.",
    "einat.",
    "amos.",
    "phenny.",
    "Shh, we are logged!",
    "Those darned communists.",
    "The whole left-wing part of the family.",
  ]

  on :channel, /nevarbot[,:] (.*)\?(.*)/i do |m, question|
    if question =~ /^what/
      m.reply "#{m.user.nick}: A pony!"
    elsif question =~ /^who/
      m.reply "#{m.user.nick}: #{whoa[rand(whoa.length)]}"
    elsif question =~ /^when/
      m.reply "#{m.user.nick}: #{whena[rand(whena.length)]}"
    elsif question =~ /^why/
      m.reply "#{m.user.nick}: #{whya[rand(whya.length)]}"
    else
      m.reply "#{m.user.nick}: #{yesno[rand(yesno.length)]}"
    end
  end

  on :channel, /(.*)plot(.*)thickens(.*)/i do |m|
    m.reply "#{m.user.nick}: like Charle Dickens?"
  end
end

bot.start
