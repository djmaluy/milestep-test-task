require 'rails_helper'

RSpec.describe Task, type: :model do

  current_user = User.first_or_create!(first_name: "Test", last_name: "Test", 
          email:"test@test.net", password: 'password', password_confirmation: 'password' )
 

  it 'checks that a task has title' do
    task = Task.new(title: '', description: "test", user: current_user, due_date: "2021-07-13", priority: 2 )

    expect(task).to_not be_valid
    task.title = "some text" 
    expect(task).to be_valid
  end

  it 'checks that a task title between 2 and 100 chracters' do
    task = Task.new(title: '', description: "test", user: current_user, due_date: "2021-07-13", priority: 2 )

    expect(task).to_not be_valid
    task.title = "text" 
    expect(task).to be_valid

    max_chars = "kaD93zdvOx98dVOcZ8NQgidI9FEcj3l0VKuSzYmIJrqHhLCXWntO4XVoxRNAFzNVzKCAM4SdIDWOVIFBIm6xphvZ5tOnLsubX8Eu"
    task.title = max_chars
    expect(task).to be_valid

    task.title = max_chars + '1'
    expect(task).to_not be_valid
  end

  it 'checks that task priority has numerical value' do
    task = Task.new(title: 'Some text', description: "test", user: current_user, due_date: "2021-07-13", priority: 2 )

    expect(task.priority).to be_a(Integer)
    
  end

end