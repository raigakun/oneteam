require 'rails_helper'
describe Photo do
  describe '#create' do
    it "imageがない場合は投稿できないこと" do
      photo = Photo.new(image: "")
      photo.valid?
      expect(photo.errors[:image]).to include("は必要です。")
    end
  end
end
