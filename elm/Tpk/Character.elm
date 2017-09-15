module Tpk.Character exposing (..)


type Alignment
    = CG
    | CN
    | CE
    | NG
    | N
    | NE
    | LG
    | LN
    | LE


type alias Total =
    { total : Int
    , mods : List ( Int, String )
    }


type alias Capped =
    { current : Int
    , maximum : Int
    }


type alias AbilityScores =
    { str : Int
    , dex : Int
    , con : Int
    , int : Int
    , wis : Int
    , cha : Int
    }


type alias Skills =
    { acrobatics : Total
    , athletics : Total
    , bluff : Total
    , computers : Total
    , culture : Total
    , diplomacy : Total
    , disguise : Total
    , engineering : Total
    , intimidate : Total
    , lifeScience : Total
    , medicine : Total
    , mysticism : Total
    , perception : Total
    , physicalScience : Total
    , piloting : Total
    , profession : List ( String, Total )
    , senseMotive : Total
    , sleightOfHand : Total
    , stealth : Total
    , survival : Total
    }


type alias Health =
    { stamina : Capped
    , health : Capped
    , resolve : Capped
    }


type alias ArmorClass =
    { eac : Total
    , kac : Total
    , cac : Total
    , damageReduction : ( Int, List String )
    , resistances : List ( Int, String )
    }


type alias SavingThrows =
    { fortitude : Total
    , reflex : Total
    , will : Total
    }


type alias AttackBonuses =
    { bab : Int
    , melee : Total
    , ranged : Total
    , thrown : Total
    }


type alias Weapon =
    { name : String
    , level : Int
    , attackBonus : Total
    , damage : String
    , critical : String
    , range : Maybe Int
    , ty : String
    , ammo : Maybe Capped
    , special : String
    }


type alias Equipment =
    { name : String
    , level : Int
    , bulk : Int
    }


type alias Inventory =
    { equipment : List Equipment
    , credits : Int
    , totalBulk : Int
    }


type alias CarryingCapacity =
    { unencumbered : Int
    , encumbered : Int
    , overburdened : Int
    }


type alias Spells =
    { daily : Capped
    , known : List String
    }


type alias SpellsKnown =
    { cantrips : List String
    , ranked : List Spells
    }


type alias Experience =
    { earned : Int
    , nextLevel : Int
    }


type alias Sheet =
    { name : String
    , class : List ( String, Int )
    , race : String
    , theme : String
    , size : String
    , speed : String
    , gender : String
    , homeWorld : String
    , alignment : Alignment
    , deity : Maybe String
    , initiative : Total
    , abilityScores : AbilityScores
    , skills : Skills
    , health : Health
    , saves : SavingThrows
    , weapons : List Weapon
    , abilities : List String
    , feats : List String
    , languages : List String
    , equipment : Inventory
    , carryingCapacity : CarryingCapacity
    , spells : SpellsKnown
    , experience : Experience
    }
