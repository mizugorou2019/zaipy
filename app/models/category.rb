class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '紙袋' },
    { id: 3, name: 'ボックス' },
    { id: 4, name: '装飾' },
    { id: 5, name: 'その他' }
  ]
end
