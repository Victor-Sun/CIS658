ruby '2.4.1' # added at the top under source!
group :development, :test do
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# other gems might be here in your file
end
group :production do
gem 'pg', '~> 0.18'
# other gems might be here in your file
end
