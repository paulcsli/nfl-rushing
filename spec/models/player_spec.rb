require "rails_helper"

RSpec.describe Player, :type => :model do
  context "requires all attributes to be present upon saving to database" do
    it "throws exception due to missing name" do
      attrs = {
        "team" => "JAX",
        "position" => "RB",
        "attempts_per_game" => 2,
        "attempts" => 2,
        "rushing_yds_total" => 7,
        "rushing_yds_per_attempt" => 3.5,
        "rushing_yds_per_game" => 7,
        "touch_down" => 0,
        "longest_rush" => "7",
        "first_down" => 0,
        "first_down_pct" => 0,
        "twenty_yards" => 0,
        "forth_yards" => 0,
        "fumbles" => 0,
      }
      expect {
        Player.create!(attrs)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context '#filter_by and #order_by' do
    before(:all) do
      @p1 = create(:player, name: "Paul Li")
      @p2 = create(:player, name: "Eric Clapton")
      @p3 = create(:player, name: "Jimmy Page")
      @p4 = create(:player, name: "Jimi Hendrix")
    end

    it 'returns filtered, sorted records' do
      result = Player.filter_by({attr_name: 'name', search_value: 'jim'}).order_by({attr_name: 'id', desc: false})
      expect(result.pluck(:id)).to eq([@p3.id, @p4.id])
    end

    context '#filter_by' do
      it 'filters by name attribute' do
        result = Player.filter_by({attr_name: 'name', search_value: 'jim'})
        expect(result.size).to eq(2)
        expect(result.pluck(:name)).to include(@p3.name, @p4.name)
      end
  
      it 'filters regardless of letter cases of prefix' do
        result1 = Player.filter_by({attr_name: 'name', search_value: 'Jim'})
        result2 = Player.filter_by({attr_name: 'name', search_value: 'jIM'})
        expect(result1.pluck(:id)).to eq(result2.pluck(:id))
      end
  
      it 'return nil if nothing matches' do
        expect(Player.filter_by({attr_name: 'name', search_value: 'Xi'}).size).to eq(0)
      end

      it 'return all records if searching attributes are invalid' do
        expect(Player.filter_by({attr_name: '', search_value: ''}).size).to eq(4)
        expect(Player.filter_by({attr_name: 'name', search_value: ''}).size).to eq(4)
        expect(Player.filter_by({attr_name: '', search_value: 'Jim'}).size).to eq(4)
        expect(Player.filter_by({attr_name: 'wierd stuff', search_value: 'Jim'}).size).to eq(4)
      end
    end

    context '#order_by' do
      it 'sorts ascendingly by name attribute' do
        result = Player.order_by({attr_name: 'name', desc: false})
        expect(result.pluck(:name)).to eq([@p1.name, @p2.name, @p3.name, @p4.name].sort)
      end

      it 'sorts descendingly by name attribute' do
        result = Player.order_by({attr_name: 'name', desc: true}) 
        expect(result.pluck(:name)).to eq([@p1.name, @p2.name, @p3.name, @p4.name].sort {|a, b| b <=> a})
      end

      it 'return records in original order if invalid options provided' do
        expect(Player.order_by({attr_name: '', desc: ''}).pluck(:id)).to eq(Player.all.pluck(:id))
        expect(Player.order_by({attr_name: 'wierd stuff', desc: 'Jim'}).pluck(:id)).to eq(Player.all.pluck(:id))
      end
    end
  end
end
