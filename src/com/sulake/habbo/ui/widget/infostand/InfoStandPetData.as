// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.infostand.InfoStandPetData

package com.sulake.habbo.ui.widget.infostand
{
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;

    public class InfoStandPetData 
    {

        private var _SafeStr_3623:int;
        private var _SafeStr_5923:int;
        private var _SafeStr_4374:int;
        private var _SafeStr_5924:int;
        private var _SafeStr_5925:int;
        private var _SafeStr_5926:int;
        private var _nutrition:int;
        private var _SafeStr_5927:int;
        private var _SafeStr_5928:int;
        private var _name:String = "";
        private var _SafeStr_5431:int = -1;
        private var _SafeStr_4028:int;
        private var _SafeStr_4785:int;
        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_5916:Boolean;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_5917:Boolean;
        private var _SafeStr_5536:int;
        private var _SafeStr_5918:int;
        private var _SafeStr_5919:int;
        private var _SafeStr_5921:Array;
        private var _SafeStr_5922:int;
        private var _SafeStr_5609:int;
        private var _hasBreedingPermission:Boolean;
        private var _SafeStr_5929:int;
        private var _SafeStr_5930:int;
        private var _SafeStr_5931:int;


        public function get name():String
        {
            return (_name);
        }

        public function get id():int
        {
            return (_SafeStr_5431);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get race():int
        {
            return (_SafeStr_4785);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get isOwnPet():Boolean
        {
            return (_SafeStr_5916);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get canRemovePet():Boolean
        {
            return (_SafeStr_5917);
        }

        public function get age():int
        {
            return (_SafeStr_5918);
        }

        public function get breedId():int
        {
            return (_SafeStr_5919);
        }

        public function get skillTresholds():Array
        {
            return (_SafeStr_5921);
        }

        public function get accessRights():int
        {
            return (_SafeStr_5922);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get levelMax():int
        {
            return (_SafeStr_5923);
        }

        public function get experience():int
        {
            return (_SafeStr_4374);
        }

        public function get experienceMax():int
        {
            return (_SafeStr_5924);
        }

        public function get energy():int
        {
            return (_SafeStr_5925);
        }

        public function get energyMax():int
        {
            return (_SafeStr_5926);
        }

        public function get nutrition():int
        {
            return (_nutrition);
        }

        public function get nutritionMax():int
        {
            return (_SafeStr_5927);
        }

        public function get petRespect():int
        {
            return (_SafeStr_5928);
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
        }

        public function get maxWellBeingSeconds():int
        {
            return (_SafeStr_5929);
        }

        public function get remainingWellBeingSeconds():int
        {
            return (_SafeStr_5930);
        }

        public function get remainingGrowingSeconds():int
        {
            return (_SafeStr_5931);
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function setData(_arg_1:RoomWidgetPetInfoUpdateEvent):void
        {
            _name = _arg_1.name;
            _SafeStr_5431 = _arg_1.id;
            _SafeStr_4028 = _arg_1.petType;
            _SafeStr_4785 = _arg_1.petRace;
            _SafeStr_4204 = _arg_1.image;
            _SafeStr_5916 = _arg_1.isOwnPet;
            _SafeStr_5226 = _arg_1.ownerId;
            _ownerName = _arg_1.ownerName;
            _SafeStr_5917 = _arg_1.canRemovePet;
            _SafeStr_3623 = _arg_1.level;
            _SafeStr_5923 = _arg_1.levelMax;
            _SafeStr_4374 = _arg_1.experience;
            _SafeStr_5924 = _arg_1.experienceMax;
            _SafeStr_5925 = _arg_1.energy;
            _SafeStr_5926 = _arg_1.energyMax;
            _nutrition = _arg_1.nutrition;
            _SafeStr_5927 = _arg_1.nutritionMax;
            _SafeStr_5928 = _arg_1.petRespect;
            _SafeStr_5536 = _arg_1.roomIndex;
            _SafeStr_5918 = _arg_1.age;
            _SafeStr_5919 = _arg_1.breedId;
            _SafeStr_5921 = _arg_1.skillTresholds;
            _SafeStr_5922 = _arg_1.accessRights;
            _SafeStr_5929 = _arg_1.maxWellBeingSeconds;
            _SafeStr_5930 = _arg_1.remainingWellBeingSeconds;
            _SafeStr_5931 = _arg_1.remainingGrowingSeconds;
            _SafeStr_5609 = _arg_1.rarityLevel;
            _hasBreedingPermission = _arg_1.hasBreedingPermission;
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4374 = "_-j1L" (String#4896, DoABC#4)
// _SafeStr_4785 = "_-jp" (String#9180, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_5609 = "_-l1V" (String#3326, DoABC#4)
// _SafeStr_5916 = "_-Y1Q" (String#8975, DoABC#4)
// _SafeStr_5917 = "_-vK" (String#9375, DoABC#4)
// _SafeStr_5918 = "_-q1i" (String#2983, DoABC#4)
// _SafeStr_5919 = "_-e1Z" (String#6218, DoABC#4)
// _SafeStr_5921 = "_-C1x" (String#6049, DoABC#4)
// _SafeStr_5922 = "_-O7" (String#6459, DoABC#4)
// _SafeStr_5923 = "_-A1w" (String#5946, DoABC#4)
// _SafeStr_5924 = "_-k3" (String#6259, DoABC#4)
// _SafeStr_5925 = "_-71Q" (String#3989, DoABC#4)
// _SafeStr_5926 = "_-e1m" (String#5904, DoABC#4)
// _SafeStr_5927 = "_-x1H" (String#6206, DoABC#4)
// _SafeStr_5928 = "_-x1j" (String#8792, DoABC#4)
// _SafeStr_5929 = "_-R1r" (String#5961, DoABC#4)
// _SafeStr_5930 = "_-s9" (String#5914, DoABC#4)
// _SafeStr_5931 = "_-u1j" (String#6278, DoABC#4)


