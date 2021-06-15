hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

final_array = []

hsh.each do |_, hash|
  final_array << hash[:colors].map(&:capitalize) if hash[:type] == 'fruit'
  final_array << hash[:size].upcase if hash[:type] == 'vegetable'
end

p final_array
