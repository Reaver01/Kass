module Bot
  module Events
    # Message event
    module Message
      extend Discordrb::EventContainer
      message(containing: 'Crowned Beast') do |event|
        event.respond "\"A beast that wears a crown of bone,\nPrancing through the lush green.\nM" \
          "ount the beast upon its throne,\nFor only then the shrine is seen\""
      end

      message(containing: 'Song of Storms') do |event|
        event.respond "\"When a lost hero calls down lightning from the sky\nThe monk responds fr" \
          'om a giant mound on high"'
      end

      message(containing: 'Master of the Wind') do |event|
        event.respond "\"He breaks the rocks that serve to bind\nAbove the tempestuous bay.\nOn w" \
          "ing of cloth and wood entwined,\nHe lands on the altar to open the way\""
      end

      message(containing: 'Sign of the Shadow') do |event|
        event.respond "\"As light shines from the northwest skies,\nFrom the tower’s shadow an ar" \
          "row flies.\nPierce heaven's light to reveal the prize.\""
      end

      message(containing: 'Two Rings') do |event|
        event.respond "\"When a single arrow threads two rings,\nthe shrine will rise like birds " \
          'on wings"'
      end

      message(containing: 'Under a Red Moon') do |event|
        event.respond "\"When the moon bleeds and the fiends are reborn\nThe monk will invite you" \
          " as they have sworn.\nBut first you must stand on the pedestal bare\nWith nothing betw" \
          'een you and the night air."'
      end

      message(containing: "Serpent's Jaws") do |event|
        event.respond "\"Where the forest dragon splays its jaws,\nA shrine sleeps with noble cau" \
          'se."'
      end
    end
  end
end
