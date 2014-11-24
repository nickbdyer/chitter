env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, DATABASE_URL || "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!