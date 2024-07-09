//
//  HomeInfoVC.swift


import Foundation
import UIKit

class HomeInfoVC: UIViewController {
    
    var countInfo: Int = 0 {
           didSet {
               updateBodyFieldInfo()
           }
       }
    
    private var contentView: HomeInfoView {
        view as? HomeInfoView ?? HomeInfoView()
    }
    
    override func loadView() {
        view = HomeInfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        configureLabel()
    }
    
    private func configureLabel() {
        contentView.scoreLabel.text = "\(UserDef.shared.scorePoints)"
    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)

    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func updateBodyFieldInfo() {
        let regularFont = UIFont(name: "SofiaSans-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)
        let boldFont = UIFont(name: "SofiaSans-Black", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
        let blackColor = UIColor.cLightYellow
        let regularColor = UIColor.white
        
        switch countInfo {
        case 0 :
            contentView.imgInfo.image = .imgIndochineseTigerInfo
            contentView.titleLabel.text = "Indochinese Tiger"
            
            let bodyText = """
            Overview:\n\nThe Indochinese tiger (Panthera tigris corbetti) roams the lush landscapes of Southeast Asia. Historically, these magnificent creatures could be found across a vast region including Thailand, Myanmar, Laos, Vietnam, Cambodia, and southwestern China. Today, their presence has dwindled due to extensive deforestation, agricultural expansion, and urbanization, which have led to significant habitat fragmentation and loss.\n\n
            Physical Characteristics:\n\nIndochinese tigers are known for their distinctive appearance. They possess a vibrant orange coat adorned with narrow, closely spaced black stripes, which helps them blend seamlessly into their forest surroundings. Males typically weigh between 150 to 200 kilograms (330 to 440 pounds), while females are smaller, weighing between 100 to 130 kilograms (220 to 290 pounds). Their powerful build and muscular limbs make them formidable hunters.\n\n
            Habitat Preferences:\n\nThese tigers inhabit various environments, including tropical and subtropical forests, grasslands, and mangrove swamps. They require large territories to support their solitary nature and hunting needs. Unfortunately, human encroachment and infrastructure development have severely fragmented their habitats, posing a significant threat to their survival.\n\n
            Dietary Habits:\n\nIndochinese tigers are apex predators and play a crucial role in their ecosystems. Their diet mainly consists of large ungulates such as deer, wild pigs, and cattle. They rely on stealth and strength to ambush their prey, ensuring they remain at the top of the food chain. By controlling prey populations, they help maintain the ecological balance.\n\n
            Conservation Status:\n\nThe Indochinese tiger is classified as Endangered by the International Union for Conservation of Nature (IUCN). Major threats include habitat destruction, poaching for the illegal wildlife trade, and conflicts with humans over resources. Conservation efforts are focused on anti-poaching measures, habitat restoration, and promoting coexistence between tigers and local communities.\n\n
            Population Estimates:\n\nEstimating the exact population of Indochinese tigers is challenging due to their elusive nature and the remote, often inaccessible areas they inhabit. However, it is estimated that only a few hundred individuals remain in the wild, scattered across fragmented landscapes. Efforts to monitor and protect these tigers are ongoing.\n\n
            Ecological Importance:\n\nIndochinese tigers are vital for maintaining the health of their ecosystems. As apex predators, they regulate prey populations, preventing overgrazing and promoting biodiversity. Their presence influences the behavior and distribution of other species, contributing to the overall stability and resilience of their habitats.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 1 :
            contentView.imgInfo.image = .imgBaliTigerInfo
            contentView.titleLabel.text = "Bali Tiger"
            let bodyText = """
            Overview:\n\nThe Bali tiger (Panthera tigris balica) was a small tiger subspecies native to the Indonesian island of Bali. These tigers are now extinct, primarily due to hunting and habitat destruction. The Bali tiger's extinction in the 20th century serves as a stark reminder of the impact of human activities on wildlife.\n\n
            Physical Characteristics:\n\nBali tigers were the smallest of all tiger subspecies. Males typically weighed around 90 to 100 kilograms (200 to 220 pounds), while females weighed between 65 to 80 kilograms (140 to 175 pounds). They had a short, deep orange coat with closely spaced black stripes and a lighter underbelly. Their small size and agile build made them well-suited for the dense forests of Bali.\n\n
            Habitat Preferences:\n\nThese tigers inhabited the forests and grasslands of Bali. They required dense vegetation for cover and adequate prey to sustain their populations. However, extensive hunting and habitat destruction for agriculture and human settlement led to their rapid decline and eventual extinction.\n\n
            Dietary Habits:\n\nBali tigers were apex predators with a diet that included various species of deer, wild boar, and smaller mammals. They hunted primarily by stalking and ambushing their prey, relying on their agility and strength. The reduction in their prey base due to human activities further endangered their survival.\n\n
            Conservation Status:\n\nThe Bali tiger is classified as extinct by the IUCN. The last confirmed sighting of a Bali tiger in the wild was in the 1930s. Extensive hunting, habitat destruction, and a decline in prey populations led to their extinction. The loss of the Bali tiger underscores the urgent need for conservation efforts to protect other endangered species.\n\n
            Population Estimates:\n\nThe Bali tiger population declined rapidly in the early 20th century due to hunting and habitat destruction. By the 1930s, the species was declared extinct in the wild. Conservationists now focus on preventing similar fates for other tiger subspecies by implementing stricter protections and habitat restoration efforts.\n\n
            Ecological Importance:\n\nBali tigers played a crucial role in maintaining the health and balance of their ecosystems. As apex predators, they regulated prey populations, which in turn supported the health and diversity of the ecosystem. Their extinction has had significant ecological impacts, demonstrating the importance of protecting top predators to preserve biodiversity.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 2 :
            contentView.imgInfo.image = .imgBengalTigerInfo
            contentView.titleLabel.text = "Bengal Tiger"
            
            let bodyText = """
            Overview:\n\nThe Bengal tiger (Panthera tigris tigris) is an iconic and revered tiger subspecies, predominantly found in the Indian subcontinent. This majestic predator is renowned for its grace, power, and striking beauty. The Bengal tiger's range includes diverse habitats such as tropical forests, mangroves, grasslands, and swamps across India, Bangladesh, Nepal, Bhutan, and Myanmar. Unfortunately, their existence is threatened by habitat loss, human-wildlife conflict, and poaching.\n\n
            Physical Characteristics:\n\nBengal tigers are the most numerous of all tiger subspecies. They have a characteristic orange coat with black stripes and a white underbelly. Each tiger's stripe pattern is unique, much like human fingerprints, aiding in individual identification. Adult males typically weigh between 180 to 260 kilograms (400 to 570 pounds), while females are smaller, weighing between 100 to 160 kilograms (220 to 350 pounds). Their powerful build, keen senses, and stealth make them efficient hunters.\n\n
            Habitat Preferences:\n\nThese tigers are highly adaptable and can thrive in a variety of habitats. They are primarily found in India, with significant populations in the Sundarbans mangrove forest, which straddles India and Bangladesh. The Sundarbans is a unique habitat where tigers have adapted to living in a swampy environment, showcasing their remarkable adaptability. Other habitats include dense forests, grasslands, and river valleys, all providing essential cover and access to water sources.\n\n
            Dietary Habits:\n\nAs apex predators, Bengal tigers primarily prey on large ungulates such as deer, wild boar, and water buffalo. They are solitary hunters, relying on their stealth and strength to ambush prey. Occasionally, they may also hunt smaller animals and birds. Their hunting success rate is relatively low, so they require large territories to ensure an adequate food supply. By controlling herbivore populations, Bengal tigers play a critical role in maintaining the balance of their ecosystems.\n\n
            Conservation Status:\n\nThe Bengal tiger is classified as Endangered by the International Union for Conservation of Nature (IUCN). Major threats to their survival include habitat destruction due to deforestation and agricultural expansion, human-wildlife conflict, and poaching for their skins, bones, and other body parts used in traditional medicine and as status symbols. Conservation efforts focus on protecting and restoring habitats, anti-poaching measures, and raising awareness among local communities.\n\n
            Population Estimates:\n\nEstimating the population of Bengal tigers is challenging due to their elusive nature and the dense habitats they occupy. However, current estimates suggest that there are around 2,500 individuals remaining in the wild. Conservationists use camera traps, genetic analysis, and other monitoring techniques to track tiger populations and develop effective conservation strategies.\n\n
            Ecological Importance:\n\nBengal tigers are keystone species in their habitats. By preying on herbivores, they help regulate the population of these animals, preventing overgrazing and promoting the growth of vegetation. This, in turn, supports a wide range of other species and contributes to the overall health and biodiversity of the ecosystem. Protecting Bengal tigers is crucial not only for their survival but also for the health of the ecosystems they inhabit.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 3 :
            contentView.imgInfo.image = .imgMalayanTigerInfo
            contentView.titleLabel.text = "Malayan Tiger"
            
            let bodyText = """
            Overview:\n\nThe The Malayan tiger (Panthera tigris jacksoni) is a critically endangered subspecies found primarily in the forests of the Malay Peninsula. Known for their smaller size compared to other tiger subspecies, Malayan tigers play a crucial role in maintaining the ecological balance of their habitats. These tigers face severe threats from habitat loss, poaching, and human-wildlife conflict, making their conservation a priority.\n\n
            Physical Characteristics:\n\nMalayan tigers are relatively small compared to their counterparts, with males typically weighing between 100 to 120 kilograms (220 to 265 pounds) and females weighing between 65 to 90 kilograms (145 to 200 pounds). They have a dark orange coat with black stripes, which provides excellent camouflage in their forest habitats. Their smaller size and agility make them adept at navigating the dense jungle terrain.\n\n
            Habitat Preferences:\n\nThese tigers inhabit a range of environments within the Malay Peninsula, including tropical and subtropical forests, grasslands, and swampy areas. They require large territories with ample cover and water sources to support their solitary and elusive nature. However, deforestation for palm oil plantations, agriculture, and urban development has severely fragmented their habitat.\n\n
            Dietary Habits:\n\nMalayan tigers are apex predators with a diet that primarily consists of deer, wild boar, and smaller mammals such as monkeys and birds. They are solitary hunters, relying on their stealth and strength to ambush prey. The reduction in their prey base due to habitat destruction further threatens their survival, as they need large territories to find sufficient food.\n\n
            Conservation Status:\n\nThe Malayan tiger is classified as Critically Endangered by the IUCN. Major threats to their survival include habitat loss, poaching for their body parts, and conflicts with humans. Conservation efforts focus on anti-poaching measures, habitat protection, and restoring connectivity between fragmented forest areas. Engaging local communities in conservation efforts is also essential to mitigate human-tiger conflicts.\n\n
            Population Estimates:\n\nThe population of Malayan tigers is critically low, with estimates suggesting fewer than 200 individuals remaining in the wild. Conservationists use camera traps, genetic analysis, and other monitoring techniques to track these tigers and develop strategies to protect and increase their numbers. Intensive conservation efforts are crucial to prevent their extinction.\n\n
            Ecological Importance:\n\nMalayan tigers play a vital role in maintaining the health and balance of their ecosystems. By regulating prey populations, they prevent overgrazing and promote biodiversity. Their presence influences the behavior and distribution of other species, contributing to the overall stability and resilience of their habitats. Protecting Malayan tigers is essential for the health of the forests they inhabit.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 4 :
            contentView.imgInfo.image = .imgJavanTigerInfo
            contentView.titleLabel.text = "Javan Tiger"
            
            let bodyText = """
            Overview:\n\nThe Javan tiger (Panthera tigris sondaica) was a tiger subspecies native to the Indonesian island of Java. These tigers are now extinct, primarily due to habitat destruction, hunting, and a decline in prey. The extinction of the Javan tiger in the 20th century highlights the devastating impact of human activities on wildlife.\n\n
            Physical Characteristics:\n\nJavan tigers were relatively small compared to other tiger subspecies. Males typically weighed around 100 to 140 kilograms (220 to 310 pounds), while females weighed between 75 to 115 kilograms (165 to 250 pounds). They had a short, deep orange coat with closely spaced black stripes and a lighter underbelly. Their smaller size and agile build made them well-suited for the dense forests of Java.\n\n
            Habitat Preferences:\n\nThese tigers inhabited the forests and grasslands of Java. They required dense vegetation for cover and adequate prey to sustain their populations. However, extensive hunting and habitat destruction for agriculture and human settlement led to their rapid decline and eventual extinction.\n\n
            Dietary Habits:\n\nJavan tigers were apex predators with a diet that included various species of deer, wild boar, and smaller mammals. They hunted primarily by stalking and ambushing their prey, relying on their agility and strength. The reduction in their prey base due to human activities further endangered their survival.\n\n
            Conservation Status:\n\nThe Javan tiger is classified as extinct by the IUCN. The last confirmed sighting of a Javan tiger in the wild was in the 1970s. Extensive hunting, habitat destruction, and a decline in prey populations led to their extinction. The loss of the Javan tiger underscores the urgent need for conservation efforts to protect other endangered species.\n\n
            Population Estimates:\n\nThe Javan tiger population declined rapidly in the 20th century due to hunting and habitat destruction. By the 1970s, the species was declared extinct in the wild. Conservationists now focus on preventing similar fates for other tiger subspecies by implementing stricter protections and habitat restoration efforts.\n\n
            Ecological Importance:\n\nJavan tigers played a crucial role in maintaining the health and balance of their ecosystems. As apex predators, they regulated prey populations, which in turn supported the health and diversity of the ecosystem. Their extinction has had significant ecological impacts, demonstrating the importance of protecting top predators to preserve biodiversity.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 5 :
            contentView.imgInfo.image = .imgSumartanTigerInfo
            contentView.titleLabel.text = "Sumartan Tiger"
            
            let bodyText = """
            Overview:\n\nThe The Sumatran tiger (Panthera tigris sumatrae) is the smallest of all tiger subspecies, found exclusively on the Indonesian island of Sumatra. These tigers are critically endangered, with habitat loss, poaching, and human-wildlife conflict being the primary threats to their survival. Sumatra’s dense tropical rainforests, swamps, and lowland forests are the last remaining refuges for these magnificent predators.\n\n
            Physical Characteristics:\n\nSumatran tigers are notably smaller than their mainland counterparts. Males typically weigh between 100 to 140 kilograms (220 to 310 pounds), while females weigh between 75 to 110 kilograms (165 to 245 pounds). They have a darker orange coat with thick black stripes, which are closer together compared to other tiger subspecies. This adaptation helps them blend into their dense forest habitats. Their relatively small size aids in navigating through the dense jungle terrain.\n\n
            Habitat Preferences:\n\nThese tigers primarily inhabit lowland and montane forests, peat swamps, and freshwater swamp forests. The island's diverse habitats provide the necessary cover and prey for their survival. However, rampant deforestation for palm oil plantations, agriculture, and human settlement has severely fragmented their habitat, isolating populations and making them more vulnerable to extinction.\n\n
            Dietary Habits:\n\nSumatran tigers are apex predators with a diet that primarily includes deer, wild boar, and smaller mammals. They are also known to hunt primates, birds, and fish. Their solitary nature means they hunt alone, relying on their stealth and powerful build to ambush prey. A significant reduction in their prey base due to habitat destruction further exacerbates their struggle for survival.\n\n
            Conservation Status:\n\nThe Sumatran tiger is classified as Critically Endangered by the IUCN. With an estimated population of fewer than 400 individuals in the wild, they face an extremely high risk of extinction. Conservation efforts focus on anti-poaching measures, habitat protection, and restoring connectivity between fragmented forest areas. Community engagement and education are also crucial to mitigate human-tiger conflict.\n\n
            Population Estimates:\n\nThe Sumatran tiger population is critically low, with only around 400 individuals remaining in the wild. These populations are fragmented across the island, making genetic diversity a critical issue. Conservationists use camera traps, genetic analysis, and other monitoring techniques to keep track of these elusive predators and to develop strategies to bolster their numbers.\n\n
            Ecological Importance:\n\nAs apex predators, Sumatran tigers play a crucial role in maintaining the health and balance of their ecosystems. By regulating prey populations, they prevent overgrazing, which helps preserve the vegetation and supports a diverse array of other species. Protecting Sumatran tigers is vital not only for their survival but also for the overall health of their forest habitats.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 6 :
            contentView.imgInfo.image = .imgAmurTigerInfo
            contentView.titleLabel.text = "Amur\n(Siberian) Tiger"
            
            let bodyText = """
            Overview:\n\nThe Amur tiger (Panthera tigris altaica), also known as the Siberian tiger, is the largest tiger subspecies. These magnificent cats are native to the harsh, cold forests of the Russian Far East, northeastern China, and possibly North Korea. The Amur tiger's population has been critically threatened by poaching, habitat destruction, and a declining prey base. Intensive conservation efforts have been implemented to protect these incredible animals.\n\n
            Physical Characteristics:\n\nAmur tigers are known for their impressive size and strength. Males can weigh up to 320 kilograms (700 pounds), while females typically weigh between 100 to 167 kilograms (220 to 370 pounds). They have thick, dense fur that helps them withstand the frigid temperatures of their habitats. Their coat is pale orange with dark brown or black stripes, and they have a distinctive ruff of fur around their neck.\n\n
            Habitat Preferences:\n\nThese tigers inhabit the temperate forests and mountainous regions of the Russian Far East, particularly in the Sikhote-Alin mountain range. Smaller populations exist in northeastern China and possibly North Korea. Amur tigers require vast territories to find sufficient prey and avoid conflicts with other tigers. Their habitats are characterized by dense forests, river valleys, and areas with abundant cover.\n\n
            Dietary Habits:\n\nAmur tigers are apex predators with a diet that mainly consists of large ungulates such as deer and wild boar. They are also known to hunt smaller mammals and occasionally fish. Their solitary hunting style involves stalking and ambushing prey, relying on their powerful build and stealth. A significant reduction in their prey base due to poaching and habitat loss further threatens their survival.\n\n
            Conservation Status:\n\nThe Amur tiger is classified as Endangered by the IUCN. Major threats to their survival include poaching for their fur and body parts, habitat destruction, and a declining prey base. Conservation efforts focus on anti-poaching measures, habitat protection, and restoring connectivity between fragmented forest areas. International cooperation between Russia, China, and other countries is crucial for the survival of the Amur tiger.\n\n
            Population Estimates:\n\nThe population of Amur tigers is estimated to be around 500 individuals in the wild. Conservationists use camera traps, genetic analysis, and other monitoring techniques to track these tigers and develop strategies to protect and increase their numbers. Intensive conservation efforts have helped stabilize their population, but they remain critically endangered.\n\n
            Ecological Importance:\n\nAmur tigers play a vital role in maintaining the health and balance of their ecosystems. By regulating prey populations, they prevent overgrazing and promote biodiversity. Their presence influences the behavior and distribution of other species, contributing to the overall stability and resilience of their habitats. Protecting Amur tigers is essential for the health of the forests they inhabit.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 7 :
            contentView.imgInfo.image = .imgMekongTigerInfo
            contentView.titleLabel.text = "Mekong Tiger"
            
            let bodyText = """
            Overview:\n\nThe Mekong tiger (Panthera tigris mekongensis) is a rare and lesser-known subspecies of tiger that once roamed the dense forests and river basins of the Mekong region, including parts of Laos, Cambodia, Thailand, and Vietnam. These tigers are known for their elusive nature and adaptability to various environments, from tropical rainforests to mountainous terrains. Unfortunately, due to habitat loss and poaching, the Mekong tiger population has dramatically declined, making them one of the most endangered tiger subspecies.\n\n
            Physical Characteristics:\n\nMekong tigers are smaller and leaner compared to other tiger subspecies. Males typically weigh between 130 to 180 kilograms (290 to 400 pounds), while females weigh between 90 to 120 kilograms (200 to 265 pounds). They have a reddish-orange coat with narrow, closely spaced black stripes, which helps them blend into the dense vegetation of their habitat. Their agile and muscular build makes them adept hunters in the varied terrain of the Mekong region.\n\n
            Habitat Preferences:\n\nThese tigers prefer dense, tropical rainforests and river basins, where they can find ample cover and prey. They are also known to inhabit mountainous regions and swamps, demonstrating their adaptability. However, extensive deforestation, agricultural expansion, and infrastructure development have severely fragmented their habitat, isolating populations and making them more vulnerable to extinction.\n\n
            Dietary Habits:\n\nMekong tigers are solitary apex predators, primarily preying on medium to large-sized ungulates such as deer, wild boar, and gaur. They also hunt smaller mammals and birds when larger prey is scarce. Their hunting strategy involves stalking and ambushing their prey, using their strength and agility to overpower them. The reduction in their prey base due to human activities further threatens their survival.\n\n
            Conservation Status:\n\nThe Mekong tiger is classified as Critically Endangered by the IUCN. Major threats to their survival include habitat destruction, poaching for their body parts, and conflicts with humans. Conservation efforts focus on anti-poaching measures, habitat restoration, and raising awareness among local communities about the importance of tiger conservation. International cooperation and effective law enforcement are crucial for the survival of the Mekong tiger.\n\n
            Population Estimates:\n\nThe population of Mekong tigers is critically low, with estimates suggesting fewer than 200 individuals remaining in the wild. Conservationists use camera traps, genetic analysis, and other monitoring techniques to track these elusive tigers and develop strategies to protect and increase their numbers. Intensive conservation efforts are necessary to prevent their extinction.\n\n
            Ecological Importance:\n\nMekong tigers play a vital role in maintaining the health and balance of their ecosystems. By regulating prey populations, they prevent overgrazing and promote biodiversity. Their presence influences the behavior and distribution of other species, contributing to the overall stability and resilience of their habitats. Protecting Mekong tigers is essential for the health of the forests and river basins they inhabit.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 8 :
            contentView.imgInfo.image = .imgCaspianTigerInfo
            contentView.titleLabel.text = "Caspian Tiger"
            
            let bodyText = """
            Overview:\n\n The Caspian tiger (Panthera tigris virgata), also known as the Turanian tiger, once roamed the vast regions of Central Asia, particularly near the Caspian Sea. These tigers were one of the largest subspecies, known for their robust build and striking appearance. Sadly, the Caspian tiger is now extinct in the wild due to habitat destruction, overhunting, and a decline in prey.\n\n
            Physical Characteristics:\n\nCaspian tigers were among the largest tiger subspecies, with males weighing up to 240 kilograms (530 pounds) and females weighing between 85 to 135 kilograms (187 to 298 pounds). They had a thick coat of yellow-orange fur with closely spaced black stripes, and a dense mane of fur around their necks. Their powerful build and large size made them formidable predators in their natural habitats.\n\n
            Habitat Preferences:\n\nThese tigers inhabited diverse environments, including riverine forests, reed thickets, and mountain valleys. Their range extended from Turkey through Iran, Central Asia, and into northwestern China. They required large territories with ample cover and prey to support their solitary and elusive nature. However, extensive hunting and habitat destruction for agriculture and development led to their decline.\n\n
            Dietary Habits:\n\nCaspian tigers were apex predators with a diet that included various species of deer, wild boar, and other large mammals. They hunted primarily by stalking and ambushing their prey, relying on their strength and agility. The decline in prey populations due to human activities further endangered their survival, as they needed large territories to find sufficient food.\n\n
            Conservation Status:\n\nThe Caspian tiger is classified as extinct in the wild by the IUCN. The last confirmed sighting of a Caspian tiger in the wild was in the 1970s. Efforts to reintroduce these tigers into their former habitats have been considered, using closely related Amur tigers, but these plans face significant challenges. The story of the Caspian tiger highlights the urgent need for conservation efforts to protect other endangered species.\n\n
            Population Estimates:\n\nThe Caspian tiger population declined rapidly in the 20th century due to habitat destruction and overhunting. By the 1970s, the species was declared extinct in the wild. Conservationists now focus on studying the genetics and history of the Caspian tiger to inform potential reintroduction efforts using Amur tigers, which are genetically similar.\n\n
            Ecological Importance:\n\nCaspian tigers played a crucial role in maintaining the health and balance of their ecosystems. As apex predators, they regulated prey populations, which in turn supported the health and diversity of the ecosystem. Their extinction has had significant ecological impacts, demonstrating the importance of protecting top predators to preserve biodiversity.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        case 9 :
            contentView.imgInfo.image = .imgSouthChinaTigerInfo
            contentView.titleLabel.text = "South China\nTiger"
            
            let bodyText = """
            Overview:\n\nThe The South China tiger (Panthera tigris amoyensis), also known as the Chinese tiger, is one of the most critically endangered tiger subspecies. Historically found in southern China, this tiger is now on the brink of extinction due to habitat loss, poaching, and human-wildlife conflict. Intensive conservation efforts are being made to save this iconic species from disappearing forever.\n\n
            Physical Characteristics:\n\nSouth China tigers are slightly smaller than other tiger subspecies. Males typically weigh between 110 to 150 kilograms (240 to 330 pounds), while females weigh between 100 to 115 kilograms (220 to 250 pounds). They have a short, coarse coat that ranges from dark orange to light yellow, with narrow, closely spaced black stripes. Their distinctive facial markings and white belly add to their unique appearance.\n\n
            Habitat Preferences:\n\nThese tigers historically inhabited the forests and grasslands of southern China. They require large territories with dense vegetation to provide cover and support their solitary hunting habits. However, extensive deforestation and agricultural expansion have drastically reduced their habitat, confining them to isolated patches of forest.\n\n
            Dietary Habits:\n\nSouth China tigers are apex predators with a diet that includes various species of deer, wild boar, and smaller mammals. They hunt primarily by stalking and ambushing their prey, relying on their strength and agility. The loss of habitat and prey base due to human activities has further endangered their survival.\n\n
            Conservation Status:\n\nThe South China tiger is classified as Critically Endangered by the IUCN and is considered one of the world's most endangered tigers. Fewer than 30 individuals are believed to remain in the wild, and they may be functionally extinct in their natural habitat. Conservation efforts include captive breeding programs and habitat restoration projects aimed at reintroducing tigers into the wild.\n\n
            Population Estimates:\n\nThe population of South China tigers is critically low, with estimates suggesting fewer than 30 individuals remaining in the wild. Captive breeding programs in China and South Africa have had some success, with the goal of eventually reintroducing these tigers into their natural habitat. Intensive monitoring and conservation efforts are crucial to prevent their extinction.\n\n
            Ecological Importance:\n\nSouth China tigers play a vital role in maintaining the ecological balance of their habitats. As apex predators, they help regulate prey populations, which in turn supports the health and diversity of the ecosystem. Protecting South China tigers is essential not only for their survival but also for the overall health of the forests they inhabit.\n\n
            """
            
            let attributedText = NSAttributedString.attributedString(
                from: bodyText,
                boldParts: ["Overview:", "Physical Characteristics:", "Habitat Preferences:","Dietary Habits:", "Conservation Status:", "Population Estimates:", "Ecological Importance:"],
                boldFont: boldFont,
                regularFont: regularFont,
                boldColor: blackColor,
                regularColor: regularColor
            )
            
            contentView.bodyFieldInfo.attributedText = attributedText

        default:
            contentView.bodyFieldInfo.text = ""
        }
    }

}

