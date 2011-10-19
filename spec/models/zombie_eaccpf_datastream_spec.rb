require 'spec_helper'

describe ZombieEaccpfDatastream do

  before do
    @ds = ZombieEaccpfDatastream.from_xml('<?xml version="1.0" encoding="UTF-8"?>
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
   			 <part localType="surname">Williams</part>

   			 <part localType="forename">Ash</part>
   			 <authorizedForm>AARC2</authorizedForm>
   		 </nameEntry>
   	 </identity>
   	 <description>
   		 <occupation>
   			 <term>Anthrogastronomist</term>
   		 </occupation>
   		 <biogHist>
   			 <p>foo</p>
   			 <chronList>
   				 <chronItem>
   					 <date>1886</date>
   					 <event>Born</event>
   				 </chronItem>
   				 <chronItem>
   					 <date>1979</date>
   					 <event>died</event>
   				 </chronItem>
   			 </chronList>
   		 </biogHist>
   	 </description>
    </cpfDescription>
</eac-cpf>
    ')
  end

  # it "should have eaten two people" do
  #   @ds.people_eaten.size.should == 2
  # end

  it "should have a date of birth" do
    @ds.date_of_birth.first.should == "1886"
  end

  it "should have a date of undeath" do
    @ds.cpf_description.description.biog_hist.chron_list.chron_item.date[1].should == '1979'
    @ds.date_undeath.first.should == '1979'
  end

  it "should access the name" do
    @ds.cpf_description.identity.name_entry.part.should == ['Williams','Ash']
    @ds.cpf_description.identity.name_entry.first_name.should == ['Ash']
    @ds.first_name[0].should == 'Ash'
  end

  it "should be able to set the name" do
    @ds.first_name[0].should == 'Ash'
    @ds.cpf_description.identity.name_entry.first_name = 'Shaun'
    @ds.first_name[0].should == 'Shaun'
  end
  

  it "should use the xml template" do
    ZombieEaccpfDatastream.xml_template.should be_equivalent_to Nokogiri::XML::Document.parse('<?xml version="1.0" encoding="UTF-8"?>
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
    ZombieEaccpfDatastream.new.to_xml.should be_equivalent_to ZombieEaccpfDatastream.xml_template
  end
end

