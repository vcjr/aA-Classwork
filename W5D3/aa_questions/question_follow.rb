require_relative 'user'
require_relative 'questions_database'
require_relative 'question'

class QuestionFollow
    attr_accessor :user_id, :question_id

    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                question_follows
            JOIN
                users ON users.id = question_follows.user_id
            JOIN
                questions ON questions.id = question_follows.question_id
            WHERE
                question_id = ?
        SQL

        users.map {|user| User.new(user)}
    end

     def self.find_by_id(id)
        follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?;    
        SQL

        follows.map{|follow| QuestionFollow.new(follow)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
   end
end