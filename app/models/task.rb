class Task < ApplicationRecord
  belongs_to :list

  def self.all_tasks(list_id)
    Task.find_by_sql("
      SELECT *
      FROM tasks AS t 
      WHERE #{list_id} = t.list_id 
    ")
  end 

  def self.single_list_t(list_id)
    List.find_by_sql("
      SELECT * 
      FROM lists
      WHERE id = #{list_id}
    ").first  
  end 

  def self.single_task(list_id, id) 
    Task.find_by_sql(["
    SELECT * 
    FROM tasks AS t 
    WHERE t.id = ? AND t.list_id = ? 
    ", id, list_id]).first
  end 
end
