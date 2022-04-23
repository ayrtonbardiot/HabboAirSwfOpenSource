// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ol._SafeStr_1562

package _-Ol
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1562 
    {

        public static const _SafeStr_7466:String = "M";
        public static const _SafeStr_7467:String = "F";

        private var _SafeStr_5536:int = 0;
        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_4052:Number = 0;
        private var _SafeStr_4049:int = 0;
        private var _name:String = "";
        private var _SafeStr_5420:int = 0;
        private var _SafeStr_6381:String = "";
        private var _SafeStr_3819:String = "";
        private var _SafeStr_6422:String = "";
        private var _achievementScore:int;
        private var _SafeStr_5864:int = 0;
        private var _SafeStr_6423:String = "";
        private var _groupStatus:int = 0;
        private var _groupName:String = "";
        private var _SafeStr_6046:String = "";
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String;
        private var _SafeStr_5609:int;
        private var _SafeStr_6424:Boolean;
        private var _SafeStr_4378:Boolean;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _hasBreedingPermission:Boolean;
        private var _SafeStr_6425:int = 0;
        private var _SafeStr_7468:String = "";
        private var _botSkills:Array;
        private var _SafeStr_6427:Boolean;
        private var _SafeStr_7128:Boolean = false;

        public function _SafeStr_1562(_arg_1:int)
        {
            _SafeStr_5536 = _arg_1;
        }

        public function setReadOnly():void
        {
            _SafeStr_7128 = true;
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function set x(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4050 = _arg_1;
            };
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function set y(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4051 = _arg_1;
            };
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set z(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4052 = _arg_1;
            };
        }

        public function get dir():int
        {
            return (_SafeStr_4049);
        }

        public function set dir(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4049 = _arg_1;
            };
        }

        public function get name():String
        {
            return (_name);
        }

        public function set name(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _name = _arg_1;
            };
        }

        public function get userType():int
        {
            return (_SafeStr_5420);
        }

        public function set userType(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5420 = _arg_1;
            };
        }

        public function get sex():String
        {
            return (_SafeStr_6381);
        }

        public function set sex(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6381 = _arg_1;
            };
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function set figure(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3819 = _arg_1;
            };
        }

        public function get custom():String
        {
            return (_SafeStr_6422);
        }

        public function set custom(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6422 = _arg_1;
            };
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }

        public function set achievementScore(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _achievementScore = _arg_1;
            };
        }

        public function get webID():int
        {
            return (_SafeStr_5864);
        }

        public function set webID(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5864 = _arg_1;
            };
        }

        public function get groupID():String
        {
            return (_SafeStr_6423);
        }

        public function set groupID(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6423 = _arg_1;
            };
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function set groupName(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _groupName = _arg_1;
            };
        }

        public function get groupStatus():int
        {
            return (_groupStatus);
        }

        public function set groupStatus(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _groupStatus = _arg_1;
            };
        }

        public function get subType():String
        {
            return (_SafeStr_6046);
        }

        public function set subType(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6046 = _arg_1;
            };
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function set ownerId(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5226 = _arg_1;
            };
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function set ownerName(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _ownerName = _arg_1;
            };
        }

        public function get rarityLevel():int
        {
            return (_SafeStr_5609);
        }

        public function set rarityLevel(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5609 = _arg_1;
            };
        }

        public function get hasSaddle():Boolean
        {
            return (_SafeStr_6424);
        }

        public function set hasSaddle(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6424 = _arg_1;
            };
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }

        public function set isRiding(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4378 = _arg_1;
            };
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function set canBreed(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5690 = _arg_1;
            };
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function set canHarvest(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5820 = _arg_1;
            };
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function set canRevive(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5821 = _arg_1;
            };
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }

        public function set hasBreedingPermission(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _hasBreedingPermission = _arg_1;
            };
        }

        public function get petLevel():int
        {
            return (_SafeStr_6425);
        }

        public function set petLevel(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6425 = _arg_1;
            };
        }

        public function get petPosture():String
        {
            return (_SafeStr_7468);
        }

        public function set petPosture(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_7468 = _arg_1;
            };
        }

        public function get botSkills():Array
        {
            return (_botSkills);
        }

        public function set botSkills(_arg_1:Array):void
        {
            _botSkills = _arg_1;
        }

        public function get isModerator():Boolean
        {
            return (_SafeStr_6427);
        }

        public function set isModerator(_arg_1:Boolean):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_6427 = _arg_1;
            };
        }


    }
}//package _-Ol

// _SafeStr_1562 = "_-d1I" (String#9179, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4052 = "_-Rt" (String#8388, DoABC#3)
// _SafeStr_4378 = "_-a1j" (String#8985, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_5420 = "_-S13" (String#8394, DoABC#3)
// _SafeStr_5536 = "_-517" (String#6874, DoABC#3)
// _SafeStr_5609 = "_-l1V" (String#9749, DoABC#3)
// _SafeStr_5690 = "_-e1I" (String#9269, DoABC#3)
// _SafeStr_5820 = "_-m1s" (String#9816, DoABC#3)
// _SafeStr_5821 = "_-j1t" (String#9611, DoABC#3)
// _SafeStr_5864 = "_-123" (String#6562, DoABC#3)
// _SafeStr_6046 = "_-913" (String#7152, DoABC#3)
// _SafeStr_6381 = "_-51T" (String#6885, DoABC#3)
// _SafeStr_6422 = "_-h1i" (String#9478, DoABC#3)
// _SafeStr_6423 = "_-x1V" (String#10527, DoABC#3)
// _SafeStr_6424 = "_-s1Z" (String#10192, DoABC#3)
// _SafeStr_6425 = "_-L1B" (String#7934, DoABC#3)
// _SafeStr_6427 = "_-j0" (String#9580, DoABC#3)
// _SafeStr_7128 = "_-317" (String#6715, DoABC#3)
// _SafeStr_7466 = "_-y1v" (String#10601, DoABC#3)
// _SafeStr_7467 = "_-N1X" (String#8070, DoABC#3)
// _SafeStr_7468 = "_-s1y" (String#10206, DoABC#3)


