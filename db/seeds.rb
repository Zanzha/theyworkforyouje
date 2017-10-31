Role.create!([
  {name: "Admin"},
  {name: "Guest"}
])
User.create!([
  {email: "admin@admin.com", password: "topsecret", password_confirmation: "topsecret", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role_id: 1, created_by: "devteam", username: "Captain Placeholder"}
])
Parish.create!([
  {name: "Saint Helier"},
  {name: "Grouville"},
  {name: "Saint Brelade"},
  {name: "Saint Clement"},
  {name: "Saint John"},
  {name: "Saint Lawrence"},
  {name: "Saint Martin"},
  {name: "Saint Mary"},
  {name: "Saint Ouen"},
  {name: "Saint Peter"},
  {name: "Saint Saviour"},
  {name: "Trinity"}
])

