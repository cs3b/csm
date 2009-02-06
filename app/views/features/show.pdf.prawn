
pdf.fill_color "003366"
pdf.text 'Feature:'
pdf.pad(20) {pdf.text 'Viewing Features'}

pdf.table [
[Feature,{:text => 'View My Features', :colspan => 2}],
[nil,{:text => 'to do something', :colspan => 2}],
[nil,nil, 'programmer'],
[nil,{:text => 'want to be best', :colspan => 2}]
]