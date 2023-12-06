CREATE (african_great_lakes:Trade_node {name:"african_great_lakes"})
CREATE (kongo:Trade_node {name:"kongo"})
CREATE (zambezi:Trade_node {name:"zambezi"})
CREATE (patagonia:Trade_node {name:"patagonia"})
CREATE (amazonas_node:Trade_node {name:"amazonas_node"})
CREATE (rio_grande:Trade_node {name:"rio_grande"})
CREATE (james_bay:Trade_node {name:"james_bay"})
CREATE (california:Trade_node {name:"california"})
CREATE (girin:Trade_node {name:"girin"})
CREATE (mississippi_river:Trade_node {name:"mississippi_river"})
CREATE (ohio:Trade_node {name:"ohio"})
CREATE (mexico:Trade_node {name:"mexico"})
CREATE (lhasa:Trade_node {name:"lhasa"})
CREATE (chengdu:Trade_node {name:"chengdu"})
CREATE (burma:Trade_node {name:"burma"})
CREATE (gulf_of_siam:Trade_node {name:"gulf_of_siam"})
CREATE (canton:Trade_node {name:"canton"})
CREATE (philippines:Trade_node {name:"philippines"})
CREATE (cuiaba:Trade_node {name:"cuiaba"})
CREATE (lima:Trade_node {name:"lima"})
CREATE (polynesia_node:Trade_node {name:"polynesia_node"})
CREATE (australia:Trade_node {name:"australia"})
CREATE (nippon:Trade_node {name:"nippon"})
CREATE (hangzhou:Trade_node {name:"hangzhou"})
CREATE (xian:Trade_node {name:"xian"})
CREATE (beijing:Trade_node {name:"beijing"})
CREATE (the_moluccas:Trade_node {name:"the_moluccas"})
CREATE (siberia:Trade_node {name:"siberia"})
CREATE (yumen:Trade_node {name:"yumen"})
CREATE (malacca:Trade_node {name:"malacca"})
CREATE (ganges_delta:Trade_node {name:"ganges_delta"})
CREATE (doab:Trade_node {name:"doab"})
CREATE (lahore:Trade_node {name:"lahore"})
CREATE (deccan:Trade_node {name:"deccan"})
CREATE (comorin_cape:Trade_node {name:"comorin_cape"})
CREATE (gujarat:Trade_node {name:"gujarat"})
CREATE (katsina:Trade_node {name:"katsina"})
CREATE (ethiopia:Trade_node {name:"ethiopia"})
CREATE (gulf_of_aden:Trade_node {name:"gulf_of_aden"})
CREATE (hormuz:Trade_node {name:"hormuz"})
CREATE (zanzibar:Trade_node {name:"zanzibar"})
CREATE (cape_of_good_hope:Trade_node {name:"cape_of_good_hope"})
CREATE (basra:Trade_node {name:"basra"})
CREATE (samarkand:Trade_node {name:"samarkand"})
CREATE (persia:Trade_node {name:"persia"})
CREATE (aleppo:Trade_node {name:"aleppo"})
CREATE (alexandria:Trade_node {name:"alexandria"})
CREATE (astrakhan:Trade_node {name:"astrakhan"})
CREATE (crimea:Trade_node {name:"crimea"})
CREATE (constantinople:Trade_node {name:"constantinople"})
CREATE (kiev:Trade_node {name:"kiev"})
CREATE (kazan:Trade_node {name:"kazan"})
CREATE (novgorod:Trade_node {name:"novgorod"})
CREATE (laplata:Trade_node {name:"laplata"})
CREATE (brazil:Trade_node {name:"brazil"})
CREATE (timbuktu:Trade_node {name:"timbuktu"})
CREATE (ivory_coast:Trade_node {name:"ivory_coast"})
CREATE (tunis:Trade_node {name:"tunis"})
CREATE (ragusa:Trade_node {name:"ragusa"})
CREATE (safi:Trade_node {name:"safi"})
CREATE (pest:Trade_node {name:"pest"})
CREATE (krakow:Trade_node {name:"krakow"})
CREATE (wien:Trade_node {name:"wien"})
CREATE (saxony:Trade_node {name:"saxony"})
CREATE (baltic_sea:Trade_node {name:"baltic_sea"})
CREATE (rheinland:Trade_node {name:"rheinland"})
CREATE (panama:Trade_node {name:"panama"})
CREATE (carribean_trade:Trade_node {name:"carribean_trade"})
CREATE (chesapeake_bay:Trade_node {name:"chesapeake_bay"})
CREATE (st_lawrence:Trade_node {name:"st_lawrence"})
CREATE (white_sea:Trade_node {name:"white_sea"})
CREATE (north_sea:Trade_node {name:"north_sea"})
CREATE (lubeck:Trade_node {name:"lubeck"})
CREATE (bordeaux:Trade_node {name:"bordeaux"})
CREATE (sevilla:Trade_node {name:"sevilla"})
CREATE (champagne:Trade_node {name:"champagne"})
CREATE (valencia:Trade_node {name:"valencia"})
CREATE (genua:Trade_node {name:"genua"})
CREATE (venice:Trade_node {name:"venice"})
CREATE (english_channel:Trade_node {name:"english_channel"})
;
MATCH (african_great_lakes:Trade_node {name:"african_great_lakes"}), (zanzibar:Trade_node {name:"zanzibar"}) CREATE (african_great_lakes)-[r:UPSTREAM]->(zanzibar);
MATCH (african_great_lakes:Trade_node {name:"african_great_lakes"}), (kongo:Trade_node {name:"kongo"}) CREATE (african_great_lakes)-[r:UPSTREAM]->(kongo);
MATCH (kongo:Trade_node {name:"kongo"}), (ivory_coast:Trade_node {name:"ivory_coast"}) CREATE (kongo)-[r:UPSTREAM]->(ivory_coast);
MATCH (kongo:Trade_node {name:"kongo"}), (zambezi:Trade_node {name:"zambezi"}) CREATE (kongo)-[r:UPSTREAM]->(zambezi);
MATCH (zambezi:Trade_node {name:"zambezi"}), (zanzibar:Trade_node {name:"zanzibar"}) CREATE (zambezi)-[r:UPSTREAM]->(zanzibar);
MATCH (patagonia:Trade_node {name:"patagonia"}), (laplata:Trade_node {name:"laplata"}) CREATE (patagonia)-[r:UPSTREAM]->(laplata);
MATCH (patagonia:Trade_node {name:"patagonia"}), (cuiaba:Trade_node {name:"cuiaba"}) CREATE (patagonia)-[r:UPSTREAM]->(cuiaba);
MATCH (amazonas_node:Trade_node {name:"amazonas_node"}), (brazil:Trade_node {name:"brazil"}) CREATE (amazonas_node)-[r:UPSTREAM]->(brazil);
MATCH (amazonas_node:Trade_node {name:"amazonas_node"}), (carribean_trade:Trade_node {name:"carribean_trade"}) CREATE (amazonas_node)-[r:UPSTREAM]->(carribean_trade);
MATCH (amazonas_node:Trade_node {name:"amazonas_node"}), (cuiaba:Trade_node {name:"cuiaba"}) CREATE (amazonas_node)-[r:UPSTREAM]->(cuiaba);
MATCH (rio_grande:Trade_node {name:"rio_grande"}), (mississippi_river:Trade_node {name:"mississippi_river"}) CREATE (rio_grande)-[r:UPSTREAM]->(mississippi_river);
MATCH (rio_grande:Trade_node {name:"rio_grande"}), (mexico:Trade_node {name:"mexico"}) CREATE (rio_grande)-[r:UPSTREAM]->(mexico);
MATCH (rio_grande:Trade_node {name:"rio_grande"}), (california:Trade_node {name:"california"}) CREATE (rio_grande)-[r:UPSTREAM]->(california);
MATCH (james_bay:Trade_node {name:"james_bay"}), (st_lawrence:Trade_node {name:"st_lawrence"}) CREATE (james_bay)-[r:UPSTREAM]->(st_lawrence);
MATCH (james_bay:Trade_node {name:"james_bay"}), (california:Trade_node {name:"california"}) CREATE (james_bay)-[r:UPSTREAM]->(california);
MATCH (california:Trade_node {name:"california"}), (mexico:Trade_node {name:"mexico"}) CREATE (california)-[r:UPSTREAM]->(mexico);
MATCH (california:Trade_node {name:"california"}), (mississippi_river:Trade_node {name:"mississippi_river"}) CREATE (california)-[r:UPSTREAM]->(mississippi_river);
MATCH (california:Trade_node {name:"california"}), (girin:Trade_node {name:"girin"}) CREATE (california)-[r:UPSTREAM]->(girin);
MATCH (california:Trade_node {name:"california"}), (polynesia_node:Trade_node {name:"polynesia_node"}) CREATE (california)-[r:UPSTREAM]->(polynesia_node);
MATCH (girin:Trade_node {name:"girin"}), (siberia:Trade_node {name:"siberia"}) CREATE (girin)-[r:UPSTREAM]->(siberia);
MATCH (girin:Trade_node {name:"girin"}), (beijing:Trade_node {name:"beijing"}) CREATE (girin)-[r:UPSTREAM]->(beijing);
MATCH (girin:Trade_node {name:"girin"}), (nippon:Trade_node {name:"nippon"}) CREATE (girin)-[r:UPSTREAM]->(nippon);
MATCH (mississippi_river:Trade_node {name:"mississippi_river"}), (carribean_trade:Trade_node {name:"carribean_trade"}) CREATE (mississippi_river)-[r:UPSTREAM]->(carribean_trade);
MATCH (mississippi_river:Trade_node {name:"mississippi_river"}), (ohio:Trade_node {name:"ohio"}) CREATE (mississippi_river)-[r:UPSTREAM]->(ohio);
MATCH (ohio:Trade_node {name:"ohio"}), (chesapeake_bay:Trade_node {name:"chesapeake_bay"}) CREATE (ohio)-[r:UPSTREAM]->(chesapeake_bay);
MATCH (ohio:Trade_node {name:"ohio"}), (st_lawrence:Trade_node {name:"st_lawrence"}) CREATE (ohio)-[r:UPSTREAM]->(st_lawrence);
MATCH (mexico:Trade_node {name:"mexico"}), (carribean_trade:Trade_node {name:"carribean_trade"}) CREATE (mexico)-[r:UPSTREAM]->(carribean_trade);
MATCH (mexico:Trade_node {name:"mexico"}), (panama:Trade_node {name:"panama"}) CREATE (mexico)-[r:UPSTREAM]->(panama);
MATCH (mexico:Trade_node {name:"mexico"}), (polynesia_node:Trade_node {name:"polynesia_node"}) CREATE (mexico)-[r:UPSTREAM]->(polynesia_node);
MATCH (lhasa:Trade_node {name:"lhasa"}), (lahore:Trade_node {name:"lahore"}) CREATE (lhasa)-[r:UPSTREAM]->(lahore);
MATCH (lhasa:Trade_node {name:"lhasa"}), (chengdu:Trade_node {name:"chengdu"}) CREATE (lhasa)-[r:UPSTREAM]->(chengdu);
MATCH (lhasa:Trade_node {name:"lhasa"}), (ganges_delta:Trade_node {name:"ganges_delta"}) CREATE (lhasa)-[r:UPSTREAM]->(ganges_delta);
MATCH (chengdu:Trade_node {name:"chengdu"}), (canton:Trade_node {name:"canton"}) CREATE (chengdu)-[r:UPSTREAM]->(canton);
MATCH (chengdu:Trade_node {name:"chengdu"}), (xian:Trade_node {name:"xian"}) CREATE (chengdu)-[r:UPSTREAM]->(xian);
MATCH (chengdu:Trade_node {name:"chengdu"}), (burma:Trade_node {name:"burma"}) CREATE (chengdu)-[r:UPSTREAM]->(burma);
MATCH (burma:Trade_node {name:"burma"}), (ganges_delta:Trade_node {name:"ganges_delta"}) CREATE (burma)-[r:UPSTREAM]->(ganges_delta);
MATCH (burma:Trade_node {name:"burma"}), (gulf_of_siam:Trade_node {name:"gulf_of_siam"}) CREATE (burma)-[r:UPSTREAM]->(gulf_of_siam);
MATCH (gulf_of_siam:Trade_node {name:"gulf_of_siam"}), (malacca:Trade_node {name:"malacca"}) CREATE (gulf_of_siam)-[r:UPSTREAM]->(malacca);
MATCH (gulf_of_siam:Trade_node {name:"gulf_of_siam"}), (canton:Trade_node {name:"canton"}) CREATE (gulf_of_siam)-[r:UPSTREAM]->(canton);
MATCH (canton:Trade_node {name:"canton"}), (malacca:Trade_node {name:"malacca"}) CREATE (canton)-[r:UPSTREAM]->(malacca);
MATCH (canton:Trade_node {name:"canton"}), (hangzhou:Trade_node {name:"hangzhou"}) CREATE (canton)-[r:UPSTREAM]->(hangzhou);
MATCH (canton:Trade_node {name:"canton"}), (philippines:Trade_node {name:"philippines"}) CREATE (canton)-[r:UPSTREAM]->(philippines);
MATCH (philippines:Trade_node {name:"philippines"}), (the_moluccas:Trade_node {name:"the_moluccas"}) CREATE (philippines)-[r:UPSTREAM]->(the_moluccas);
MATCH (philippines:Trade_node {name:"philippines"}), (polynesia_node:Trade_node {name:"polynesia_node"}) CREATE (philippines)-[r:UPSTREAM]->(polynesia_node);
MATCH (cuiaba:Trade_node {name:"cuiaba"}), (laplata:Trade_node {name:"laplata"}) CREATE (cuiaba)-[r:UPSTREAM]->(laplata);
MATCH (cuiaba:Trade_node {name:"cuiaba"}), (lima:Trade_node {name:"lima"}) CREATE (cuiaba)-[r:UPSTREAM]->(lima);
MATCH (cuiaba:Trade_node {name:"cuiaba"}), (brazil:Trade_node {name:"brazil"}) CREATE (cuiaba)-[r:UPSTREAM]->(brazil);
MATCH (lima:Trade_node {name:"lima"}), (panama:Trade_node {name:"panama"}) CREATE (lima)-[r:UPSTREAM]->(panama);
MATCH (lima:Trade_node {name:"lima"}), (polynesia_node:Trade_node {name:"polynesia_node"}) CREATE (lima)-[r:UPSTREAM]->(polynesia_node);
MATCH (polynesia_node:Trade_node {name:"polynesia_node"}), (nippon:Trade_node {name:"nippon"}) CREATE (polynesia_node)-[r:UPSTREAM]->(nippon);
MATCH (polynesia_node:Trade_node {name:"polynesia_node"}), (australia:Trade_node {name:"australia"}) CREATE (polynesia_node)-[r:UPSTREAM]->(australia);
MATCH (polynesia_node:Trade_node {name:"polynesia_node"}), (panama:Trade_node {name:"panama"}) CREATE (polynesia_node)-[r:UPSTREAM]->(panama);
MATCH (australia:Trade_node {name:"australia"}), (the_moluccas:Trade_node {name:"the_moluccas"}) CREATE (australia)-[r:UPSTREAM]->(the_moluccas);
MATCH (nippon:Trade_node {name:"nippon"}), (hangzhou:Trade_node {name:"hangzhou"}) CREATE (nippon)-[r:UPSTREAM]->(hangzhou);
MATCH (hangzhou:Trade_node {name:"hangzhou"}), (xian:Trade_node {name:"xian"}) CREATE (hangzhou)-[r:UPSTREAM]->(xian);
MATCH (hangzhou:Trade_node {name:"hangzhou"}), (beijing:Trade_node {name:"beijing"}) CREATE (hangzhou)-[r:UPSTREAM]->(beijing);
MATCH (hangzhou:Trade_node {name:"hangzhou"}), (malacca:Trade_node {name:"malacca"}) CREATE (hangzhou)-[r:UPSTREAM]->(malacca);
MATCH (xian:Trade_node {name:"xian"}), (beijing:Trade_node {name:"beijing"}) CREATE (xian)-[r:UPSTREAM]->(beijing);
MATCH (xian:Trade_node {name:"xian"}), (yumen:Trade_node {name:"yumen"}) CREATE (xian)-[r:UPSTREAM]->(yumen);
MATCH (beijing:Trade_node {name:"beijing"}), (yumen:Trade_node {name:"yumen"}) CREATE (beijing)-[r:UPSTREAM]->(yumen);
MATCH (the_moluccas:Trade_node {name:"the_moluccas"}), (malacca:Trade_node {name:"malacca"}) CREATE (the_moluccas)-[r:UPSTREAM]->(malacca);
MATCH (siberia:Trade_node {name:"siberia"}), (kazan:Trade_node {name:"kazan"}) CREATE (siberia)-[r:UPSTREAM]->(kazan);
MATCH (siberia:Trade_node {name:"siberia"}), (samarkand:Trade_node {name:"samarkand"}) CREATE (siberia)-[r:UPSTREAM]->(samarkand);
MATCH (yumen:Trade_node {name:"yumen"}), (samarkand:Trade_node {name:"samarkand"}) CREATE (yumen)-[r:UPSTREAM]->(samarkand);
MATCH (malacca:Trade_node {name:"malacca"}), (ganges_delta:Trade_node {name:"ganges_delta"}) CREATE (malacca)-[r:UPSTREAM]->(ganges_delta);
MATCH (malacca:Trade_node {name:"malacca"}), (cape_of_good_hope:Trade_node {name:"cape_of_good_hope"}) CREATE (malacca)-[r:UPSTREAM]->(cape_of_good_hope);
MATCH (ganges_delta:Trade_node {name:"ganges_delta"}), (comorin_cape:Trade_node {name:"comorin_cape"}) CREATE (ganges_delta)-[r:UPSTREAM]->(comorin_cape);
MATCH (ganges_delta:Trade_node {name:"ganges_delta"}), (doab:Trade_node {name:"doab"}) CREATE (ganges_delta)-[r:UPSTREAM]->(doab);
MATCH (doab:Trade_node {name:"doab"}), (deccan:Trade_node {name:"deccan"}) CREATE (doab)-[r:UPSTREAM]->(deccan);
MATCH (doab:Trade_node {name:"doab"}), (lahore:Trade_node {name:"lahore"}) CREATE (doab)-[r:UPSTREAM]->(lahore);
MATCH (lahore:Trade_node {name:"lahore"}), (samarkand:Trade_node {name:"samarkand"}) CREATE (lahore)-[r:UPSTREAM]->(samarkand);
MATCH (lahore:Trade_node {name:"lahore"}), (persia:Trade_node {name:"persia"}) CREATE (lahore)-[r:UPSTREAM]->(persia);
MATCH (lahore:Trade_node {name:"lahore"}), (gujarat:Trade_node {name:"gujarat"}) CREATE (lahore)-[r:UPSTREAM]->(gujarat);
MATCH (deccan:Trade_node {name:"deccan"}), (gujarat:Trade_node {name:"gujarat"}) CREATE (deccan)-[r:UPSTREAM]->(gujarat);
MATCH (deccan:Trade_node {name:"deccan"}), (comorin_cape:Trade_node {name:"comorin_cape"}) CREATE (deccan)-[r:UPSTREAM]->(comorin_cape);
MATCH (comorin_cape:Trade_node {name:"comorin_cape"}), (gulf_of_aden:Trade_node {name:"gulf_of_aden"}) CREATE (comorin_cape)-[r:UPSTREAM]->(gulf_of_aden);
MATCH (comorin_cape:Trade_node {name:"comorin_cape"}), (gujarat:Trade_node {name:"gujarat"}) CREATE (comorin_cape)-[r:UPSTREAM]->(gujarat);
MATCH (comorin_cape:Trade_node {name:"comorin_cape"}), (cape_of_good_hope:Trade_node {name:"cape_of_good_hope"}) CREATE (comorin_cape)-[r:UPSTREAM]->(cape_of_good_hope);
MATCH (gujarat:Trade_node {name:"gujarat"}), (gulf_of_aden:Trade_node {name:"gulf_of_aden"}) CREATE (gujarat)-[r:UPSTREAM]->(gulf_of_aden);
MATCH (gujarat:Trade_node {name:"gujarat"}), (hormuz:Trade_node {name:"hormuz"}) CREATE (gujarat)-[r:UPSTREAM]->(hormuz);
MATCH (gujarat:Trade_node {name:"gujarat"}), (zanzibar:Trade_node {name:"zanzibar"}) CREATE (gujarat)-[r:UPSTREAM]->(zanzibar);
MATCH (katsina:Trade_node {name:"katsina"}), (timbuktu:Trade_node {name:"timbuktu"}) CREATE (katsina)-[r:UPSTREAM]->(timbuktu);
MATCH (katsina:Trade_node {name:"katsina"}), (tunis:Trade_node {name:"tunis"}) CREATE (katsina)-[r:UPSTREAM]->(tunis);
MATCH (katsina:Trade_node {name:"katsina"}), (ethiopia:Trade_node {name:"ethiopia"}) CREATE (katsina)-[r:UPSTREAM]->(ethiopia);
MATCH (ethiopia:Trade_node {name:"ethiopia"}), (alexandria:Trade_node {name:"alexandria"}) CREATE (ethiopia)-[r:UPSTREAM]->(alexandria);
MATCH (ethiopia:Trade_node {name:"ethiopia"}), (gulf_of_aden:Trade_node {name:"gulf_of_aden"}) CREATE (ethiopia)-[r:UPSTREAM]->(gulf_of_aden);
MATCH (gulf_of_aden:Trade_node {name:"gulf_of_aden"}), (zanzibar:Trade_node {name:"zanzibar"}) CREATE (gulf_of_aden)-[r:UPSTREAM]->(zanzibar);
MATCH (gulf_of_aden:Trade_node {name:"gulf_of_aden"}), (alexandria:Trade_node {name:"alexandria"}) CREATE (gulf_of_aden)-[r:UPSTREAM]->(alexandria);
MATCH (gulf_of_aden:Trade_node {name:"gulf_of_aden"}), (hormuz:Trade_node {name:"hormuz"}) CREATE (gulf_of_aden)-[r:UPSTREAM]->(hormuz);
MATCH (hormuz:Trade_node {name:"hormuz"}), (basra:Trade_node {name:"basra"}) CREATE (hormuz)-[r:UPSTREAM]->(basra);
MATCH (zanzibar:Trade_node {name:"zanzibar"}), (cape_of_good_hope:Trade_node {name:"cape_of_good_hope"}) CREATE (zanzibar)-[r:UPSTREAM]->(cape_of_good_hope);
MATCH (cape_of_good_hope:Trade_node {name:"cape_of_good_hope"}), (ivory_coast:Trade_node {name:"ivory_coast"}) CREATE (cape_of_good_hope)-[r:UPSTREAM]->(ivory_coast);
MATCH (basra:Trade_node {name:"basra"}), (aleppo:Trade_node {name:"aleppo"}) CREATE (basra)-[r:UPSTREAM]->(aleppo);
MATCH (basra:Trade_node {name:"basra"}), (persia:Trade_node {name:"persia"}) CREATE (basra)-[r:UPSTREAM]->(persia);
MATCH (samarkand:Trade_node {name:"samarkand"}), (persia:Trade_node {name:"persia"}) CREATE (samarkand)-[r:UPSTREAM]->(persia);
MATCH (samarkand:Trade_node {name:"samarkand"}), (astrakhan:Trade_node {name:"astrakhan"}) CREATE (samarkand)-[r:UPSTREAM]->(astrakhan);
MATCH (persia:Trade_node {name:"persia"}), (aleppo:Trade_node {name:"aleppo"}) CREATE (persia)-[r:UPSTREAM]->(aleppo);
MATCH (persia:Trade_node {name:"persia"}), (astrakhan:Trade_node {name:"astrakhan"}) CREATE (persia)-[r:UPSTREAM]->(astrakhan);
MATCH (aleppo:Trade_node {name:"aleppo"}), (constantinople:Trade_node {name:"constantinople"}) CREATE (aleppo)-[r:UPSTREAM]->(constantinople);
MATCH (aleppo:Trade_node {name:"aleppo"}), (alexandria:Trade_node {name:"alexandria"}) CREATE (aleppo)-[r:UPSTREAM]->(alexandria);
MATCH (alexandria:Trade_node {name:"alexandria"}), (constantinople:Trade_node {name:"constantinople"}) CREATE (alexandria)-[r:UPSTREAM]->(constantinople);
MATCH (alexandria:Trade_node {name:"alexandria"}), (venice:Trade_node {name:"venice"}) CREATE (alexandria)-[r:UPSTREAM]->(venice);
MATCH (alexandria:Trade_node {name:"alexandria"}), (genua:Trade_node {name:"genua"}) CREATE (alexandria)-[r:UPSTREAM]->(genua);
MATCH (astrakhan:Trade_node {name:"astrakhan"}), (kazan:Trade_node {name:"kazan"}) CREATE (astrakhan)-[r:UPSTREAM]->(kazan);
MATCH (astrakhan:Trade_node {name:"astrakhan"}), (crimea:Trade_node {name:"crimea"}) CREATE (astrakhan)-[r:UPSTREAM]->(crimea);
MATCH (crimea:Trade_node {name:"crimea"}), (kiev:Trade_node {name:"kiev"}) CREATE (crimea)-[r:UPSTREAM]->(kiev);
MATCH (crimea:Trade_node {name:"crimea"}), (constantinople:Trade_node {name:"constantinople"}) CREATE (crimea)-[r:UPSTREAM]->(constantinople);
MATCH (crimea:Trade_node {name:"crimea"}), (pest:Trade_node {name:"pest"}) CREATE (crimea)-[r:UPSTREAM]->(pest);
MATCH (constantinople:Trade_node {name:"constantinople"}), (ragusa:Trade_node {name:"ragusa"}) CREATE (constantinople)-[r:UPSTREAM]->(ragusa);
MATCH (kiev:Trade_node {name:"kiev"}), (novgorod:Trade_node {name:"novgorod"}) CREATE (kiev)-[r:UPSTREAM]->(novgorod);
MATCH (kiev:Trade_node {name:"kiev"}), (krakow:Trade_node {name:"krakow"}) CREATE (kiev)-[r:UPSTREAM]->(krakow);
MATCH (kazan:Trade_node {name:"kazan"}), (novgorod:Trade_node {name:"novgorod"}) CREATE (kazan)-[r:UPSTREAM]->(novgorod);
MATCH (novgorod:Trade_node {name:"novgorod"}), (baltic_sea:Trade_node {name:"baltic_sea"}) CREATE (novgorod)-[r:UPSTREAM]->(baltic_sea);
MATCH (novgorod:Trade_node {name:"novgorod"}), (white_sea:Trade_node {name:"white_sea"}) CREATE (novgorod)-[r:UPSTREAM]->(white_sea);
MATCH (laplata:Trade_node {name:"laplata"}), (brazil:Trade_node {name:"brazil"}) CREATE (laplata)-[r:UPSTREAM]->(brazil);
MATCH (brazil:Trade_node {name:"brazil"}), (ivory_coast:Trade_node {name:"ivory_coast"}) CREATE (brazil)-[r:UPSTREAM]->(ivory_coast);
MATCH (timbuktu:Trade_node {name:"timbuktu"}), (safi:Trade_node {name:"safi"}) CREATE (timbuktu)-[r:UPSTREAM]->(safi);
MATCH (timbuktu:Trade_node {name:"timbuktu"}), (ivory_coast:Trade_node {name:"ivory_coast"}) CREATE (timbuktu)-[r:UPSTREAM]->(ivory_coast);
MATCH (ivory_coast:Trade_node {name:"ivory_coast"}), (carribean_trade:Trade_node {name:"carribean_trade"}) CREATE (ivory_coast)-[r:UPSTREAM]->(carribean_trade);
MATCH (ivory_coast:Trade_node {name:"ivory_coast"}), (bordeaux:Trade_node {name:"bordeaux"}) CREATE (ivory_coast)-[r:UPSTREAM]->(bordeaux);
MATCH (ivory_coast:Trade_node {name:"ivory_coast"}), (english_channel:Trade_node {name:"english_channel"}) CREATE (ivory_coast)-[r:UPSTREAM]->(english_channel);
MATCH (ivory_coast:Trade_node {name:"ivory_coast"}), (sevilla:Trade_node {name:"sevilla"}) CREATE (ivory_coast)-[r:UPSTREAM]->(sevilla);
MATCH (tunis:Trade_node {name:"tunis"}), (sevilla:Trade_node {name:"sevilla"}) CREATE (tunis)-[r:UPSTREAM]->(sevilla);
MATCH (tunis:Trade_node {name:"tunis"}), (valencia:Trade_node {name:"valencia"}) CREATE (tunis)-[r:UPSTREAM]->(valencia);
MATCH (tunis:Trade_node {name:"tunis"}), (genua:Trade_node {name:"genua"}) CREATE (tunis)-[r:UPSTREAM]->(genua);
MATCH (ragusa:Trade_node {name:"ragusa"}), (pest:Trade_node {name:"pest"}) CREATE (ragusa)-[r:UPSTREAM]->(pest);
MATCH (ragusa:Trade_node {name:"ragusa"}), (venice:Trade_node {name:"venice"}) CREATE (ragusa)-[r:UPSTREAM]->(venice);
MATCH (ragusa:Trade_node {name:"ragusa"}), (genua:Trade_node {name:"genua"}) CREATE (ragusa)-[r:UPSTREAM]->(genua);
MATCH (safi:Trade_node {name:"safi"}), (sevilla:Trade_node {name:"sevilla"}) CREATE (safi)-[r:UPSTREAM]->(sevilla);
MATCH (pest:Trade_node {name:"pest"}), (wien:Trade_node {name:"wien"}) CREATE (pest)-[r:UPSTREAM]->(wien);
MATCH (pest:Trade_node {name:"pest"}), (krakow:Trade_node {name:"krakow"}) CREATE (pest)-[r:UPSTREAM]->(krakow);
MATCH (krakow:Trade_node {name:"krakow"}), (wien:Trade_node {name:"wien"}) CREATE (krakow)-[r:UPSTREAM]->(wien);
MATCH (krakow:Trade_node {name:"krakow"}), (saxony:Trade_node {name:"saxony"}) CREATE (krakow)-[r:UPSTREAM]->(saxony);
MATCH (krakow:Trade_node {name:"krakow"}), (baltic_sea:Trade_node {name:"baltic_sea"}) CREATE (krakow)-[r:UPSTREAM]->(baltic_sea);
MATCH (wien:Trade_node {name:"wien"}), (venice:Trade_node {name:"venice"}) CREATE (wien)-[r:UPSTREAM]->(venice);
MATCH (wien:Trade_node {name:"wien"}), (rheinland:Trade_node {name:"rheinland"}) CREATE (wien)-[r:UPSTREAM]->(rheinland);
MATCH (wien:Trade_node {name:"wien"}), (saxony:Trade_node {name:"saxony"}) CREATE (wien)-[r:UPSTREAM]->(saxony);
MATCH (saxony:Trade_node {name:"saxony"}), (rheinland:Trade_node {name:"rheinland"}) CREATE (saxony)-[r:UPSTREAM]->(rheinland);
MATCH (saxony:Trade_node {name:"saxony"}), (lubeck:Trade_node {name:"lubeck"}) CREATE (saxony)-[r:UPSTREAM]->(lubeck);
MATCH (baltic_sea:Trade_node {name:"baltic_sea"}), (lubeck:Trade_node {name:"lubeck"}) CREATE (baltic_sea)-[r:UPSTREAM]->(lubeck);
MATCH (rheinland:Trade_node {name:"rheinland"}), (champagne:Trade_node {name:"champagne"}) CREATE (rheinland)-[r:UPSTREAM]->(champagne);
MATCH (rheinland:Trade_node {name:"rheinland"}), (lubeck:Trade_node {name:"lubeck"}) CREATE (rheinland)-[r:UPSTREAM]->(lubeck);
MATCH (panama:Trade_node {name:"panama"}), (carribean_trade:Trade_node {name:"carribean_trade"}) CREATE (panama)-[r:UPSTREAM]->(carribean_trade);
MATCH (carribean_trade:Trade_node {name:"carribean_trade"}), (chesapeake_bay:Trade_node {name:"chesapeake_bay"}) CREATE (carribean_trade)-[r:UPSTREAM]->(chesapeake_bay);
MATCH (carribean_trade:Trade_node {name:"carribean_trade"}), (bordeaux:Trade_node {name:"bordeaux"}) CREATE (carribean_trade)-[r:UPSTREAM]->(bordeaux);
MATCH (carribean_trade:Trade_node {name:"carribean_trade"}), (sevilla:Trade_node {name:"sevilla"}) CREATE (carribean_trade)-[r:UPSTREAM]->(sevilla);
MATCH (chesapeake_bay:Trade_node {name:"chesapeake_bay"}), (st_lawrence:Trade_node {name:"st_lawrence"}) CREATE (chesapeake_bay)-[r:UPSTREAM]->(st_lawrence);
MATCH (chesapeake_bay:Trade_node {name:"chesapeake_bay"}), (english_channel:Trade_node {name:"english_channel"}) CREATE (chesapeake_bay)-[r:UPSTREAM]->(english_channel);
MATCH (st_lawrence:Trade_node {name:"st_lawrence"}), (north_sea:Trade_node {name:"north_sea"}) CREATE (st_lawrence)-[r:UPSTREAM]->(north_sea);
MATCH (st_lawrence:Trade_node {name:"st_lawrence"}), (bordeaux:Trade_node {name:"bordeaux"}) CREATE (st_lawrence)-[r:UPSTREAM]->(bordeaux);
MATCH (white_sea:Trade_node {name:"white_sea"}), (north_sea:Trade_node {name:"north_sea"}) CREATE (white_sea)-[r:UPSTREAM]->(north_sea);
MATCH (north_sea:Trade_node {name:"north_sea"}), (english_channel:Trade_node {name:"english_channel"}) CREATE (north_sea)-[r:UPSTREAM]->(english_channel);
MATCH (north_sea:Trade_node {name:"north_sea"}), (lubeck:Trade_node {name:"lubeck"}) CREATE (north_sea)-[r:UPSTREAM]->(lubeck);
MATCH (lubeck:Trade_node {name:"lubeck"}), (english_channel:Trade_node {name:"english_channel"}) CREATE (lubeck)-[r:UPSTREAM]->(english_channel);
MATCH (bordeaux:Trade_node {name:"bordeaux"}), (champagne:Trade_node {name:"champagne"}) CREATE (bordeaux)-[r:UPSTREAM]->(champagne);
MATCH (sevilla:Trade_node {name:"sevilla"}), (valencia:Trade_node {name:"valencia"}) CREATE (sevilla)-[r:UPSTREAM]->(valencia);
MATCH (champagne:Trade_node {name:"champagne"}), (genua:Trade_node {name:"genua"}) CREATE (champagne)-[r:UPSTREAM]->(genua);
MATCH (champagne:Trade_node {name:"champagne"}), (english_channel:Trade_node {name:"english_channel"}) CREATE (champagne)-[r:UPSTREAM]->(english_channel);
MATCH (valencia:Trade_node {name:"valencia"}), (genua:Trade_node {name:"genua"}) CREATE (valencia)-[r:UPSTREAM]->(genua);
