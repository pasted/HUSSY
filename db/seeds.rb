# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

roles = Role.create([{ :name => 'ADMIN' }, { :name => 'SUBMITTER' }])

#Add password before seeding the database
#default admin account
if !User.find_by_email("garan.jones@hpa.org.uk")
  User.create([ :first_name => 'Garan', :last_name => 'Jones', :email => 'garan.jones@hpa.org.uk', :password => 'hladrb_01_k2mmdfrc', :current_state => 'active'])
  this_role = Role.find_by_name('ADMIN')
  admin_user = User.find_by_email("garan.jones@hpa.org.uk")
  admin_user.roles.push(this_role)
  admin_user.save
end

#Only run these seeds if the relevant database tables are empty
#use rake db:migrate to reset the tables
if Ethnicity.all.length == 0
	ethnicities = Ethnicity.create([
		{ :code => '1',
		  :group_code => 'A',
		  :group_name => 'White',
		  :description => 'Any White background'
		},
		{ :code => '2',
		  :group_code => 'B',
		  :group_name => 'Mixed',
		  :description => 'White and Black Caribbean'
		},
		{ :code => '3',
		  :group_code => 'B',
		  :group_name => 'Mixed',
		  :description => 'White and Black African'
		},
		{ :code => '4',
		  :group_code => 'B',
		  :group_name => 'Mixed',
		  :description => 'White and Asian'
		},
		{ :code => '5',
		  :group_code => 'B',
		  :group_name => 'Mixed',
		  :description => 'Any Other Mixed background'
		},
		{ :code => '6',
		  :group_code => 'C',
		  :group_name => 'Asian or Asian British',
		  :description => 'Indian'
		},
		{ :code => '7',
		  :group_code => 'C',
		  :group_name => 'Asian or Asian British',
		  :description => 'Pakistani'
		},
		{ :code => '8',
		  :group_code => 'C',
		  :group_name => 'Asian or Asian British',
		  :description => 'Bangladeshi'
		},
		{ :code => '9',
		  :group_code => 'C',
		  :group_name => 'Asian or Asian British',
		  :description => 'Any Other Asian background'
		},
		{ :code => '10',
		  :group_code => 'D',
		  :group_name => 'Black or British Black',
		  :description => 'Caribbean'
		},
		{ :code => '11',
		  :group_code => 'D',
		  :group_name => 'Black or British Black',
		  :description => 'African'
		},
		{ :code => '12',
		  :group_code => 'D',
		  :group_name => 'Black or British Black',
		  :description => 'Any Other African background'
		},
		{ :code => '13',
		  :group_code => 'E',
		  :group_name => 'Chinese or other ethnic group',
		  :description => 'Chinese'
		},
		{ :code => '14',
		  :group_code => 'E',
		  :group_name => 'Chinese or other ethnic group',
		  :description => 'Any other'
		},
		{ :code => '15',
		  :group_code => 'F',
		  :group_name => 'Unknown',
		  :description => 'Ethnicity not known'
		}
		])
end

if Drug.all.length == 0
	drugs = Drug.create([
		{ :name => 'NSAIDs',
		  :category => 'NSAID',
		  :comment => 'Non-steroidal anti-inflammatory'
		},
		{ :name => 'Corticosteroids',
		  :category => 'CORTICOSTEROID',
		  :comment => ''
		},
		{ :name => 'Antidiarrhoeals',
		  :category => 'ANTIDIARRHOEAL',
		  :comment => ''
		},
		{ :name => 'Antimotility agents',
		  :category => 'ANTIMOTILITY',
		  :comment => ''
		},	
		{ :name => 'Antibiotics | Antibacterials',
		  :category => 'ANTIBIOTIC',
		  :comment => ''
		},
		{ :name => 'Antihypertensives',
		  :category => 'ANTIHYPERTENSIVE',
		  :comment => ''
		},
		])
end

if Assay.all.length == 0
	assays = Assay.create([
		{ :name => 'Reduced haemoglobin',
		  :unit => 'g/dL'
		},
		{ :name => 'Reduced platelet count',
		  :unit => 'x 10e9/L'
		},
		{ :name => 'Elevated plasma creatinine',
		  :unit => 'micromol/L'
		},
		{ :name => 'Red blood cell fragmentation',
		  :unit => 'present/absent'
		}
		])
end

if Therapy.all.length == 0
	therapies = Therapy.create([
		{ :name => 'Peritoneal dialysis'
		},
		{ :name => 'Haemodialysis'
		},
		{ :name => 'Plasma therapy'
		},
		{ :name => 'Laparotomy'
		},
		{ :name => 'Haemofiltration'
		}
		])
end

if Result.all.length == 0
	results = Result.create([
		{ :name => 'Seemingly full recovery'
		},
		{ :name => 'Dialysis dependent'
		},
		{ :name => 'Renal impairment'
		},
		{ :name => 'Neurological impairment'
		},
		{ :name => 'Continued treatment for hypertension'
		},
		{ :name => 'Any other'
		}
		])
end

