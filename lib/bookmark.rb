require 'pg'
class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
        conn =PG.connect( dbname: 'bookmark_manager_test')
      else
        conn = PG.connect( dbname: 'bookmark_manager')
      end


    table =conn.exec("SELECT * FROM bookmarks;")
    table.map{|bookmark| bookmark['url'] }
  end
end
