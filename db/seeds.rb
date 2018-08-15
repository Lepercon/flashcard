# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
question_1 = Question.create!(text: "What is OSINT?")

Answer.create!(answertext: "Original Source Intelligence", 
	correct: false, question_id: question_1.id)
Answer.create!(answertext: "Open Source Intelligence", 
	correct: true, question_id: question_1.id)
Answer.create!(answertext: "Operational Systems Intelligence", 
	correct: false, question_id: question_1.id)
Answer.create!(answertext: "Open Source Investigatory Network Testing", 
	correct: false, question_id: question_1.id)

question_2 = Question.create!(text: "What is an antivirus?")

Answer.create!(answertext: "Software that is designed to replicate other software", 
	correct: false, question_id: question_2.id)
Answer.create!(answertext: "Hardware which prevents cyber attacks", 
	correct: false, question_id: question_2.id)
Answer.create!(answertext: "Software which detects, stops, and removes viruses and other malicious softwares", 
	correct: true, question_id: question_2.id)
Answer.create!(answertext: "A type of virus pretending to be virus-prevention software", 
	correct: false, question_id: question_2.id)

question_3 = Question.create!(text: "What is a botnet?")

Answer.create!(answertext: "A network of infected devices, connected to the internet, used to commit coordinated cyber attacks without their owners' knowledge", 
	correct: true, question_id: question_3.id)
Answer.create!(answertext: "A firewall extension which detects and stops bots from accessing your internal network", 
	correct: false, question_id: question_3.id)
Answer.create!(answertext: "An infected device, connected to the Internet, used to commit cyber attacks without their owner's knowledge", 
	correct: false, question_id: question_3.id)
Answer.create!(answertext: "A network of time travelling Robots created to enslave the human race", 
	correct: false, question_id: question_3.id)

