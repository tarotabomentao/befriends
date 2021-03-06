require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'クエスチョン新規登録' do
    before do
      @question = FactoryBot.build(:question)
    end

    context '新規登録がうまくいくとき' do
      it '全ての項目（user_id, title, country_id, category_id, status_id, text）が存在すれば、登録出来る' do
        expect(@question).to be_valid
      end
    end

    context '新規登録がうまくいなかないとき' do
      it 'titleが空だと登録できない' do
        @question.title = nil
        @question.valid?
        expect(@question.errors.full_messages).to include "Title can't be blank"
      end

      it "country_idが'--'だと登録出来ない" do
        @question.country_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include 'Country has to be selected'
      end

      it "category_idが'--'だと登録出来ない" do
        @question.category_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include 'Category has to be selected'
      end

      it 'textが空だと登録できない' do
        @question.content = nil
        @question.valid?
        expect(@question.errors.full_messages).to include "Content can't be blank"
      end

      it 'Userが紐付いていないと保存できない' do
        @question.user = nil
        @question.valid?
        expect(@question.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
