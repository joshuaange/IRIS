% This script is automatically constructed by trajectory.m 

% No parachute... 
x_i(t) = (17.2022*Q(6371073.906))/g(6371073.906) * (1-exp((-g(6371073.906)*t)/Q(6371073.906))) +1181.2912;
y_i(t) = (-1.399e-07*Q(6371073.906))/g(6371073.906) * (1-exp((-g(6371073.906)*t)/Q(6371073.906))) +1;
z_i(t) = piecewise((-1e-13<=t<1), (127.5634/9.8164) * ((1379.386)+127.5634) * (1-exp((-9.8164*(t--1e-13))/127.5634)) - (127.5634*(t--1e-13)) +6371076.785, (1<=t<2), (127.5369/9.8124) * ((1267.7706309235212455412990779138)+127.5369) * (1-exp((-9.8124*(t-1))/127.5369)) - (127.5369*(t-1)) +6372399.6476471320698925772540085, (2<=t<3), (127.5126/9.8086) * ((1164.444926394984605766645767315)+127.5126) * (1-exp((-9.8086*(t-2))/127.5126)) - (127.5126*(t-2)) +6373615.0930226679620829797197061, (3<=t<4), (127.4903/9.8052) * ((1068.7900787449704207634673850763)+127.4903) * (1-exp((-9.8052*(t-3))/127.4903)) - (127.4903*(t-3)) +6374731.097415563020017437119325, (4<=t<5), (127.4698/9.802) * ((980.23396102378294795253169787077)+127.4698) * (1-exp((-9.802*(t-4))/127.4698)) - (127.4698*(t-4)) +6375755.0419251688649270864956811, (5<=t<6), (127.451/9.7992) * ((898.24750314516284321742187779712)+127.451) * (1-exp((-9.7992*(t-5))/127.451)) - (127.451*(t-5)) +6376693.757332884937162965080166, (6<=t<7), (127.4339/9.7965) * ((822.34139592147118404853202509752)+127.4339) * (1-exp((-9.7965*(t-6))/127.4339)) - (127.4339*(t-6)) +6377553.5654891942061282482393257, (7<=t<8), (127.4181/9.7941) * ((752.06305535640833104281834795322)+127.4181) * (1-exp((-9.7941*(t-7))/127.4181)) - (127.4181*(t-7)) +6378340.3175366399513817299588782, (8<=t<9), (127.4038/9.7919) * ((686.99382552055932842488681869164)+127.4038) * (1-exp((-9.7919*(t-8))/127.4038)) - (127.4038*(t-8)) +6379059.4292180085693912953411312, (9<=t<10), (127.3907/9.7899) * ((626.74640029581906839857500029805)+127.3907) * (1-exp((-9.7899*(t-9))/127.3907)) - (127.3907*(t-9)) +6379715.9134983040398770086665287, (10<=t<11), (127.3787/9.788) * ((570.96244603732575812071906972409)+127.3787) * (1-exp((-9.788*(t-10))/127.3787)) - (127.3787*(t-10)) +6380314.4107102803946277760557773, (11<=t<12), (127.3678/9.7864) * ((519.3104087885928284515354047133)+127.3678) * (1-exp((-9.7864*(t-11))/127.3678)) - (127.3678*(t-11)) +6380859.2164161526221796876151925, (12<=t<13), (127.358/9.7849) * ((471.48349111683991732950939533518)+127.358) * (1-exp((-9.7849*(t-12))/127.358)) - (127.358*(t-12)) +6381354.307162468455832190873963, (13<=t<14), (127.349/9.7835) * ((427.19778492834582149730294375861)+127.349) * (1-exp((-9.7835*(t-13))/127.349)) - (127.349*(t-13)) +6381803.3642908464614005043653283, (14<=t<15), (127.3409/9.7822) * ((386.19054779309140625783885689785)+127.3409) * (1-exp((-9.7822*(t-14))/127.3409)) - (127.3409*(t-14)) +6382209.7959542389630090140508868, (15<=t<16), (127.3336/9.7811) * ((348.21861136728339055717200467769)+127.3336) * (1-exp((-9.7811*(t-15))/127.3336)) - (127.3336*(t-15)) +6382576.7574764449841359168368208, (16<=t<17), (127.327/9.7801) * ((313.0569114632014771629736683947)+127.327) * (1-exp((-9.7801*(t-16))/127.327)) - (127.327*(t-16)) +6382907.1701816743392220784794738, (17<=t<18), (127.3211/9.7792) * ((280.49713018845298816081404962901)+127.3211) * (1-exp((-9.7792*(t-17))/127.3211)) - (127.3211*(t-17)) +6383203.7388109560341753811896722, (18<=t<19), (127.3158/9.7784) * ((250.34644137020697443588122998835)+127.3158) * (1-exp((-9.7784*(t-18))/127.3158)) - (127.3158*(t-18)) +6383468.9676330086156324777839509, (19<=t<20), (127.3111/9.7776) * ((222.42635120232152859323427716876)+127.3111) * (1-exp((-9.7776*(t-19))/127.3111)) - (127.3111*(t-19)) +6383705.1753487719650186261663244, (20<=t<21), (127.3069/9.777) * ((196.57162671156849141282830127614)+127.3069) * (1-exp((-9.777*(t-20))/127.3069)) - (127.3069*(t-20)) +6383914.5088810717236095001354668, (21<=t<22), (127.3032/9.7764) * ((172.62930523969667324475486697315)+127.3032) * (1-exp((-9.7764*(t-21))/127.3032)) - (127.3032*(t-21)) +6384098.956133788207542028430999, (22<=t<23), (127.3/9.7759) * ((150.45777868645890881361427586677)+127.3) * (1-exp((-9.7759*(t-22))/127.3)) - (127.3*(t-22)) +6384260.3577983764188548084211043, (23<=t<24), (127.2972/9.7755) * ((129.92594675994982806439540679928)+127.2972) * (1-exp((-9.7755*(t-23))/127.2972)) - (127.2972*(t-23)) +6384400.418279582962151206623484, (24<=t<25), (127.2948/9.7752) * ((110.91243393911414298379117115974)+127.2948) * (1-exp((-9.7752*(t-24))/127.2948)) - (127.2948*(t-24)) +6384520.7158066844358170683819757, (25<=t<26), (127.2928/9.7748) * ((93.304865273071968938585771908561)+127.2928) * (1-exp((-9.7748*(t-25))/127.2928)) - (127.2928*(t-25)) +6384622.7117914894955573349503356, (26<=t<27), (127.2911/9.7746) * ((76.999196526535146398245903986578)+127.2911) * (1-exp((-9.7746*(t-26))/127.2911)) - (127.2911*(t-26)) +6384707.7594896663712063389237905, (27<=t<28), (127.2897/9.7744) * ((61.899094533256789509958977108047)+127.2897) * (1-exp((-9.7744*(t-27))/127.2897)) - (127.2897*(t-27)) +6384777.1120176456206316517106499, (28<=t<29), (127.2886/9.7742) * ((47.915363943040978961646049305394)+127.2886) * (1-exp((-9.7742*(t-28))/127.2886)) - (127.2886*(t-28)) +6384831.9297733738275815362723475, (29<=t<30), (127.2878/9.7741) * ((34.96541684492874191940895252632)+127.2878) * (1-exp((-9.7741*(t-29))/127.2878)) - (127.2878*(t-29)) +6384873.287305530023521614094197, (30<=t<31), (127.2872/9.774) * ((22.97278202210309664741263091948)+127.2872) * (1-exp((-9.774*(t-30))/127.2872)) - (127.2872*(t-30)) +6384902.1796724375252891203521778, (31<=t<32), (127.2868/9.7739) * ((11.866650844925884090579842806074)+127.2868) * (1-exp((-9.7739*(t-31))/127.2868)) - (127.2868*(t-31)) +6384919.5283287865367500199622731, (32<=t<33), (127.2867/9.7739) * ((1.5814570392360601803699556286193)+127.2867) * (1-exp((-9.7739*(t-32))/127.2867)) - (127.2867*(t-32)) +6384926.1865754061727515928828594, (33<=t<34), (127.2868/9.7739) * ((-7.9435122206736692909865851227409)+127.2868) * (1-exp((-9.7739*(t-33))/127.2868)) - (127.2868*(t-33)) +6384922.9446046692487470822357146, (34<=t<35), (127.287/9.774) * ((-16.764476249565579933270235165625)+127.287) * (1-exp((-9.774*(t-34))/127.287)) - (127.287*(t-34)) +6384910.5341716616020917744161754, (35<=t<36), (127.2874/9.774) * ((-24.933493994445612425760445127164)+127.2874) * (1-exp((-9.774*(t-35))/127.2874)) - (127.2874*(t-35)) +6384889.6329189837223421075196125, (36<=t<37), (127.288/9.7741) * ((-32.498772392819783756438507138034)+127.288) * (1-exp((-9.7741*(t-36))/127.288)) - (127.288*(t-36)) +6384860.8683809612708497494162423, (37<=t<38), (127.2887/9.7742) * ((-39.504951802589985004986442882518)+127.2887) * (1-exp((-9.7742*(t-37))/127.2887)) - (127.2887*(t-37)) +6384824.8216911090963588853799981, (38<=t<39), (127.2896/9.7744) * ((-45.99337021926847087040788666467)+127.2896) * (1-exp((-9.7744*(t-38))/127.2896)) - (127.2896*(t-38)) +6384782.0310149081534981536479647, (39<=t<40), (127.2906/9.7745) * ((-52.002307866249143364888206092293)+127.2906) * (1-exp((-9.7745*(t-39))/127.2906)) - (127.2906*(t-39)) +6384732.9947283048743843883814724, (40<=t<41), (127.2917/9.7747) * ((-57.567213623996176094954010078397)+127.2917) * (1-exp((-9.7747*(t-40))/127.2917)) - (127.2917*(t-40)) +6384678.1743608175288238366534203, (41<=t<42), (127.2929/9.7749) * ((-62.720914653386013236326856052834)+127.2929) * (1-exp((-9.7749*(t-41))/127.2929)) - (127.2929*(t-41)) +6384617.9973207242830939695919299, (42<=t<43), (127.2942/9.7751) * ((-67.493810466326285870351731419875)+127.2942) * (1-exp((-9.7751*(t-42))/127.2942)) - (127.2942*(t-42)) +6384552.8594185041536046297232402, (43<=t<44), (127.2956/9.7753) * ((-71.914052602496733395252807499689)+127.2956) * (1-exp((-9.7753*(t-43))/127.2956)) - (127.2956*(t-43)) +6384483.1272034966815052490780569, (44<=t<45), (127.297/9.7755) * ((-76.007710983991998010494312870485)+127.297) * (1-exp((-9.7755*(t-44))/127.297)) - (127.297*(t-44)) +6384409.1401276314081391354137548, (45<=t<46), (127.2986/9.7757) * ((-79.798927939225308623582698781713)+127.2986) * (1-exp((-9.7757*(t-45))/127.2986)) - (127.2986*(t-45)) +6384331.2125490471842217934558265, (46<=t<47), (127.3002/9.776) * ((-83.310060813153940868669076986496)+127.3002) * (1-exp((-9.776*(t-46))/127.3002)) - (127.3002*(t-46)) +6384249.6355874676177333323953089, (47<=t<48), (127.3019/9.7762) * ((-86.561814012233269214817250313695)+127.3019) * (1-exp((-9.7762*(t-47))/127.3019)) - (127.3019*(t-47)) +6384164.6788423166766106491164879, (48<=t<49), (127.3037/9.7765) * ((-89.573361269056718727334602622548)+127.3037) * (1-exp((-9.7765*(t-48))/127.3037)) - (127.3037*(t-48)) +6384076.5919837421910527275595588, (49<=t<50), (127.3055/9.7768) * ((-92.362458852990205578126117543542)+127.3055) * (1-exp((-9.7768*(t-49))/127.3055)) - (127.3055*(t-49)) +6383985.6062259597466458743431785, (50<=t<51), (127.3073/9.7771) * ((-94.945550398890570210888858940567)+127.3073) * (1-exp((-9.7771*(t-50))/127.3073)) - (127.3073*(t-50)) +6383891.9356916306108462199524033, (51<=t<52), (127.3093/9.7774) * ((-97.337863975866702910162861454605)+127.3093) * (1-exp((-9.7774*(t-51))/127.3093)) - (127.3093*(t-51)) +6383795.7786753406349435474278784, (52<=t<53), (127.3112/9.7777) * ((-99.553501971685444930909792252233)+127.3112) * (1-exp((-9.7777*(t-52))/127.3112)) - (127.3112*(t-52)) +6383697.3188136485923276281412031, (53<=t<54), (127.3132/9.778) * ((-101.60552432555277658454264976864)+127.3132) * (1-exp((-9.778*(t-53))/127.3132)) - (127.3132*(t-53)) +6383596.7261686185239868435834316, (54<=t<55), (127.3153/9.7783) * ((-103.50602560234798961534709995822)+127.3153) * (1-exp((-9.7783*(t-54))/127.3153)) - (127.3153*(t-54)) +6383494.1582312380135488945486935, (55<=t<56), (127.3174/9.7786) * ((-105.26620636470914922666515101216)+127.3174) * (1-exp((-9.7786*(t-55))/127.3174)) - (127.3174*(t-55)) +6383389.7608506498123536831982769, (56<=t<57), (127.3195/9.7789) * ((-106.89643926543606477243270301209)+127.3195) * (1-exp((-9.7789*(t-56))/127.3195)) - (127.3195*(t-56)) +6383283.6690946850211537042418952, (57<=t<58), (127.3216/9.7793) * ((-108.40633025128373230028468825822)+127.3216) * (1-exp((-9.7793*(t-57))/127.3216)) - (127.3216*(t-57)) +6383176.0080467794673689644134454, (58<=t<59), (127.3238/9.7796) * ((-109.80477524017251453392381458993)+127.3238) * (1-exp((-9.7796*(t-58))/127.3238)) - (127.3238*(t-58)) +6383066.8935439785539478029210459, (59<=t<60), (127.326/9.7799) * ((-111.1000126069638022976862366939)+127.326) * (1-exp((-9.7799*(t-59))/127.326)) - (127.326*(t-59)) +6382956.4328603874410957359807482, (60<=t<61), (127.3282/9.7803) * ((-112.29967178807786454771858546441)+127.3282) * (1-exp((-9.7803*(t-60))/127.3282)) - (127.3282*(t-60)) +6382844.7253401008691706291073276, (61<=t<62), (127.3305/9.7806) * ((-113.41081829221294550261576166632)+127.3305) * (1-exp((-9.7806*(t-61))/127.3305)) - (127.3305*(t-61)) +6382731.8629833483109532066753706, (62<=t<63), (127.3327/9.781) * ((-114.43999538312190191365771036701)+127.3327) * (1-exp((-9.781*(t-62))/127.3327)) - (127.3327*(t-62)) +6382617.9309893136705600333268805, (63<=t<64), (127.335/9.7813) * ((-115.39326268068595946876178768335)+127.335) * (1-exp((-9.7813*(t-63))/127.335)) - (127.335*(t-63)) +6382503.0082588327748422414424614, (64<=t<65), (127.3374/9.7817) * ((-116.27623190827550432402244574704)+127.3374) * (1-exp((-9.7817*(t-64))/127.3374)) - (127.3374*(t-64)) +6382387.1678599349054291716430337, (65<=t<66), (127.3397/9.782) * ((-117.09409999749527305626680533538)+127.3397) * (1-exp((-9.782*(t-65))/127.3397)) - (127.3397*(t-65)) +6382270.4774589751842643254397823, (66<=t<67), (127.342/9.7824) * ((-117.85167974577427254775114626836)+127.342) * (1-exp((-9.7824*(t-66))/127.342)) - (127.342*(t-66)) +6382152.9997199014468843325263416, (67<=t<68), (127.3444/9.7828) * ((-118.55342820778536212614685647275)+127.3444) * (1-exp((-9.7828*(t-67))/127.3444)) - (127.3444*(t-67)) +6382034.792674011107841055572935, (68<=t<69), (127.3468/9.7831) * ((-119.20347298827887897196786232436)+127.3468) * (1-exp((-9.7831*(t-68))/127.3468)) - (127.3468*(t-68)) +6381915.9100623793238835297909167, (69<=t<70), (127.3491/9.7835) * ((-119.80563659150875406741428578063)+127.3491) * (1-exp((-9.7835*(t-69))/127.3491)) - (127.3491*(t-69)) +6381796.4016529784585858550416392, (70<=t<71), (127.3515/9.7839) * ((-120.36345897094406881117407151817)+127.3515) * (1-exp((-9.7839*(t-70))/127.3515)) - (127.3515*(t-70)) +6381676.3135343594899812733841814, (71<=t<72), (127.3539/9.7842) * ((-120.88021841232534544051552223661)+127.3539) * (1-exp((-9.7842*(t-71))/127.3539)) - (127.3539*(t-71)) +6381555.6883876276947456289785929, (72<=t<73), (127.3564/9.7846) * ((-121.35895087327960788558356999209)+127.3564) * (1-exp((-9.7846*(t-72))/127.3564)) - (127.3564*(t-72)) +6381434.5657383168688538747935792, (73<=t<74), (127.3588/9.785) * ((-121.80246789359271663660026916474)+127.3588) * (1-exp((-9.785*(t-73))/127.3588)) - (127.3588*(t-73)) +6381312.9821896477467273084942695, (74<=t<75), (127.3612/9.7854) * ((-122.21337318179739432760436225486)+127.3612) * (1-exp((-9.7854*(t-74))/127.3612)) - (127.3612*(t-74)) +6381190.9716385464564614252872596, (75<=t<76), (127.3637/9.7857) * ((-122.59407797592050583905104737053)+127.3637) * (1-exp((-9.7857*(t-75))/127.3637)) - (127.3637*(t-75)) +6381068.5654756971477576965593403, (76<=t<77), (127.3661/9.7861) * ((-122.94681526899708224711465473132)+127.3661) * (1-exp((-9.7861*(t-76))/127.3661)) - (127.3661*(t-76)) +6380945.7927708087499697874510795, (77<=t<78), (127.3686/9.7865) * ((-123.27365298325829849819935192676)+127.3686) * (1-exp((-9.7865*(t-77))/127.3686)) - (127.3686*(t-77)) +6380822.6804441886032052913923885, (78<=t<79), (127.371/9.7869) * ((-123.57650617069635654647374323499)+127.371) * (1-exp((-9.7869*(t-78))/127.371)) - (127.371*(t-78)) +6380699.2534256349400453735377639, (79<=t<80), (127.3735/9.7872) * ((-123.85714831196418262559853303521)+127.3735) * (1-exp((-9.7872*(t-79))/127.3735)) - (127.3735*(t-79)) +6380575.5348015854017749762541204, (80<=t<81), (127.376/9.7876) * ((-124.11722178024795701355793218413)+127.376) * (1-exp((-9.7876*(t-80))/127.376)) - (127.376*(t-80)) +6380451.5459513895090902162142991, (81<=t<82), (127.3785/9.788) * ((-124.35824753182423227198469952499)+127.3785) * (1-exp((-9.788*(t-81))/127.3785)) - (127.3785*(t-81)) +6380327.3066735088638792685354256, (82<=t<83), (127.3809/9.7884) * ((-124.58163408045158355673550593787)+127.3809) * (1-exp((-9.7884*(t-82))/127.3809)) - (127.3809*(t-82)) +6380202.8353023894570066203092259, (83<=t<84), (127.3834/9.7888) * ((-124.78868580852236506565556702726)+127.3834) * (1-exp((-9.7888*(t-83))/127.3834)) - (127.3834*(t-83)) +6380078.1488166954462948759050951, (84<=t<85), (127.3859/9.7892) * ((-124.98061066398822100614948148698)+127.3859) * (1-exp((-9.7892*(t-84))/127.3859)) - (127.3859*(t-84)) +6379953.2629395428243102497723497, (85<=t<86), (127.3884/9.7895) * ((-125.15852728845037644267893480187)+127.3884) * (1-exp((-9.7895*(t-85))/127.3884)) - (127.3884*(t-85)) +6379828.1922313242163925752143433, (86<=t<87), (127.3909/9.7899) * ((-125.32347161845099073712454095365)+127.3909) * (1-exp((-9.7899*(t-86))/127.3909)) - (127.3909*(t-86)) +6379702.9501756723571738605859137, (87<=t<88), (127.3934/9.7903) * ((-125.47640299889516223075593110067)+127.3934) * (1-exp((-9.7903*(t-87))/127.3934)) - (127.3934*(t-87)) +6379577.5492590693307637263789754, (88<=t<89), (127.3959/9.7907) * ((-125.61820984465616732611671801004)+127.3959) * (1-exp((-9.7907*(t-88))/127.3959)) - (127.3959*(t-88)) +6379452.0010445711870944933349135, (89<=t<90), (127.3985/9.7911) * ((-125.74971488375220222467398385226)+127.3985) * (1-exp((-9.7911*(t-89))/127.3985)) - (127.3985*(t-89)) +6379326.3162400828435325508023211, (90<=t<91), (127.401/9.7915) * ((-125.87168001301553380243719476959)+127.401) * (1-exp((-9.7915*(t-90))/127.401)) - (127.401*(t-90)) +6379200.5047615860420548355951636, (91<=t<92), (127.4035/9.7918) * ((-125.98481079488998666122472053217)+127.4035) * (1-exp((-9.7918*(t-91))/127.4035)) - (127.4035*(t-91)) +6379074.5757916933684853579802254, (92<=t<93), (127.406/9.7922) * ((-126.08976062187660531720856346041)+127.406) * (1-exp((-9.7922*(t-92))/127.406)) - (127.406*(t-92)) +6378948.5378338737759362403478593, (93<=t<94), (127.4085/9.7926) * ((-126.18713457318764234838694158406)+127.4085) * (1-exp((-9.7926*(t-93))/127.4085)) - (127.4085*(t-93)) +6378822.3987626695271349900184667, (94<=t<95), (127.411/9.793) * ((-126.27749298635416891825624270549)+127.411) * (1-exp((-9.793*(t-94))/127.411)) - (127.411*(t-94)) +6378696.1658702008292019000714941, (95<=t<96), (127.4136/9.7934) * ((-126.36135476485187371752928917023)+127.4136) * (1-exp((-9.7934*(t-95))/127.4136)) - (127.4136*(t-95)) +6378569.8459092325402582149003945, (96<=t<97), (127.4161/9.7938) * ((-126.43920044125309320552116792057)+127.4161) * (1-exp((-9.7938*(t-96))/127.4161)) - (127.4161*(t-96)) +6378443.4451330570508948439594442, (97<=t<98), (127.4186/9.7942) * ((-126.51147501397161731490614738949)+127.4186) * (1-exp((-9.7942*(t-97))/127.4186)) - (127.4186*(t-97)) +6378316.9693324286654558823706565, (98<=t<99), (127.4211/9.7946) * ((-126.57859057433183731442195944406)+127.4211) * (1-exp((-9.7946*(t-98))/127.4211)) - (127.4211*(t-98)) +6378190.4238697674175725557459033, (99<=t<100), (127.4237/9.795) * ((-126.64092873945747228789493214448)+127.4237) * (1-exp((-9.795*(t-99))/127.4237)) - (127.4237*(t-99)) +6378063.813710834148887579374964, (100<=t<101), (127.4262/9.7953) * ((-126.69884290533013619911908185944)+127.4262) * (1-exp((-9.7953*(t-100))/127.4262)) - (127.4262*(t-100)) +6377937.1434540637644824603940707, (101<=t<102), (127.4287/9.7957) * ((-126.75266033330763664038717569937)+127.4287) * (1-exp((-9.7957*(t-101))/127.4287)) - (127.4287*(t-101)) +6377810.4173577297652244823315072, (102<=t<103), (127.4313/9.7961) * ((-126.80268408240987636973650911431)+127.4313) * (1-exp((-9.7961*(t-102))/127.4313)) - (127.4313*(t-102)) +6377683.6393651003646487388163207, (103<=t<104), (127.4338/9.7965) * ((-126.84919479877076929030677945455)+127.4338) * (1-exp((-9.7965*(t-103))/127.4338)) - (127.4338*(t-103)) +6377556.8131277346506649501550393, (104<=t<105), (127.4363/9.7969) * ((-126.89245237281232143367219216599)+127.4363) * (1-exp((-9.7969*(t-104))/127.4363)) - (127.4363*(t-104)) +6377429.9420270562804837453775506, (105<=t<106), (127.4389/9.7973) * ((-126.9326974739169990537329297563)+127.4389) * (1-exp((-9.7973*(t-105))/127.4389)) - (127.4389*(t-105)) +6377303.0291943320360088812993964, (106<=t<107), (127.4414/9.7977) * ((-126.97015297165211150529191617486)+127.4414) * (1-exp((-9.7977*(t-106))/127.4414)) - (127.4414*(t-106)) +6377176.0775291731566365770967347, (107<=t<108), (127.4439/9.7981) * ((-127.00502525193091749981232942566)+127.4439) * (1-exp((-9.7981*(t-107))/127.4439)) - (127.4439*(t-107)) +6377049.0897166686514633137539393, (108<=t<109), (127.4465/9.7985) * ((-127.03750543587557571580049956387)+127.4465) * (1-exp((-9.7985*(t-108))/127.4465)) - (127.4465*(t-108)) +6376922.0682432517219508928785431, (109<=t<110), (127.449/9.7989) * ((-127.06777050857325220767309156702)+127.449) * (1-exp((-9.7989*(t-109))/127.449)) - (127.449*(t-109)) +6376795.0154113929515503492591717, (110<=t<111), (127.4516/9.7992) * ((-127.09598436438528515649152061465)+127.4516) * (1-exp((-9.7992*(t-110))/127.4516)) - (127.4516*(t-110)) +6376667.933353206996578236853617, (111<=t<112), (127.4541/9.7996) * ((-127.12229877497715976238943896638)+127.4541) * (1-exp((-9.7996*(t-111))/127.4541)) - (127.4541*(t-111)) +6376540.8240430531019594928579979, (112<=t<113), (127.4566/9.8) * ((-127.1468542857812615022198686325)+127.4566) * (1-exp((-9.8*(t-112))/127.4566)) - (127.4566*(t-112)) +6376413.6893092038285054158435608, (113<=t<114), (127.4592/9.8004) * ((-127.16978104618226794718056805398)+127.4592) * (1-exp((-9.8004*(t-113))/127.4592)) - (127.4592*(t-113)) +6376286.5308446508801805921727356, (114<=t<115), (127.4617/9.8008) * ((-127.19119957832411975489196567891)+127.4617) * (1-exp((-9.8008*(t-114))/127.4617)) - (127.4617*(t-114)) +6376159.3502171118279122804407338, (115<=t<116), (127.4643/9.8012) * ((-127.21122148907547606421885624113)+127.4643) * (1-exp((-9.8012*(t-115))/127.4643)) - (127.4643*(t-115)) +6376032.1488782968108882280786179, (116<=t<117), (127.4668/9.8016) * ((-127.22995012935527432948144295319)+127.4668) * (1-exp((-9.8016*(t-116))/127.4668)) - (127.4668*(t-116)) +6375904.9281724899291705973643986, (117<=t<118), (127.4694/9.802) * ((-127.2474812047095033045931356459)+127.4694) * (1-exp((-9.802*(t-117))/127.4694)) - (127.4694*(t-117)) +6375777.6893444959970752259133395, (118<=t<119), (127.4719/9.8024) * ((-127.26390334074273011541842392373)+127.4719) * (1-exp((-9.8024*(t-118))/127.4719)) - (127.4719*(t-118)) +6375650.433546999581279831968605, (119<=t<120), (127.4744/9.8028) * ((-127.27929860674160305468205811477)+127.4744) * (1-exp((-9.8028*(t-119))/127.4744)) - (127.4744*(t-119)) +6375523.1618473797789468242274225, (120<=t<121), (127.477/9.8032) * ((-127.29374300058091104547543802573)+127.477) * (1-exp((-9.8032*(t-120))/127.477)) - (127.477*(t-120)) +6375395.8752340209788225846575687, (121<=t<122), (127.4795/9.8035) * ((-127.3073068977743647730469901292)+127.4795) * (1-exp((-9.8035*(t-121))/127.4795)) - (127.4795*(t-121)) +6375268.5746221568733630775927882, (122<=t<123), (127.4821/9.8039) * ((-127.32005546732072681537178934874)+127.4821) * (1-exp((-9.8039*(t-122))/127.4821)) - (127.4821*(t-122)) +6375141.2608592822348924986972104, (123<=t<124), (127.4846/9.8043) * ((-127.332049056800011718935237919)+127.4846) * (1-exp((-9.8043*(t-123))/127.4846)) - (127.4846*(t-123)) +6375013.9347301644173806049468325, (124<=t<125), (127.4872/9.8047) * ((-127.34334354899304699834125265856)+127.4872) * (1-exp((-9.8047*(t-124))/127.4872)) - (127.4872*(t-124)) +6374886.5969614841825788948769766, (125<=t<126), (127.4897/9.8051) * ((-127.35399069212966293470011783642)+127.4897) * (1-exp((-9.8051*(t-125))/127.4897)) - (127.4897*(t-125)) +6374759.2482261332610511353059427, (126<=t<127), (127.4923/9.8055) * ((-127.36403840571517226977900185421)+127.4923) * (1-exp((-9.8055*(t-126))/127.4923)) - (127.4923*(t-126)) +6374631.8891471940321645950120293, (127<=t<128), (127.4948/9.8059) * ((-127.37353106374069307830510523429)+127.4948) * (1-exp((-9.8059*(t-127))/127.4948)) - (127.4948*(t-127)) +6374504.5203016248304229684261179, (128<=t<129), (127.4974/9.8063) * ((-127.38250975694940965746449276164)+127.4974) * (1-exp((-9.8063*(t-128))/127.4974)) - (127.4974*(t-128)) +6374377.1422236726475516182706432, (129<=t<130), (127.4999/9.8067) * ((-127.39101253570727037204857370016)+127.4999) * (1-exp((-9.8067*(t-129))/127.4999)) - (127.4999*(t-129)) +6374249.7554080333902395092473425, (130<=t<131), (127.5025/9.8071) * ((-127.3990746349121593344300900891)+127.5025) * (1-exp((-9.8071*(t-130))/127.5025)) - (127.5025*(t-130)) +6374122.3603127783629065127166754, (131<=t<132), (127.505/9.8075) * ((-127.40672868226957571222217597205)+127.505) * (1-exp((-9.8075*(t-131))/127.505)) - (127.505*(t-131)) +6373994.9573620642645075429296364, (132<=t<133), (127.5076/9.8079) * ((-127.41400489116468533102375187422)+127.5076) * (1-exp((-9.8079*(t-132))/127.5076)) - (127.5076*(t-132)) +6373867.5469486427100637683558839, (133<=t<134), (127.5101/9.8082) * ((-127.42093123926969523640006982661)+127.5101) * (1-exp((-9.8082*(t-133))/127.5101)) - (127.5101*(t-133)) +6373740.1294361841037850867640701, (134<=t<135), (127.5127/9.8086) * ((-127.42753363394130692204396053191)+127.5127) * (1-exp((-9.8086*(t-134))/127.5127)) - (127.5127*(t-134)) +6373612.7051614295943335037348245, (135<=t<136), (127.5152/9.809) * ((-127.43383606538503154743944963104)+127.5152) * (1-exp((-9.809*(t-135))/127.5152)) - (127.5152*(t-135)) +6373485.2744361838275063761167439, (136<=t<137), (127.5178/9.8094) * ((-127.439860748490940863998735651)+127.5178) * (1-exp((-9.8094*(t-136))/127.5178)) - (127.5178*(t-136)) +6373357.8375491602714019383552139, (137<=t<138), (127.5203/9.8098) * ((-127.44562825417855491803109913866)+127.5203) * (1-exp((-9.8098*(t-137))/127.5203)) - (127.5203*(t-137)) +6373230.3947676900184199771604202, (138<=t<139), (127.5229/9.8102) * ((-127.4511576310266375360135659968)+127.5229) * (1-exp((-9.8102*(t-138))/127.5229)) - (127.5229*(t-138)) +6373102.9463393041621107098002104, (139<=t<140), (127.5254/9.8106) * ((-127.45646651790631789207838944318)+127.5254) * (1-exp((-9.8106*(t-139))/127.5254)) - (127.5254*(t-139)) +6372975.4924931991001572164927112, (140<=t<141), (127.528/9.811) * ((-127.46157124828284286241183591682)+127.528) * (1-exp((-9.811*(t-140))/127.528)) - (127.528*(t-140)) +6372848.0334415934232551071925077, (141<=t<142), (127.5305/9.8114) * ((-127.46648694680207712950554957862)+127.5305) * (1-exp((-9.8114*(t-141))/127.5305)) - (127.5305*(t-141)) +6372720.5693809844092569889258768, (142<=t<143), (127.5331/9.8118) * ((-127.47122761873231599815849053692)+127.5331) * (1-exp((-9.8118*(t-142))/127.5331)) - (127.5331*(t-142)) +6372593.1004933115488997999814638, (143<=t<144), (127.5356/9.8122) * ((-127.47580623278979094647891668291)+127.5356) * (1-exp((-9.8122*(t-143))/127.5356)) - (127.5356*(t-143)) +6372465.6269470339802305084362856, (144<=t<145), (127.5382/9.8126) * ((-127.48023479783718123162571015174)+127.5382) * (1-exp((-9.8126*(t-144))/127.5382)) - (127.5382*(t-144)) +6372338.148898128200248977285121, (145<=t<146), (127.5407/9.813) * ((-127.48452443390826595903058582562)+127.5407) * (1-exp((-9.813*(t-145))/127.5407)) - (127.5407*(t-145)) +6372210.6664910119512944368249992, (146<=t<147), (127.5433/9.8133) * ((-127.48868543797834648924952002955)+127.5433) * (1-exp((-9.8133*(t-146))/127.5433)) - (127.5433*(t-146)) +6372083.1798593997435342574031302, (147<=t<148), (127.5458/9.8137) * ((-127.49272734486904125101622289735)+127.5458) * (1-exp((-9.8137*(t-147))/127.5458)) - (127.5458*(t-147)) +6371955.6891270950709962935619736, (148<=t<149), (127.5484/9.8141) * ((-127.49665898364732090895510002633)+127.5484) * (1-exp((-9.8141*(t-148))/127.5484)) - (127.5484*(t-148)) +6371828.1944087240045349374951921, (149<=t<150), (127.5509/9.8145) * ((-127.50048852985204188117934638168)+127.5509) * (1-exp((-9.8145*(t-149))/127.5509)) - (127.5509*(t-149)) +6371700.695810414498728333631251, (150<=t<151), (127.5535/9.8149) * ((-127.50422355385659342289567399718)+127.5535) * (1-exp((-9.8149*(t-150))/127.5535)) - (127.5535*(t-150)) +6371573.1934304254289253007249173, (151<=t<152), (127.556/9.8153) * ((-127.50787106565345249486730636404)+127.556) * (1-exp((-9.8153*(t-151))/127.556)) - (127.556*(t-151)) +6371445.6873597290776018350421139, (152<=t<153), (127.5586/9.8157) * ((-127.51143755632530677131350102957)+127.5586) * (1-exp((-9.8157*(t-152))/127.5586)) - (127.5586*(t-152)) +6371318.1776825505140950319154991, (153<=t<154), (127.5611/9.8161) * ((-127.51492903644783471146076734968)+127.5611) * (1-exp((-9.8161*(t-153))/127.5611)) - (127.5611*(t-153)) +6371190.6644768670570328773064278);

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
