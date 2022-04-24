// by nota

//_-Ol._SafeStr_1655

package _-Ol
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data._SafeStr_1613;

    [SecureSWF(rename="true")]
    public class _SafeStr_1655 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_4052:Number = 0;
        private var _SafeStr_4049:int = 0;
        private var _SafeStr_3988:int = 0;
        private var _SafeStr_3989:int = 0;
        private var _SafeStr_3990:Number = 0;
        private var _SafeStr_4028:int = 0;
        private var _SafeStr_4268:int = -1;
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3740:IStuffData = new _SafeStr_1613();
        private var _expiryTime:int = 0;
        private var _SafeStr_5225:int;
        private var _SafeStr_5226:int = 0;
        private var _ownerName:String = "";
        private var _SafeStr_7477:String = null;
        private var _SafeStr_7128:Boolean = false;

        public function _SafeStr_1655(_arg_1:int)
        {
            _SafeStr_3820 = _arg_1;
        }

        public function setReadOnly():void
        {
            _SafeStr_7128 = true;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
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

        public function get sizeX():int
        {
            return (_SafeStr_3988);
        }

        public function set sizeX(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3988 = _arg_1;
            };
        }

        public function get sizeY():int
        {
            return (_SafeStr_3989);
        }

        public function set sizeY(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3989 = _arg_1;
            };
        }

        public function get sizeZ():Number
        {
            return (_SafeStr_3990);
        }

        public function set sizeZ(_arg_1:Number):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3990 = _arg_1;
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

        public function get data():IStuffData
        {
            return (_SafeStr_3740);
        }

        public function set data(_arg_1:IStuffData):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3740 = _arg_1;
            };
        }

        public function get staticClass():String
        {
            return (_SafeStr_7477);
        }

        public function set staticClass(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_7477 = _arg_1;
            };
        }

        public function get extra():int
        {
            return (_SafeStr_4268);
        }

        public function set extra(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4268 = _arg_1;
            };
        }

        public function get expiryTime():int
        {
            return (_expiryTime);
        }

        public function set expiryTime(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _expiryTime = _arg_1;
            };
        }

        public function get usagePolicy():int
        {
            return (_SafeStr_5225);
        }

        public function set usagePolicy(_arg_1:int):void
        {
            _SafeStr_5225 = _arg_1;
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


    }
}//package _-Ol

// _SafeStr_1613 = "_-xG" (String#10553, DoABC#3)
// _SafeStr_1655 = "_-f7" (String#9356, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3988 = "_-u6" (String#10332, DoABC#3)
// _SafeStr_3989 = "_-am" (String#9026, DoABC#3)
// _SafeStr_3990 = "_-q1l" (String#10060, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4049 = "_-W12" (String#8660, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4052 = "_-Rt" (String#8388, DoABC#3)
// _SafeStr_4268 = "_-8L" (String#7124, DoABC#3)
// _SafeStr_5225 = "_-2X" (String#6695, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_7128 = "_-317" (String#6715, DoABC#3)
// _SafeStr_7477 = "_-o1u" (String#9940, DoABC#3)


