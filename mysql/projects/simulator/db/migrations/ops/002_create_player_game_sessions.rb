# frozen-string-literal: true

Sequel.migration do
  up do
    create_table? :player_game_sessions do
      # String :id, primary_key: true
      # foreign_key :player_session_id, :player_sessions, type: String

      # primary_key :id
      # foreign_key :player_session_id, :player_sessions
      
      primary_key :id, type: :Bignum
      foreign_key :player_session_id, :player_sessions, type: :Bignum
      
      String :data
      DateTime :created_at
      DateTime :updated_at
      # DateTime2 :created_at
      # DateTime2 :updated_at

      index :updated_at
    end
  end

  down do
    drop_table :player_game_sessions
  end
end