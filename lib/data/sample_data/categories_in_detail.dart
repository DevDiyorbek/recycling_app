import '../models/category_info.dart';
import '../models/named_common_item.dart';

final plasticCategory = CategoryInfo(
  isSpecial: false,
  name: 'PLASTIC',
  imagePath: 'assets/images/plastic.png',
  yesItems: [
    'Plastic bottles and containers coded #1-#7',
    'Six or twelve pack rings',
  ],
  noItems: [
    'Plastic bags and film',
    'electronic items',
    'insecticide and hazardous chemical containers',
  ],
  commonItems: [
    NamedCommonItem(
      number: 1,
      initialism: 'PET',
      fullName: 'POLYETHYLENE TEREPHTHALATE',
      examples: [
        'Cosmetic Containers',
        'Plastic Bottles',
        'Mouthwash Bottles',
        'Prepared Food Trays',
      ],
    ),
    NamedCommonItem(
      number: 2,
      initialism: 'HDPE',
      fullName: 'HIGH-DENSITY POLYETHYLENE',
      examples: [
        'Detergent Bottles',
        'Grocery Bags',
        'Milk Bottles',
        'Shampoo Bottles',
      ],
    ),
    NamedCommonItem(
      number: 3,
      initialism: 'PVC',
      fullName: 'POLYVINYL CHLORIDE',
      examples: [
        'Garden Hose',
        'Window Frames',
        'Blood Bags',
        'Blister Packs',
      ],
    ),
    NamedCommonItem(
      number: 4,
      initialism: 'LDPE',
      fullName: 'LOW-DENSITY POLYETHYLENE',
      examples: [
        '6 Packs Rings',
        'Cling Film',
        'Bread Bags',
        'Squeezble Bottles',
      ],
    ),
    NamedCommonItem(
      number: 5,
      initialism: 'PP',
      fullName: 'POLYETHYLENE',
      examples: [
        'Yogurt Containers',
        'Medicine Bottles',
        'Caps',
        'Straws',
      ],
    ),
    NamedCommonItem(
      number: 6,
      initialism: 'PS',
      fullName: 'POLYSTYRENE',
      examples: [
        'Disposable Plates/Cups',
        'Egg Cartons',
        'Meat Trays',
        'Take-out Containers',
      ],
    ),
    NamedCommonItem(
      number: 7,
      initialism: 'OTHER',
      fullName: 'OTHER PLASTICS',
      examples: [
        'Sunglasses',
        'Nylon',
        'Bulletproof Materials',
        '3 & 5 gallon water bottles',
      ],
    ),
  ],
);

final metalCategory = CategoryInfo(
  isSpecial: false,
  name: 'METAL',
  imagePath: 'assets/images/metal.png',
  yesItems: [
    'Aluminum cans and foil',
    'Tin and steel cans including empty aerosol cans',
  ],
  noItems: [
    'Needles or syringes',
  ],
  commonItems: [
    NamedCommonItem(
      number: 40,
      initialism: 'FE',
      fullName: 'STEEL',
      examples: [
        'FOOD CANS',
      ],
    ),
    NamedCommonItem(
      number: 41,
      initialism: 'ALU',
      fullName: 'ALUMINIUM',
      examples: [
        'SOFt drink cans',
        "deodorant cans",
        "disposable food containers",
        "aluminium foil",
        "heat sinks",
      ],
    ),
  ],
);

final paperCategory = CategoryInfo(
  isSpecial: false,
  name: 'PAPER',
  imagePath: 'assets/images/paper.png',
  yesItems: [
    'Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap',
    'Magazines, newspaper, catalogs, and telephone books',
  ],
  noItems: [
    "Disposable diapers or rags",
    "soiled items such as pizza boxes, napkins, and tissues"
  ],
  commonItems: [
    NamedCommonItem(
      number: 21,
      initialism: 'PAP',
      fullName: 'PAPERBOARD',
      examples: ["cereal boxes", "snack boxes"],
    ),
    NamedCommonItem(
      number: 22,
      initialism: 'PAP',
      fullName: 'PAPER',
      examples: [
        "Newspaper",
        "books/magazines",
        "wrapping paper",
        "wallpaper",
        "paper bags",
        "paper straws"
      ],
    ),
  ],
);

