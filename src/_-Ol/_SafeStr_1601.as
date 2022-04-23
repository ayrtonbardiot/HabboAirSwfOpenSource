// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ol._SafeStr_1601

package _-Ol
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1601 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_7472:Boolean = false;
        private var _SafeStr_7473:int = 0;
        private var _SafeStr_7474:int = 0;
        private var _SafeStr_4528:int = 0;
        private var _SafeStr_4529:int = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_4052:Number = 0;
        private var _SafeStr_4049:String = "";
        private var _SafeStr_4028:int = 0;
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3740:String = "";
        private var _SafeStr_7128:Boolean = false;
        private var _SafeStr_5225:int = 0;
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _secondsToExpiration:int;

        public function _SafeStr_1601(_arg_1:int, _arg_2:int, _arg_3:Boolean)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4028 = _arg_2;
            _SafeStr_7472 = _arg_3;
        }

        public function setReadOnly():void
        {
            _SafeStr_7128 = true;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get isOldFormat():Boolean
        {
            return (_SafeStr_7472);
        }

        public function get wallX():Number
        {
            return (_SafeStr_7473);
        }

        public function set wallX(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_7473 = _arg_1;
            };
        }

        public function get wallY():Number
        {
            return (_SafeStr_7474);
        }

        public function set wallY(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_7474 = _arg_1;
            };
        }

        public function get localX():Number
        {
            return (_SafeStr_4528);
        }

        public function set localX(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4528 = _arg_1;
            };
        }

        public function get localY():Number
        {
            return (_SafeStr_4529);
        }

        public function set localY(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4529 = _arg_1;
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

        public function get dir():String
        {
            return (_SafeStr_4049);
        }

        public function set dir(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4049 = _arg_1;
            };
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function set type(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4028 = _arg_1;
            };
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function set state(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3734 = _arg_1;
            };
        }

        public function get data():String
        {
            return (_SafeStr_3740);
        }

        public function set data(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3740 = _arg_1;
            };
        }

        public function get usagePolicy():int
        {
            return (_SafeStr_5225);
        }

        public function set usagePolicy(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5225 = _arg_1;
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

        public function get secondsToExpiration():int
        {
            return (_secondsToExpiration);
        }

        public function set secondsToExpiration(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _secondsToExpiration = _arg_1;
            };
        }


    }
}//package _-Ol

// _SafeStr_1601 = "_-j5" (String#9615, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4052 = "_-Rt" (String#8388, DoABC#3)
// _SafeStr_4528 = "_-Cd" (String#7399, DoABC#3)
// _SafeStr_4529 = "_-gd" (String#9431, DoABC#3)
// _SafeStr_5225 = "_-2X" (String#6695, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_7128 = "_-317" (String#6715, DoABC#3)
// _SafeStr_7472 = "_-X19" (String#8767, DoABC#3)
// _SafeStr_7473 = "_-r1c" (String#10134, DoABC#3)
// _SafeStr_7474 = "_-w" (String#10435, DoABC#3)


