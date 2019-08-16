require 'rails_helper'

RSpec.describe Task, type: :model do
    # 名前があれば有効な状態にすること
    it "is valid with a task_name, content" do
        task = Task.new(
            task_name:'課題１',
            content:'テスト')
        expect(task).to be_valid
    end
    # コンテントが101文字以上なら無効な状態であること
    it "is invalid with content is 101 or more characters" do
        task = Task.new(content:'1'*102)
        task.valid?
        expect(task.errors[:content]).to include("is too long (maximum is 100 characters)")
    end

  end