final glassCategory = CategoryInfo(
  isSpecial: false,
  name: 'GLASS',
  imagePath: 'assets/images/glass.png',
  yesItems: ["Clear, green and brown glass bottles and jars"],
  noItems: [
    "Window glass and mirrors",
    "Compact fluorescent and other light bulbs",
    "Ceramics",
  ],
  commonItems: [
    NamedCommonItem(
      number: 70,
      initialism: 'GL',
      fullName: 'CLEAR GLASS',
      examples: ["food storage jars"],
    ),
    NamedCommonItem(
      number: 71,
      initialism: 'GL',
      fullName: 'GREEN GLASS',
      examples: ["wine bottles"],
    ),
    NamedCommonItem(
      number: 72,
      initialism: 'GL',
      fullName: 'BROWN GLASS',
      examples: ["beer, light-sensitive", "products"],
    ),
  ],
);

final cardboardCategory = CategoryInfo(
  isSpecial: false,
  name: 'Cardboard',
  imagePath: 'assets/images/cardboard.png',
  yesItems: ["Clean corrugated cardboard"],
  noItems: [
    "Pizza Boxes",
    "Boxes with plastic film, wax, or other embellishments"
  ],
  commonItems: [
    NamedCommonItem(
      number: 22,
      initialism: 'PAP',
      fullName: 'CORRUGATED FIBERBOARD',
      examples: ["Boxes"],
    ),
  ],
);

final electricCategory = CategoryInfo(
    isSpecial: true,
    name: 'Electric',
    imagePath: 'assets/images/cardboard.png',
    yesItems: [
      "Most electronic devices"
    ],
    noItems: [
      "LCD televisions and monitors",
      "Old televisions pre 1991",
      "Any electical items that contain mercury or lead"
    ],
    commonItems: []);

final batteryCategory = CategoryInfo(
  isSpecial: true,
  name: 'Battery',
  imagePath: 'assets/images/battery.png',
  yesItems: ["Most batteries "],
  noItems: ["Some alkaline batteries", "zinc carbon batteries"],
  commonItems: [
    NamedCommonItem(
      number: 08,
      initialism: 'Lead',
      fullName: 'LEAD-AID',
      examples: ["Car Batteries"],
    ),
    NamedCommonItem(
      number: 09,
      initialism: 'Alkaline',
      fullName: 'ALKALINE',
      examples: ["TV Remote Batteries", "Flashlight Batteries"],
    ),
    NamedCommonItem(
      number: 10,
      initialism: 'Ni-Cd',
      fullName: 'NICKEL-CADMIUM',
      examples: ["Older BAtteries"],
    ),
    NamedCommonItem(
      number: 11,
      initialism: 'Ni-MH',
      fullName: 'NICKEL-METAL HYDRIDE',
      examples: ["Rechargable AA, AAa", "9 volt, and D Batteries"],
    ),
    NamedCommonItem(
      number: 12,
      initialism: 'Li',
      fullName: 'LITHIUM',
      examples: [
        "Cell phone BAtteries",
        "computer BAtteries",
        "Camera BAtteries"
      ],
    ),
    NamedCommonItem(
      number: 13,
      initialism: 'SO',
      fullName: 'SILVER-OXIDE',
      examples: ["Button-cell or coin batteries"],
    ),
    NamedCommonItem(
      number: 14,
      initialism: 'CZ',
      fullName: 'ZINC-CARBON',
      examples: ["Some AA, C, and D batteries"],
    ),
  ],
);

final organicCategory = CategoryInfo(
  isSpecial: false,
  name: 'Organic',
  imagePath: 'assets/images/organic.png',
  yesItems: ["Materials made out of wood, cork, cotton, and jute "],
  noItems: ["Items that have other materials than what is listed above"],
  commonItems: [
    NamedCommonItem(
      number: 50,
      initialism: 'FOR',
      fullName: 'WOOD',
      examples: [
        "Furniture",
        "chopping boards",
        "brooms",
        "pencils",
        "spoons",
      ],
    ),
    NamedCommonItem(
      number: 51,
      initialism: 'FOR',
      fullName: 'CORK',
      examples: ["bottle stoppers placemats construction material"],
    ),
    NamedCommonItem(
      number: 60,
      initialism: 'TEX',
      fullName: 'COTTON',
      examples: [
        "towels"
            "t-shirts"
            "swabs"
            "pads"
      ],
    ),
    NamedCommonItem(
      number: 61,
      initialism: 'TEX',
      fullName: 'JUTE',
      examples: ["Clothing"],
    ),
  ],
);
