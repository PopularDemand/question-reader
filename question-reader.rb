$questions_hash = {}
question_number = 1

#Get separate questions
questions = File.open('allquestions.txt').readlines

#Categorize each element
questions.each do |q| 
	pieces = q.split('/')
	pieces.each { |el| pieces.delete(el) if el.empty? }
	category = pieces.shift
	question = pieces.pop#.strip
	answers = pieces.map!(&:downcase)
	$questions_hash[question_number] = [category, question, answers]
	question_number += 1
end

#Start asking questions
def ask(question_arr)
	category, question, answers = question_arr
	
	puts "\nCategory: #{category}\n"
	puts "Question: #{question}\n"
	puts "Your answer: "
	input = gets.chomp
	
	if answers.include?(input)
		puts "Correct.\n"
	else
		puts "Incorrect.\n"
	end
	
	next_question = Random.rand(200)
	ask($questions_hash[next_question])
end

ask($questions_hash[1])


# ##Class and engine in the works
# # class Question
	# # def initialize(number, category, question, answers)
		# # @number = number
		# # @category = category
		# # @question = question
		# # @answers = answers
	# # end
	
	# # def ask
		# # puts @question
		# # input = gets.chomp
		# # if @answers.include? input
			# # :correct
		# # else
			# # :incorrect
		# # end
	# # end
# # end

# # def Engine()
	# result = question.ask
#	end