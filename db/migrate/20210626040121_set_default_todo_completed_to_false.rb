class SetDefaultTodoCompletedToFalse < ActiveRecord::Migration[6.1]
  def change
  	change_column_default :todos, :complete, from: nil, to:true
  end
end
