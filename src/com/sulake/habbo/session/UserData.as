// by nota

//com.sulake.habbo.session.UserData

package com.sulake.habbo.session
{
    public class UserData implements _SafeStr_3241 
    {

        private var _SafeStr_6421:int = -1;
        private var _name:String = "";
        private var _SafeStr_4028:int = 0;
        private var _SafeStr_6381:String = "";
        private var _SafeStr_3819:String = "";
        private var _SafeStr_6422:String = "";
        private var _achievementScore:int;
        private var _SafeStr_5864:int = 0;
        private var _SafeStr_6423:String = "";
        private var _groupStatus:int = 0;
        private var _groupName:String = "";
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _SafeStr_6425:int = 0;
        private var _SafeStr_5609:int = 0;
        private var _SafeStr_6424:Boolean;
        private var _SafeStr_4378:Boolean;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _hasBreedingPermission:Boolean;
        private var _botSkills:Array;
        private var _SafeStr_6426:Array;
        private var _SafeStr_6427:Boolean;

        public function UserData(_arg_1:int)
        {
            _SafeStr_6421 = _arg_1;
        }

        public function get roomObjectId():int
        {
            return (_SafeStr_6421);
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }

        public function set achievementScore(_arg_1:int):void
        {
            _achievementScore = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function set type(_arg_1:int):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function get sex():String
        {
            return (_SafeStr_6381);
        }

        public function set sex(_arg_1:String):void
        {
            _SafeStr_6381 = _arg_1;
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function set figure(_arg_1:String):void
        {
            _SafeStr_3819 = _arg_1;
        }

        public function get custom():String
        {
            return (_SafeStr_6422);
        }

        public function set custom(_arg_1:String):void
        {
            _SafeStr_6422 = _arg_1;
        }

        public function get webID():int
        {
            return (_SafeStr_5864);
        }

        public function set webID(_arg_1:int):void
        {
            _SafeStr_5864 = _arg_1;
        }

        public function get groupID():String
        {
            return (_SafeStr_6423);
        }

        public function set groupID(_arg_1:String):void
        {
            _SafeStr_6423 = _arg_1;
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function set groupName(_arg_1:String):void
        {
            _groupName = _arg_1;
        }

        public function get groupStatus():int
        {
            return (_groupStatus);
        }

        public function set groupStatus(_arg_1:int):void
        {
            _groupStatus = _arg_1;
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function set ownerId(_arg_1:int):void
        {
            _SafeStr_5226 = _arg_1;
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function set ownerName(_arg_1:String):void
        {
            _ownerName = _arg_1;
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
        }

        public function set rarityLevel(_arg_1:int):void
        {
            _SafeStr_5609 = _arg_1;
        }

        public function get hasSaddle():Boolean
        {
            return (_SafeStr_6424);
        }

        public function set hasSaddle(_arg_1:Boolean):void
        {
            _SafeStr_6424 = _arg_1;
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }

        public function set isRiding(_arg_1:Boolean):void
        {
            _SafeStr_4378 = _arg_1;
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function set canBreed(_arg_1:Boolean):void
        {
            _SafeStr_5690 = _arg_1;
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function set canHarvest(_arg_1:Boolean):void
        {
            _SafeStr_5820 = _arg_1;
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function set canRevive(_arg_1:Boolean):void
        {
            _SafeStr_5821 = _arg_1;
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function set hasBreedingPermission(_arg_1:Boolean):void
        {
            _hasBreedingPermission = _arg_1;
        }

        public function get petLevel():int
        {
            return (_SafeStr_6425);
        }

        public function set petLevel(_arg_1:int):void
        {
            _SafeStr_6425 = _arg_1;
        }

        public function get botSkills():Array
        {
            return (_botSkills);
        }

        public function set botSkills(_arg_1:Array):void
        {
            _botSkills = _arg_1;
        }

        public function get botSkillData():Array
        {
            return (_SafeStr_6426);
        }

        public function set botSkillData(_arg_1:Array):void
        {
            _SafeStr_6426 = _arg_1;
        }

        public function get isModerator():Boolean
        {
            return (_SafeStr_6427);
        }

        public function set isModerator(_arg_1:Boolean):void
        {
            _SafeStr_6427 = _arg_1;
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4378 = "_-a1j" (String#3839, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5609 = "_-l1V" (String#3326, DoABC#4)
// _SafeStr_5690 = "_-e1I" (String#3456, DoABC#4)
// _SafeStr_5820 = "_-m1s" (String#3859, DoABC#4)
// _SafeStr_5821 = "_-j1t" (String#3817, DoABC#4)
// _SafeStr_5864 = "_-123" (String#6265, DoABC#4)
// _SafeStr_6381 = "_-51T" (String#7526, DoABC#4)
// _SafeStr_6421 = "_-BA" (String#9199, DoABC#4)
// _SafeStr_6422 = "_-h1i" (String#17588, DoABC#4)
// _SafeStr_6423 = "_-x1V" (String#20571, DoABC#4)
// _SafeStr_6424 = "_-s1Z" (String#18420, DoABC#4)
// _SafeStr_6425 = "_-L1B" (String#22818, DoABC#4)
// _SafeStr_6426 = "_-5C" (String#22208, DoABC#4)
// _SafeStr_6427 = "_-j0" (String#18092, DoABC#4)


