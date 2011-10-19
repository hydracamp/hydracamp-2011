class ZombieEaccpfDatastream < ActiveFedora::NokogiriDatastream

  set_terminology do |t|
    t.root(:path=>'eac-cpf', :xmlns=>'urn:isbn:1-931666-33-4')
    t.cpf_description(:path=>'cpfDescription') {
      t.identity {
        t.name_entry(:path=>'nameEntry') {
          t.part
          t.first_name(:ref=>[:cpf_description, :identity, :name_entry, :part], :attributes=>{'localType'=>'forename'})
          t.last_name(:ref=>[:cpf_description, :identity, :name_entry, :part], :attributes=>{'localType'=>'surname'})
        }
      }
      t.description {
        t.biog_hist(:path=>'biogHist') {
          t.chron_list(:path=>'chronList') {
            t.chron_item(:path=>'chronItem') {
              t.date
            }
            t.undeath_chron_item(:path=>"chronItem[oxns:event/text()='died']") {
              t.date_undeath(:path=>'date')
            }
            t.born_chron_item(:path=>"chronItem[oxns:event/text()='Born']") {
              t.date_born(:path=>'date')
            }
          }
        }
      }
    }
    t.date_undeath(:proxy=>[:cpf_description, :description, :biog_hist, :chron_list, :undeath_chron_item, :date_undeath ])
    t.date_of_birth(:proxy=>[:cpf_description, :description, :biog_hist, :chron_list, :born_chron_item, :date_born ])
    t.first_name(:proxy=>[:cpf_description, :identity, :name_entry, :first_name])
  end

end