if Classification.all.length == 0
	klassifications = Classification.create([
		{ :name => 'Heamolytic Ureamic Syndrome'
		},
		{ :name => 'Pre-existing kidney disease'
		},
		{ :name => 'Pre-existing urinary tract infection'
		},
		{ :name => 'Diarrhoea'
		},
		{ :name => 'Bloody diarrhoea'
		},
		{ :name => 'Fever'
		},
		{ :name => 'Abdominal pain'
		},
		{ :name => 'Oligo/anuria'
		},
		{ :name => 'Septicaemia'
		},
		{ :name => 'Malignant hypertension'
		},
		{ :name => 'Major haemorrhage'
		},
		{ :name => 'Seizures and other neurological involvement'
		},
		{ :name => 'Cardiomyopathy'
		},
		{ :name => 'Diabetes mellitus'
		},
		{ :name => 'Influenza-like illness'
		},
		{ :name => 'Pneumococcus infection'
		},
		]) 	
end

if Characteristic.all.length == 0
  characteristics = Characteristic.create([
  	  { :name => "Weight",
  	    :unit => "KGs"
  	  },
  	  { :name => "Height",
  	    :unit => "CM"
  	  }
		
  ])	
	
end

if Hospital.all.length == 0
  hospitals = Hospital.create([
	{ :name => "ABERDEEN ROYAL INFIRMARY"
	    },
	{ :name => "ADDENBROOKE'S HOSPITAL NHS TRUST"
	    },
	{ :name => "AIREDALE GENERAL HOSPITAL"
	    },
	{ :name => "ALDERHEY CHILDREN'S HOSPITAL"
	    },
	{ :name => "ALEXANDRA HOSPITAL"
	    },
	{ :name => "ALL SAINT'S HOSPITAL"
	    },
	{ :name => "ALTNAGELVIN AREA HOSPITAL"
	    },
	{ :name => "ANTRIM AREA HOSPITAL"
	    },
	{ :name => "ARDKEEN REGIONAL HOSPITAL"
	    },
	{ :name => "ARDS COMMUNITY HOSPITAL"
	    },
	{ :name => "ARROWE PARK HOSPITAL"
	    },
	{ :name => "ASHURST HOSPITAL"
	    },
	{ :name => "AYRSHIRE CENTRAL HOSPITAL"
	    },
	{ :name => "BARNET GENERAL HOSPITAL"
	    },
	{ :name => "BARNSLEY HOSPITAL NHS TRUST"
	    },
	{ :name => "BASILDON UNIVERSITY HOSPITAL"
	    },
	{ :name => "BASINGSTOKE DISTRICT HOSPITAL"
	    },
	{ :name => "BASSETLAW DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "BATTLE HOSPITAL"
	    },
	{ :name => "BEDFORD GENERAL HOSPITAL"
	    },
	{ :name => "BELFAST CITY HOSPITAL"
	    },
	{ :name => "BELVOIR PARK HOSPITAL"
	    },
	{ :name => "BILLINGE HOSPITAL"
	    },
	{ :name => "BIRCH HILL HOSPITAL"
	    },
	{ :name => "BIRMINGHAM CHILDREN'S HOSPITAL"
	    },
	{ :name => "BIRMINGHAM CITY HOSPITAL NHS TRUST"
	    },
	{ :name => "BIRMINGHAM HEARTLANDS HOSPITAL"
	    },
	{ :name => "BISHOP AUCKLAND GENERAL HOSPITAL"
	    },
	{ :name => "BLYTH COMMUNITY HOSPITAL & HC"
	    },
	{ :name => "BODWRDDA"
	    },
	{ :name => "BON SECOURS HOSPITAL"
	    },
	{ :name => "BOOTH HALL CHILDRENS HOSPITAL"
	    },
	{ :name => "BORDERS GENERAL HOSPITAL"
	    },
	{ :name => "BRADFORD ROYAL INFIRMARY"
	    },
	{ :name => "BRAID VALLEY HOSPITAL SITE"
	    },
	{ :name => "BRECONSHIRE WAR MEMORIAL HOSPITAL"
	    },
	{ :name => "BRIGHTON GENERAL HOSPITAL"
	    },
	{ :name => "BRISTOL ROYAL HOSPITAL FOR CHILDREN"
	    },
	{ :name => "BRONGLAIS GENERAL HOSPITAL"
	    },
	{ :name => "BROOMFIELD HOSPITAL"
	    },
	{ :name => "BUCKLAND HOSPITAL"
	    },
	{ :name => "BURNLEY DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "BURTON DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "CARDIFF ROYAL INFIRMARY"
	    },
	{ :name => "CARDIFF UNIVERSITY"
	    },
	{ :name => "CASTLEBAR GENERAL HOSPITAL"
	    },
	{ :name => "CASTLEFORD, NORMANTON & DISTRICT HOSPITAL"
	    },
	{ :name => "CAVAN GENERAL HOSPITAL"
	    },
	{ :name => "CEFNI HOSPITAL"
	    },
	{ :name => "CENTRAL MIDDLESEX HOSPITAL"
	    },
	{ :name => "CHADWELL HEATH HOSPITAL"
	    },
	{ :name => "CHASE FARM HOSPITAL"
	    },
	{ :name => "CHELSEA AND WESTMINSTER HOSPITAL"
	    },
	{ :name => "CHELTENHAM GENERAL HOSPITAL"
	    },
	{ :name => "CHESTERFIELD ROYAL HOSPITAL"
	    },
	{ :name => "CHRISTIE HOSPITAL"
	    },
	{ :name => "CHURCHILL HOSPITAL"
	    },
	{ :name => "CLATTERBRIDGE HOSPITAL"
	    },
	{ :name => "CLONMEL HOSPITAL"
	    },
	{ :name => "COLCHESTER DISTRICT HOSPITAL"
	    },
	{ :name => "COLDEAST HOSPITAL"
	    },
	{ :name => "COLERAINE HOSPITAL"
	    },
	{ :name => "COLINDALE HOSPITAL"
	    },
	{ :name => "COLWYN BAY HOSPITAL"
	    },
	{ :name => "CONQUEST HOSPITAL"
	    },
	{ :name => "COOMBE HOSPITAL"
	    },
	{ :name => "CORK REGIONAL HOSPITAL"
	    },
	{ :name => "COSSHAM HOSPITAL"
	    },
	{ :name => "COUNTESS OF CHESTER HOSPITAL"
	    },
	{ :name => "CRAIGAVON AREA HOSPITAL GROUP TRUST"
	    },
	{ :name => "CRAWLEY HOSPITAL"
	    },
	{ :name => "CROSS HOUSES HOSPITAL"
	    },
	{ :name => "CROSSHOUSE HOSPITAL"
	    },
	{ :name => "CUMBERLAND INFIRMARY"
	    },
	{ :name => "DAISY HILL HOSPITAL"
	    },
	{ :name => "DARENT VALLEY HOSPITAL"
	    },
	{ :name => "DARLINGTON MEMORIAL HOSPITAL"
	    },
	{ :name => "DERBY CITY GENERAL HOSPITAL"
	    },
	{ :name => "DERBYSHIRE CHILDREN'S HOSPITAL"
	    },
	{ :name => "DERBYSHIRE ROYAL INFIRMARY"
	    },
	{ :name => "DERRIFORD HOSPITAL"
	    },
	{ :name => "DEWI SANT HOSPITAL"
	    },
	{ :name => "DEWSBURY & DISTRICT HOSPITAL"
	    },
	{ :name => "DIANA PRINCESS OF WALES HOSPITAL"
	    },
	{ :name => "DONCASTER GATE HOSPITAL"
	    },
	{ :name => "DONCASTER ROYAL INFIRMARY"
	    },
	{ :name => "DORSET COUNTY HOSPITAL"
	    },
	{ :name => "DR GRAY'S HOSPITAL"
	    },
	{ :name => "DRYBURN HOSPITAL"
	    },
	{ :name => "DUMFRIES & GALLOWAY ROYAL INFIRMARY"
	    },
	{ :name => "DUNDEE ROYAL INFIRMARY"
	    },
	{ :name => "EALING HOSPITAL"
	    },
	{ :name => "EAST GLAMORGAN GENERAL HOSPITAL"
	    },
	{ :name => "EAST SURREY HOSPITAL"
	    },
	{ :name => "EASTBOURNE DISTRICT GEN. HOSPITAL"
	    },
	{ :name => "EDENHALL HOSPITAL"
	    },
	{ :name => "EDGWARE COMMUNITY HOSPITAL"
	    },
	{ :name => "ELIZABETH GARRETT ANDERSON HOSPITAL"
	    },
	{ :name => "EPSOM DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "ERNE HOSPITAL"
	    },
	{ :name => "EVELINA CHILDREN'S HOSPITAL"
	    },
	{ :name => "FAIRFIELD GENERAL HOSPITAL"
	    },
	{ :name => "FORTH PARK HOSPITAL"
	    },
	{ :name => "FREEMAN HOSPITAL"
	    },
	{ :name => "FRENCHAY HOSPITAL"
	    },
	{ :name => "FRIARAGE HOSPITAL"
	    },
	{ :name => "FRIMLEY PARK HOSPITAL"
	    },
	{ :name => "FURNESS GENERAL HOSPITAL"
	    },
	{ :name => "GALWAY REGIONAL HOSPITAL"
	    },
	{ :name => "GARTNAVAL ROYAL HOSPITAL"
	    },
	{ :name => "GENERAL HOSPITAL"
	    },
	{ :name => "GEORGE ELLIOT HOSPITAL"
	    },
	{ :name => "GILBERT BAIN HOSPITAL"
	    },
	{ :name => "GLAN CLWYD GENERAL HOSPITAL"
	    },
	{ :name => "GLENFIELD HOSPITAL"
	    },
	{ :name => "GLOUCESTER GENERAL HOSPITAL"
	    },
	{ :name => "GLOUCESTER ROYAL HOSPITAL NHS TRUST"
	    },
	{ :name => "GOOD HOPE HOSPITAL"
	    },
	{ :name => "GRAVESEND & NORTH KENT HOSPITAL"
	    },
	{ :name => "GREAT ORMOND STREET HOSPITAL"
	    },
	{ :name => "GREAT WESTERN HOSPITAL"
	    },
	{ :name => "GRIMSBY DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "GUY'S & ST THOMAS'S HOSPITAL"
	    },
	{ :name => "GWYNEDD HOSPITAL  NHS TRUST"
	    },
	{ :name => "HAMMERSMITH HOSPITAL"
	    },
	{ :name => "HAREFIELD HOSPITAL"
	    },
	{ :name => "HAROLD WOOD HOSPITAL"
	    },
	{ :name => "HARROGATE DISTRICT HOSPITAL"
	    },
	{ :name => "HARTLEPOOL GENERAL HOSPITAL"
	    },
	{ :name => "HAWKHEAD HOSPITAL"
	    },
	{ :name => "HEMEL HEMPSTEAD GENERAL HOSPITAL"
	    },
	{ :name => "HEREFORD COUNTY HOSPITAL"
	    },
	{ :name => "HILLINGDON HOSPITAL"
	    },
	{ :name => "HINCHINGBROOKE HOSPITAL"
	    },
	{ :name => "HOMERTON HOSPITAL"
	    },
	{ :name => "HOPE HOSPITAL"
	    },
	{ :name => "HORTON GENERAL HOSPITAL"
	    },
	{ :name => "HOSPITAL OF ST CROSS"
	    },
	{ :name => "HUDDERSFIELD ROYAL INFIRMARY"
	    },
	{ :name => "HULL ROYAL INFIRMARY"
	    },
	{ :name => "IMPERIAL COLLEGE SCHOOL OF MEDICINE"
	    },
	{ :name => "INSTITUTE OF CHILD HEALTH (BRISTOL)"
	    },
	{ :name => "INSTITUTE OF CHILD HEALTH (LONDON)"
	    },
	{ :name => "INTERNATIONAL MISSIONARY HOSPITAL"
	    },
	{ :name => "INVERCLYDE ROYAL HOSPITAL"
	    },
	{ :name => "IPSWICH HOSPITAL NHS TRUST"
	    },
	{ :name => "ISEBROOK HOSPITAL"
	    },
	{ :name => "JAMES PAGET HOSPITAL NHS TRUST"
	    },
	{ :name => "JERSEY GENERAL HOSPITAL"
	    },
	{ :name => "JESSOP HOSPITAL FOR WOMEN"
	    },
	{ :name => "JESSOP WING TEACHING HOSPITAL NHST"
	    },
	{ :name => "JOHN RADCLIFFE HOSPITAL"
	    },
	{ :name => "JOYCE GREEN HOSPITAL"
	    },
	{ :name => "KENT & CANTERBURY HOSPITAL"
	    },
	{ :name => "KETTERING GENERAL HOSPITAL"
	    },
	{ :name => "KING GEORGE'S HOSPITAL"
	    },
	{ :name => "KING'S COLLEGE HOSPITAL MED SCHOOL"
	    },
	{ :name => "KING'S MILL HOSPITAL"
	    },
	{ :name => "KINGSTON HOSPITAL NHS TRUST"
	    },
	{ :name => "KRUF CHILDRENS KIDNEY CENTRE FOR WALES"
	    },
	{ :name => "LANSDOWNE HOSPITAL"
	    },
	{ :name => "LEEDS GENERAL INFIRMARY"
	    },
	{ :name => "LEICESTER GENERAL HOSPITAL"
	    },
	{ :name => "LEICESTER ROYAL INFIRMARY"
	    },
	{ :name => "LEIGH INFIRMARY"
	    },
	{ :name => "LEIGHTON HOSPITAL"
	    },
	{ :name => "LETTERKENNY GENERAL HOSPITAL"
	    },
	{ :name => "LIMERICK REGIONAL HOSPITAL"
	    },
	{ :name => "LINCOLN COUNTY HOSPITAL"
	    },
	{ :name => "LISTER HOSPITAL"
	    },
	{ :name => "LIVERPOOL SCHOOL OF TROPICAL MEDICINE"
	    },
	{ :name => "LIVERPOOL WOMEN'S HOSPITAL"
	    },
	{ :name => "LIVINGSTONE HOSPITAL"
	    },
	{ :name => "LLANDOUGH HOSPITAL"
	    },
	{ :name => "LLWYNPIA HOSPITAL"
	    },
	{ :name => "LONGFORD & WESTMEATH GENERAL HOSPITAL"
	    },
	{ :name => "LOWESTOFT & NORTH SUFFOLK HOSPITAL"
	    },
	{ :name => "LUTON & DUNSTABLE HOSPITAL"
	    },
	{ :name => "LYNEBANK HOSPITAL"
	    },
	{ :name => "MACCLESFIELD DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "MAIDSTONE HOSPITAL"
	    },
	{ :name => "MANCHESTER ROYAL INFIRMARY"
	    },
	{ :name => "MANOR HOUSE HOSPITAL"
	    },
	{ :name => "MANSFIELD COMMUNITY HOSPITAL"
	    },
	{ :name => "MATER HOSPITAL"
	    },
	{ :name => "MATERNITY PAVILION HOSPITAL"
	    },
	{ :name => "MAYDAY UNIVERSITY HOSPITAL"
	    },
	{ :name => "MAYO GENERAL HOSPITAL"
	    },
	{ :name => "MEDWAY MARITIME HOSPITAL"
	    },
	{ :name => "MEMORIAL HOSPITAL"
	    },
	{ :name => "MERCY HOSPITAL"
	    },
	{ :name => "MIDDLESEX HOSPITAL"
	    },
	{ :name => "MIDWESTERN REGIONAL HOSPITAL"
	    },
	{ :name => "MILTON KEYNES GENERAL HOSPITAL"
	    },
	{ :name => "MONKLANDS HOSPITAL"
	    },
	{ :name => "MORRISTON HOSPITAL"
	    },
	{ :name => "MOSELEY HALL HOSPITAL"
	    },
	{ :name => "MOUNT CARMEL HOSPITAL"
	    },
	{ :name => "MUSGROVE PARK HOSPITAL"
	    },
	{ :name => "NATIONAL CHILDREN'S HOSPITAL"
	    },
	{ :name => "NATIONAL HOSPITAL FOR NEUROLOGY"
	    },
	{ :name => "NATIONAL MATERNITY HOSPITAL"
	    },
	{ :name => "NEATH GENERAL HOSPITAL"
	    },
	{ :name => "NEATH PORT TALBOT HOSPITAL"
	    },
	{ :name => "NEVILL HALL HOSPITAL"
	    },
	{ :name => "NEW CROSS HOSPITAL"
	    },
	{ :name => "NEWCASTLE GENERAL HOSPITAL"
	    },
	{ :name => "NEWHAM GENERAL HOSPITAL"
	    },
	{ :name => "NEWRY & MOURNE NHS TRUST"
	    },
	{ :name => "NINEWELLS HOSPITAL & MEDICAL SCHOOL"
	    },
	{ :name => "NOBLES ISLE OF MAN HOSPITAL"
	    },
	{ :name => "NORFOLK & NORWICH UNIV HOSPITAL"
	    },
	{ :name => "NORTH DEVON DISTRICT GEN HOSPITAL"
	    },
	{ :name => "NORTH HAMPSHIRE HOSPITAL"
	    },
	{ :name => "NORTH MANCHESTER GENERAL HOSPITAL"
	    },
	{ :name => "NORTH MIDDLESEX HOSPITAL"
	    },
	{ :name => "NORTH STAFFORDSHIRE HOSPITAL"
	    },
	{ :name => "NORTH STAFFS MATERNITY HOSPITAL"
	    },
	{ :name => "NORTH TYNESIDE GENERAL HOSPITAL"
	    },
	{ :name => "NORTH WING HOSPITAL"
	    },
	{ :name => "NORTHAMPTON GENERAL HOSPITAL"
	    },
	{ :name => "NORTHGATE HOSPITAL"
	    },
	{ :name => "NORTHWICK PARK HOSPITAL"
	    },
	{ :name => "NOTTINGHAM CITY HOSPITAL"
	    },
	{ :name => "NOTTINGHAM UNIVERSITY HOSPITAL"
	    },
	{ :name => "OLDCHURCH HOSPITAL"
	    },
	{ :name => "ORMSKIRK & DISTRICT GEN. HOSPITAL"
	    },
	{ :name => "OUR LADY OF LOURDES HOSPITAL"
	    },
	{ :name => "OUR LADY'S HOSP FOR SICK CHILDREN"
	    },
	{ :name => "PALMER COMMUNITY HOSPITAL"
	    },
	{ :name => "PAPWORTH HOSPITAL"
	    },
	{ :name => "PEMBURY HOSPITAL"
	    },
	{ :name => "PERTH ROYAL INFIRMARY"
	    },
	{ :name => "PETERBOROUGH DISTRICT HOSPITAL"
	    },
	{ :name => "PINDERFIELDS GENERAL HOSPITAL"
	    },
	{ :name => "PLAISTOW HOSPITAL"
	    },
	{ :name => "PONTEFRACT GENERAL INFIRMARY"
	    },
	{ :name => "PONTELAND PRIMARY CARE CENTRE"
	    },
	{ :name => "POOLE HOSPITAL NHS TRUST"
	    },
	{ :name => "PORTALOISE GENERAL HOSPITAL"
	    },
	{ :name => "PORTIUNCULA HOSPITAL"
	    },
	{ :name => "PORTLAND HOSPITAL"
	    },
	{ :name => "PRESTON HALL HOSPITAL"
	    },
	{ :name => "PRINCE CHARLES HOSPITAL"
	    },
	{ :name => "PRINCE PHILLIP HOSPITAL"
	    },
	{ :name => "PRINCESS ALEXANDRA HOSPITAL"
	    },
	{ :name => "PRINCESS ANNE HOSPITAL"
	    },
	{ :name => "PRINCESS CHRISTIAN'S HOSPITAL"
	    },
	{ :name => "PRINCESS ELIZABETH HOSPITAL"
	    },
	{ :name => "PRINCESS MARGARET HOSPITAL"
	    },
	{ :name => "PRINCESS OF WALES HOSPITAL"
	    },
	{ :name => "PRINCESS ROYAL COMMUNITY HEALTH CENTRE"
	    },
	{ :name => "PRINCESS ROYAL HOSPITAL"
	    },
	{ :name => "PRINCESS ROYAL MATERNITY"
	    },
	{ :name => "PRINCESS ROYAL UNIVERSITY HOSPITAL"
	    },
	{ :name => "QUEEN ALEXANDRA HOSPITAL"
	    },
	{ :name => "QUEEN ELIZABETH HOSPITAL - BIRMINGHAM"
	    },
	{ :name => "QUEEN ELIZABETH HOSPITAL - EAST ANGLIA"
	    },
	{ :name => "QUEEN ELIZABETH HOSPITAL - TYNE & WEAR"
	    },
	{ :name => "QUEEN ELIZABETH HOSPITAL NHS TRUST"
	    },
	{ :name => "QUEEN ELIZABETH II HOSPITAL"
	    },
	{ :name => "QUEEN ELIZABETH THE QUEEN MOTHER HOSPITAL"
	    },
	{ :name => "QUEEN MARY UNIVERSITY OF LONDON"
	    },
	{ :name => "QUEEN MARY'S HOSPITAL FOR CHILDREN"
	    },
	{ :name => "QUEEN MARY'S HOSPITAL KENT"
	    },
	{ :name => "QUEEN'S HOSPITAL ROMFORD"
	    },
	{ :name => "QUEEN'S HOSPITAL STAFFORDSHIRE"
	    },
	{ :name => "QUEEN'S UNIVERSITY OF BELFAST"
	    },
	{ :name => "RAIGMORE HOSPITAL"
	    },
	{ :name => "RICHMOND ROYAL HOSPITAL"
	    },
	{ :name => "RIPLEY HOSPITAL"
	    },
	{ :name => "ROCHDALE INFIRMARY"
	    },
	{ :name => "ROSIE MATERNITY HOSPITAL"
	    },
	{ :name => "ROTHERHAM GENERAL HOSPITAL"
	    },
	{ :name => "ROTUNDA HOSPITAL"
	    },
	{ :name => "ROYAL ABERDEEN CHILDREN'S HOSPITAL"
	    },
	{ :name => "ROYAL ALBERT EDWARD INFIRMARY"
	    },
	{ :name => "ROYAL ALEXANDRA CHILDREN'S HOSPITAL"
	    },
	{ :name => "ROYAL ALEXANDRA HOSPITAL SCOTLAND"
	    },
	{ :name => "ROYAL ALEXANDRA HOSPITAL WALES"
	    },
	{ :name => "ROYAL BELFAST HOSPITAL"
	    },
	{ :name => "ROYAL BERKSHIRE HOSPITAL"
	    },
	{ :name => "ROYAL BLACKBURN HOSPITAL"
	    },
	{ :name => "ROYAL BOLTON HOSPITAL"
	    },
	{ :name => "ROYAL BROMPTON HOSPITAL & NHLH"
	    },
	{ :name => "ROYAL CORNHILL HOSPITAL"
	    },
	{ :name => "ROYAL CORNWALL HOSPITAL"
	    },
	{ :name => "ROYAL DEVON & EXETER HOSPITAL"
	    },
	{ :name => "ROYAL FREE HOSPITAL"
	    },
	{ :name => "ROYAL GLAMORGAN HOSPITAL"
	    },
	{ :name => "ROYAL GWENT HOSPITAL"
	    },
	{ :name => "ROYAL HALLAMSHIRE HOSPITAL"
	    },
	{ :name => "ROYAL HAMPSHIRE COUNTY HOSPITAL"
	    },
	{ :name => "ROYAL HOSPITAL FOR SICK CHILDREN - BELFAST"
	    },
	{ :name => "ROYAL HOSPITAL FOR SICK CHILDREN - GLASGOW"
	    },
	{ :name => "ROYAL HOSPITAL FOR SICK CHILDREN - EDINBURGH"
	    },
	{ :name => "ROYAL INFIRMARY OF EDINBURGH"
	    },
	{ :name => "ROYAL JUBILEE MATERNITY HOSPITAL"
	    },
	{ :name => "ROYAL LANCASTER INFIRMARY"
	    },
	{ :name => "ROYAL LIVERPOOL CHILDREN'S HOSPITAL"
	    },
	{ :name => "ROYAL LIVERPOOL UNIVERSITY HOSPITAL"
	    },
	{ :name => "ROYAL LONDON HOSPITAL"
	    },
	{ :name => "ROYAL MANCHESTER CHILDRENS HOSPITAL"
	    },
	{ :name => "ROYAL MARSDEN HOSPITAL"
	    },
	{ :name => "ROYAL NORTHERN INFIRMARY"
	    },
	{ :name => "ROYAL OLDHAM HOSPITAL"
	    },
	{ :name => "ROYAL PRESTON HOSPITAL"
	    },
	{ :name => "ROYAL SHREWSBURY HOSPITAL"
	    },
	{ :name => "ROYAL SURREY COUNTY HOSPITAL"
	    },
	{ :name => "ROYAL SUSSEX COUNTY HOSPITAL"
	    },
	{ :name => "ROYAL UNITED HOSPITAL"
	    },
	{ :name => "ROYAL VICTORIA HOSPITAL - BELFAST"
	    },
	{ :name => "ROYAL VICTORIA HOSPITAL - KENT"
	    },
	{ :name => "ROYAL VICTORIA INFIRMARY"
	    },
	{ :name => "RUSSELLS HALL HOSPITAL"
	    },
	{ :name => "SALISBURY DISTRICT HOSPITAL"
	    },
	{ :name => "SANDWELL DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "SANTHAMS WEST PARK HOSPITAL"
	    },
	{ :name => "SCARBOROUGH GENERAL HOSPITAL"
	    },
	{ :name => "SCHOOL OF CLINICAL MEDICAL SCIENCES (RHEUMATOLOGY)"
	    },
	{ :name => "SCUNTHORPE GENERAL HOSPITAL"
	    },
	{ :name => "SEACROFT HOSPITAL"
	    },
	{ :name => "SHEFFIELD CHILDREN'S HOSPITAL"
	    },
	{ :name => "SHOTLEY BRIDGE HOSPITAL"
	    },
	{ :name => "SINGLETON HOSPITAL"
	    },
	{ :name => "SLIGO GENERAL HOSPITAL"
	    },
	{ :name => "SOUTH CLEVELAND MATERNITY HOSPITAL"
	    },
	{ :name => "SOUTH TYNESIDE DISTRICT HOSPITAL"
	    },
	{ :name => "SOUTHAMPTON GENERAL HOSPITAL"
	    },
	{ :name => "SOUTHAMPTON UNIVERSITY HOSPITAL"
	    },
	{ :name => "SOUTHEND GENERAL HOSPITAL"
	    },
	{ :name => "SOUTHERN DERBYSHIRE H A COMMUNITY UNIT"
	    },
	{ :name => "SOUTHERN GENERAL HOSPITAL"
	    },
	{ :name => "SOUTHLANDS HOSPITAL"
	    },
	{ :name => "SOUTHMEAD GENERAL HOSPITAL"
	    },
	{ :name => "SOUTHPORT & ORMSKIRK HOSPITAL"
	    },
	{ :name => "SOUTHPORT DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "ST ANN'S HOSPITAL"
	    },
	{ :name => "ST BARTHOLOMEW'S HOSPITAL"
	    },
	{ :name => "ST CATHERINE'S HOSPITAL"
	    },
	{ :name => "ST CHARLES HOSPITAL"
	    },
	{ :name => "ST DAVIDS HOSPITAL"
	    },
	{ :name => "ST FINBARR'S HOSPITAL"
	    },
	{ :name => "ST GEORGE'S HOSPITAL"
	    },
	{ :name => "ST GEORGE'S HOSPITAL MEDICAL SCHOOL"
	    },
	{ :name => "ST GILES HOSPITAL"
	    },
	{ :name => "ST JAMES HOSPITAL"
	    },
	{ :name => "ST JAMES'S UNIVERSITY HOSPITAL"
	    },
	{ :name => "ST JOHN'S HOSPITAL - CHELMSFORD"
	    },
	{ :name => "ST JOHN'S HOSPITAL - LIVINGSTON"
	    },
	{ :name => "ST LUKE'S & KILKENNY HOSPITAL"
	    },
	{ :name => "ST LUKE'S HOSPITAL"
	    },
	{ :name => "ST MARKS HOSPITAL"
	    },
	{ :name => "ST MARTIN'S HOSPITAL (TEMPLE WARD)"
	    },
	{ :name => "ST MARY'S HOSPITAL - MANCHESTER"
	    },
	{ :name => "ST MARY'S HOSPITAL - PORTSMOUTH"
	    },
	{ :name => "ST MARY'S HOSPITAL MEDICAL SCHOOL LONDON"
	    },
	{ :name => "ST MICHAEL'S HOSPITAL"
	    },
	{ :name => "ST MICHAEL'S UNIVERSITY HOSPITAL"
	    },
	{ :name => "ST PETER'S HOSPITAL"
	    },
	{ :name => "ST RICHARD'S HOSPITAL"
	    },
	{ :name => "STAFFORDSHIRE GENERAL HOSPITAL"
	    },
	{ :name => "STEPPING HILL HOSPITAL"
	    },
	{ :name => "STIRLING ROYAL INFIRMARY"
	    },
	{ :name => "STOKE MANDEVILLE HOSPITAL"
	    },
	{ :name => "STRATHMARTINE  HOSPITAL"
	    },
	{ :name => "SUNDERLAND ROYAL HOSPITAL"
	    },
	{ :name => "SUTTON COTTAGE HOSPITAL"
	    },
	{ :name => "TAMESIDE GENERAL HOSPITAL"
	    },
	{ :name => "TAUNTON & SOMERSET HOSPITAL"
	    },
	{ :name => "THE ADELAIDE AND NEATH HOSPITAL"
	    },
	{ :name => "THE CALDERDALE ROYAL HOSPITAL"
	    },
	{ :name => "THE CHILDREN'S HOSPITAL LEWISHAM"
	    },
	{ :name => "THE CHILDREN'S UNIVERSITY HOSPITAL"
	    },
	{ :name => "THE JAMES COOK UNIVERSITY HOSPITAL"
	    },
	{ :name => "THE PRINCESS MARGARET HOSPITAL"
	    },
	{ :name => "THE ULSTER HOSPITAL"
	    },
	{ :name => "THE UNIVERSITY OF GLASGOW"
	    },
	{ :name => "THE WAR MEMORIAL HOSPITAL"
	    },
	{ :name => "THURROCK COMMUNITY HOSPITAL"
	    },
	{ :name => "TORBAY DISTRICT GENERAL HOSPITAL"
	    },
	{ :name => "TOWER HILL HOSPITAL"
	    },
	{ :name => "TRAFFORD GENERAL HOSPITAL"
	    },
	{ :name => "TRALEE GENERAL HOSPITAL"
	    },
	{ :name => "UCL MEDICAL SCHOOL"
	    },
	{ :name => "UDSTON HOSPITAL"
	    },
	{ :name => "UNIV OF WALES COLLEGE OF MEDICINE"
	    },
	{ :name => "UNIVERSITY COLLEGE HOSPITAL LONDON"
	    },
	{ :name => "UNIVERSITY HOSPITAL DURHAM"
	    },
	{ :name => "UNIVERSITY HOSPITAL LEWISHAM"
	    },
	{ :name => "UNIVERSITY HOSPITAL OF COVENTRY"
	    },
	{ :name => "UNIVERSITY HOSPITAL OF NORTH TEES"
	    },
	{ :name => "UNIVERSITY HOSPITAL OF WALES"
	    },
	{ :name => "UNIVERSITY OF ABERDEEN MEDICAL SCHOOL"
	    },
	{ :name => "UNIVERSITY OF BIRMINGHAM MEDICAL SCHOOL"
	    },
	{ :name => "UNIVERSITY OF EDINBURGH"
	    },
	{ :name => "UNIVERSITY OF NEWCASTLE"
	    },
	{ :name => "UNIVERSITY OF NOTTINGHAM"
	    },
	{ :name => "UNIVERSITY OF WARWICK"
	    },
	{ :name => "UPTON HOSPITAL"
	    },
	{ :name => "VALE OF LEVEN HOSPITAL"
	    },
	{ :name => "VICTORIA HOSPITAL - BLACKPOOL"
	    },
	{ :name => "VICTORIA HOSPITAL - FIFE"
	    },
	{ :name => "WALSALL MANOR HOSPITAL"
	    },
	{ :name => "WALSGRAVE HOSPITAL"
	    },
	{ :name => "WARRINGTON HOSPITAL"
	    },
	{ :name => "WARWICK HOSPITAL"
	    },
	{ :name => "WARWICK MEDICAL SCHOOL"
	    },
	{ :name => "WATERFORD REGIONAL HOSPITAL"
	    },
	{ :name => "WATFORD GENERAL HOSPITAL"
	    },
	{ :name => "WEST CUMBERLAND HOSPITAL"
	    },
	{ :name => "WEST DORSET GENERAL HOSPITAL"
	    },
	{ :name => "WEST LANE HOSPITAL"
	    },
	{ :name => "WEST MIDDLESEX UNIVERSITY HOSPITAL"
	    },
	{ :name => "WEST SUFFOLK HOSPITAL"
	    },
	{ :name => "WEST WALES GENERAL HOSPITAL"
	    },
	{ :name => "WESTERN GENERAL HOSPITAL"
	    },
	{ :name => "WESTERN ISLES HOSPITAL"
	    },
	{ :name => "WESTON GENERAL HOSPITAL"
	    },
	{ :name => "WESTWOOD HOSPITAL"
	    },
	{ :name => "WEXFORD GENERAL HOSPITAL"
	    },
	{ :name => "WEXHAM PARK HOSPITAL"
	    },
	{ :name => "WHELLEY HOSPITAL"
	    },
	{ :name => "WHIPPS CROSS HOSPITAL"
	    },
	{ :name => "WHISTON HOSPITAL"
	    },
	{ :name => "WHITTINGTON HOSPITAL"
	    },
	{ :name => "WILLIAM HARVEY HOSPITAL"
	    },
	{ :name => "WISHAW GENERAL HOSPITAL - LANARKSHIRE"
	    },
	{ :name => "WISHAW GENERAL HOSPITAL - LONDON"
	    },
	{ :name => "WITHINGTON HOSPITAL"
	    },
	{ :name => "WITHYBUSH GENERAL HOSPITAL"
	    },
	{ :name => "WORCESTER ROYAL INFIRMARY"
	    },
	{ :name => "WORDSLEY HOSPITAL"
	    },
	{ :name => "WORKINGTON COMMUNITY HOSPITAL"
	    },
	{ :name => "WORTHING HOSPITAL"
	    },
	{ :name => "WREXHAM MAELOR HOSPITAL"
	    },
	{ :name => "WYCOMBE GENERAL HOSPITAL"
	    },
	{ :name => "WYTHENSHAWE HOSPITAL"
	    },
	{ :name => "YEOVIL DISTRICT HOSPITAL"
	    },
	{ :name => "YORK DISTRICT HOSPITAL"
	    },
	{ :name => "YSTRADD MYNACH HOSPITAL"
	    }
    ])
end
