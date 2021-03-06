require 'gilded_rose'

describe "#update_quality" do
  context "when given a +5 Dexterity Vest" do
    context "when prior to sell date" do
      it "decrements sell_in by one" do
        vest = [Item.new("+5 Dexterity Vest", 10, 20)]
        update_quality(vest)

        expect(vest.first.sell_in).to eq 9
      end

      it "decrements quality by one" do
        vest = [Item.new("+5 Dexterity Vest", 10, 20)]
        update_quality(vest)

        expect(vest.first.quality).to eq 19
      end
    end

    context "when after sell date" do
      it "decrements quality by two" do
        vest = [Item.new("+5 Dexterity Vest", 10, 20)]
        11.times do
          update_quality(vest)
        end

        expect(vest.first.quality).to eq 8
        expect(vest.first.sell_in).to eq(-1)
      end

      context "when quality reaches 0" do
        it "no longer decrements quality" do
          vest = [Item.new("+5 Dexterity Vest", 10, 20)]
          25.times do
            update_quality(vest)
          end

          expect(vest.first.quality).to eq 0
          expect(vest.first.sell_in).to eq(-15)
        end
      end
    end
  end

  context "when given Aged Brie " do
    it "increments quality by one" do
      brie = [Item.new("Aged Brie", 2, 0)]
      update_quality(brie)

      expect(brie.first.quality).to eq 1
    end

    it "decrements sell_in by one" do
      brie = [Item.new("Aged Brie", 2, 0)]
      update_quality(brie)

      expect(brie.first.sell_in).to eq 1
    end

    context "when quality reaches fifty" do
      it "no longer increments quality" do
        brie = [Item.new("Aged Brie", 2, 0)]
        60.times do
          update_quality(brie)
        end

        expect(brie.first.quality).to eq 50
        expect(brie.first.sell_in).to eq(-58)
      end
    end
  end

  context "when given Elixer of the Mongoose" do
    context "when prior to sell date" do
      it "decrements sell_in by one" do
        elixir = [Item.new("Elixir of the Mongoose", 5, 7)]
        update_quality(elixir)

        expect(elixir.first.sell_in).to eq 4
      end

      it "decrements quality by one" do
        elixir = [Item.new("Elixir of the Mongoose", 5, 7)]
        update_quality(elixir)

        expect(elixir.first.quality).to eq 6
      end
    end

    context "when after sell date" do
      it "decrements quality by two" do
        elixir = [Item.new("Elixir of the Mongoose", 5, 7)]
        6.times do
          update_quality(elixir)
        end

        expect(elixir.first.quality).to eq 0
        expect(elixir.first.sell_in).to eq(-1)
      end

      context "when quality reaches 0" do
        it "no longer decrements quality" do
          elixir = [Item.new("Elixir of the Mongoose", 5, 7)]
          25.times do
            update_quality(elixir)
          end

          expect(elixir.first.quality).to eq 0
          expect(elixir.first.sell_in).to eq(-20)
        end
      end
    end
  end

  context "when given Sulfuras, Hand of Ragnaros" do
    it "maintains quality regardless of time" do
      sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      rand(15).times do
        update_quality(sulfuras)
      end

      expect(sulfuras.first.quality).to eq 80
      expect(sulfuras.first.sell_in).to eq 0
    end
  end

  context "when given Backstage passes" do
    context "when sell_in is over 10" do
      it "increments quality by one" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        3.times do
          update_quality(pass)
        end

        expect(pass.first.quality).to eq 23
      end

      it "decrements sell_in by one" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        3.times do
          update_quality(pass)
        end

        expect(pass.first.sell_in).to eq 12
      end
    end

    context "when sell_in is 10 or less" do
      it "increments quality by two" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        7.times do
          update_quality(pass)
        end

        expect(pass.first.quality).to eq 29
      end

      it "decrements sell_in by one" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        7.times do
          update_quality(pass)
        end

        expect(pass.first.sell_in).to eq 8
      end
    end

    context "when sell_in is 5 or less" do
      it "increments quality by three" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        12.times do
          update_quality(pass)
        end

        expect(pass.first.quality).to eq 41
      end

      it "decrements sell_in by one" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        12.times do
          update_quality(pass)
        end

        expect(pass.first.sell_in).to eq 3
      end
    end

    context "when sell_in is 0" do
      it "sets the quality to 0" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        16.times do
          update_quality(pass)
        end

        expect(pass.first.quality).to eq 0
      end

      it "decrements sell_in by one" do
        pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        16.times do
          update_quality(pass)
        end

        expect(pass.first.sell_in).to eq(-1)
      end
    end

  end

  context "when given a Conjured Mana Cake" do

  end
end













