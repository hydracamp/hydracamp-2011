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
  
  def self.xml_template
    Nokogiri::XML::Document.parse('<?xml version="1.0" encoding="UTF-8"?>
<eac-cpf xmlns="urn:isbn:1-931666-33-4"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xsi:schemaLocation="urn:isbn:1-931666-33-4 http://eac.staatsbibliothek-berlin.de/schema/cpf.xsd">
    <control>
   	 <recordId>P004686</recordId>
   	 <maintenanceStatus>new</maintenanceStatus>
   	 <maintenanceAgency>
   		 <agencyCode>AU-BS</agencyCode>
   		 <agencyName>Bright Sparcs</agencyName>
   	 </maintenanceAgency>
   	 <maintenanceHistory>
   		 <maintenanceEvent>
   			 <eventType>created</eventType>
   			 <eventDateTime>2006-03-28</eventDateTime>
   			 <agentType>human</agentType>
   			 <agent>Helen Hamilton for ANMHP</agent>
   			 <eventDescription>Record Created</eventDescription>
   		 </maintenanceEvent>
   	 </maintenanceHistory>
   	 <sources>
   		 <source xlink:href="http://nla.gov.au/anbd.aut-an35803761" xlink:type="simple">
   		 </source>
   	 </sources>
    </control>
    <cpfDescription>
   	 <identity>
   		 <entityId>P004686</entityId>
   		 <entityType>person</entityType>
   		 <nameEntry xml:lang="eng" scriptCode="Latn">
   			 <part localType="surname"></part>

   			 <part localType="forename"></part>
   			 <authorizedForm>AARC2</authorizedForm>
   		 </nameEntry>
   	 </identity>
   	 <description>
   		 <occupation>
   			 <term></term>
   		 </occupation>
   		 <biogHist>
   			 <p>foo</p>
   			 <chronList>
   				 <chronItem>
   					 <date></date>
   					 <event>Born</event>
   				 </chronItem>
   				 <chronItem>
   					 <date></date>
   					 <event>died</event>
   				 </chronItem>
   			 </chronList>
   		 </biogHist>
   	 </description>
    </cpfDescription>
</eac-cpf>
    ')
  end

end
