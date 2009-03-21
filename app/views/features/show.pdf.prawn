
pdf.fill_color "ff6400"
pdf.font "#{Prawn::BASEDIR}/data/fonts/comicsans.ttf"
pdf.text "#{t(:feature)}: #{@feature.title}", :size => 20

pdf.fill_color "003366"
pdf.move_down(30)
pdf.text "#{@feature.why}", :size => 12
pdf.move_down(10)
pdf.text "#{@feature.who}", :size => 12
pdf.move_down(10)
pdf.text "#{@feature.what}", :size => 12

@feature.scenarios.each do |scenario|
pdf.move_down(25)
  pdf.fill_color "ff6400"
  pdf.text "#{t(:scenario)}: #{scenario.title}", :size => 16
  pdf.move_down(24)
  pdf.fill_color "003366"
  scenario.main_steps.each do |step|
    pdf.text "#{t(step.keyword)} #{step.instruction}", :size => 12
    pdf.move_down(10)
    step.children.each do |child_step|
      pdf.text "#{t(child_step.keyword)} #{child_step.instruction}", :size => 12
      pdf.move_down(10)
    end
  end
end
