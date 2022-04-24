// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const PET_INFO:String = "RWPIUE_PET_INFO";

        private var _SafeStr_3623:int;
        private var _SafeStr_5923:int;
        private var _SafeStr_4374:int;
        private var _SafeStr_5924:int;
        private var _SafeStr_5925:int;
        private var _SafeStr_5926:int;
        private var _nutrition:int;
        private var _SafeStr_5927:int;
        private var _SafeStr_3824:int;
        private var _SafeStr_5928:int;
        private var _SafeStr_5918:int;
        private var _name:String;
        private var _SafeStr_3820:int;
        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_5421:int;
        private var _SafeStr_5915:int;
        private var _SafeStr_5916:Boolean;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_5917:Boolean;
        private var _SafeStr_5536:int;
        private var _SafeStr_5919:int;
        private var _SafeStr_5920:Boolean;
        private var _SafeStr_4378:Boolean;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5921:Array;
        private var _SafeStr_5922:int;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _SafeStr_5609:int;
        private var _SafeStr_5929:int;
        private var _SafeStr_5930:int;
        private var _SafeStr_5931:int;
        private var _hasBreedingPermission:Boolean;

        public function RoomWidgetPetInfoUpdateEvent(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:BitmapData, _arg_6:Boolean, _arg_7:int, _arg_8:String, _arg_9:int, _arg_10:int, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            super("RWPIUE_PET_INFO", _arg_11, _arg_12);
            _SafeStr_5421 = _arg_1;
            _SafeStr_5915 = _arg_2;
            _name = _arg_3;
            _SafeStr_3820 = _arg_4;
            _SafeStr_4204 = _arg_5;
            _SafeStr_5916 = _arg_6;
            _SafeStr_5226 = _arg_7;
            _ownerName = _arg_8;
            _SafeStr_5536 = _arg_9;
            _SafeStr_5919 = _arg_10;
        }

        public function get name():String
        {
            return (_name);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get petType():int
        {
            return (_SafeStr_5421);
        }

        public function get petRace():int
        {
            return (_SafeStr_5915);
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

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get age():int
        {
            return (_SafeStr_5918);
        }

        public function get breedId():int
        {
            return (_SafeStr_5919);
        }

        public function get hasFreeSaddle():Boolean
        {
            return (_SafeStr_5920);
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
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

        public function get petRespectLeft():int
        {
            return (_SafeStr_3824);
        }

        public function get petRespect():int
        {
            return (_SafeStr_5928);
        }

        public function set level(_arg_1:int):void
        {
            _SafeStr_3623 = _arg_1;
        }

        public function set levelMax(_arg_1:int):void
        {
            _SafeStr_5923 = _arg_1;
        }

        public function set experience(_arg_1:int):void
        {
            _SafeStr_4374 = _arg_1;
        }

        public function set experienceMax(_arg_1:int):void
        {
            _SafeStr_5924 = _arg_1;
        }

        public function set energy(_arg_1:int):void
        {
            _SafeStr_5925 = _arg_1;
        }

        public function set energyMax(_arg_1:int):void
        {
            _SafeStr_5926 = _arg_1;
        }

        public function set nutrition(_arg_1:int):void
        {
            _nutrition = _arg_1;
        }

        public function set nutritionMax(_arg_1:int):void
        {
            _SafeStr_5927 = _arg_1;
        }

        public function set petRespectLeft(_arg_1:int):void
        {
            _SafeStr_3824 = _arg_1;
        }

        public function set canRemovePet(_arg_1:Boolean):void
        {
            _SafeStr_5917 = _arg_1;
        }

        public function set petRespect(_arg_1:int):void
        {
            _SafeStr_5928 = _arg_1;
        }

        public function set age(_arg_1:int):void
        {
            _SafeStr_5918 = _arg_1;
        }

        public function set hasFreeSaddle(_arg_1:Boolean):void
        {
            _SafeStr_5920 = _arg_1;
        }

        public function set isRiding(_arg_1:Boolean):void
        {
            _SafeStr_4378 = _arg_1;
        }

        public function set canBreed(_arg_1:Boolean):void
        {
            _SafeStr_5690 = _arg_1;
        }

        public function set skillTresholds(_arg_1:Array):void
        {
            _SafeStr_5921 = _arg_1;
        }

        public function set accessRights(_arg_1:int):void
        {
            _SafeStr_5922 = _arg_1;
        }

        public function set canHarvest(_arg_1:Boolean):void
        {
            _SafeStr_5820 = _arg_1;
        }

        public function set canRevive(_arg_1:Boolean):void
        {
            _SafeStr_5821 = _arg_1;
        }

        public function set rarityLevel(_arg_1:int):void
        {
            _SafeStr_5609 = _arg_1;
        }

        public function get maxWellBeingSeconds():int
        {
            return (_SafeStr_5929);
        }

        public function set maxWellBeingSeconds(_arg_1:int):void
        {
            _SafeStr_5929 = _arg_1;
        }

        public function get remainingWellBeingSeconds():int
        {
            return (_SafeStr_5930);
        }

        public function set remainingWellBeingSeconds(_arg_1:int):void
        {
            _SafeStr_5930 = _arg_1;
        }

        public function get remainingGrowingSeconds():int
        {
            return (_SafeStr_5931);
        }

        public function set remainingGrowingSeconds(_arg_1:int):void
        {
            _SafeStr_5931 = _arg_1;
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function set hasBreedingPermission(_arg_1:Boolean):void
        {
            _hasBreedingPermission = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3824 = "_-p1O" (String#3982, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4374 = "_-j1L" (String#4896, DoABC#4)
// _SafeStr_4378 = "_-a1j" (String#3839, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5421 = "_-fl" (String#6414, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_5609 = "_-l1V" (String#3326, DoABC#4)
// _SafeStr_5690 = "_-e1I" (String#3456, DoABC#4)
// _SafeStr_5820 = "_-m1s" (String#3859, DoABC#4)
// _SafeStr_5821 = "_-j1t" (String#3817, DoABC#4)
// _SafeStr_5915 = "_-m1M" (String#21808, DoABC#4)
// _SafeStr_5916 = "_-Y1Q" (String#8975, DoABC#4)
// _SafeStr_5917 = "_-vK" (String#9375, DoABC#4)
// _SafeStr_5918 = "_-q1i" (String#2983, DoABC#4)
// _SafeStr_5919 = "_-e1Z" (String#6218, DoABC#4)
// _SafeStr_5920 = "_-vt" (String#9461, DoABC#4)
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


