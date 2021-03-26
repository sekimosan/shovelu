class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: "10代"},
    { id: 2, name: "20代前半"},
    { id: 3, name: "20代後半"},
    { id: 4, name: "30代前半"},
    { id: 5, name: "30代後半"},
    { id: 6, name: "40代前半"},
    { id: 7, name: "40代後半"},
    { id: 8, name: "50代前半"},
    { id: 9, name: "50代後半"},
    { id:10, name: "60代"},
  ]
  include ActiveHash::Associations
  has_many :users
end  