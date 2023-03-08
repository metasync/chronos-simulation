# frozen-string-literal: true

Sequel.migration do
  up do
    create_table? :player_game_sessions do
      # String :id, primary_key: true
      # String :player_session_id

      # Integer :id, primary_key: true
      # Integer :player_session_id

      Bignum :id, primary_key: true
      Bignum :player_session_id

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