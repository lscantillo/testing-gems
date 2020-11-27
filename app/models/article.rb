class Article < ApplicationRecord

    after_commit :create_log_on_create, on: :create
    after_commit :create_log_on_update, on: :update
    after_commit :create_log_on_destroy, on: :destroy
    
    def create_log_on_create
      #id = self.attributes 
      user_id = self.user_id
      #id = LogManager::LogService.call('Hola')
      id = LogManager::LogService.new('Hola').test
      log = Log.create(user_id: user_id, action: "Create - Article_id: #{id}")
    end

    def create_log_on_update
      id = self.id
      user_id = self.user_id
      log = Log.create(user_id: user_id, action: "Update - Article_id: #{id}")
    end

    def create_log_on_destroy
      id = self.id
      user_id = self.user_id
      log = Log.create(user_id: user_id, action: "Delete - Article_id: #{id}")
    end
end
