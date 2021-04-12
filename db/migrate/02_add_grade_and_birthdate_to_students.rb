# db/migrate/02_add_favorite_food_to_artists.rb

class AddGradeAndBirthdateToStudents < ActiveRecord::Migration[5.2]
    def change
        add_column :students, :grade, :integer
        add_column :students, :birthdate, :string
    end
end
