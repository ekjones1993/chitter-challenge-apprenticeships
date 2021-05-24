require 'peep'
require 'database_helper'
require 'pg'

describe Peep do

  describe '#all' do
    it 'user can view all peeps' do
      peep = Peep.create(message: "peep1", date:"21/05/2021")
      Peep.create(message: "peep2", date:"21/05/2021")
      Peep.create(message: "peep3", date:"21/05/2021")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'peep1'
    end
  end

  describe '#create' do
    it 'user can create a new peep' do
      peep = Peep.create(message: "peep1", date: "21/05/2021")
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'peep1'
    end
  end

  describe '#search' do
    it 'user can search for a keyword and see corresponding peeps' do
      Peep.create(message: "peep1", date: "21/05/2021")
      Peep.create(message: "secret peep2", date: "21/05/2021")
      Peep.create(message: "secret peep3", date: "21/05/2021")

      peeps = Peep.search(keyword: "secret")
      expect(peeps.length).to eq 2
    end
  end
end
