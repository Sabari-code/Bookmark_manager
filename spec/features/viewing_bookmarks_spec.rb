
feature 'FEATURE Viewing bookmarks' do
  scenario 'FEATURE visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end
#ADDING THE TEST DATA


feature 'FEATURE Viewing bookmarks' do
  scenario 'FEATURE A user can see bookmarks' do

    conn=PG.connect(dbname: 'bookmark_manager_test')

    conn.exec("INSERT INTO bookmarks VALUES(1,'http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
        conn.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"

  end
end
