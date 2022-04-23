// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_1624

package _-81g
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1624 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4028:int = 0;
        private var _color:uint = 0;
        private var _SafeStr_5116:uint = 0;
        private var _SafeStr_7128:Boolean = false;

        public function _SafeStr_1624(_arg_1:int)
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

        public function get color():uint
        {
            return (_color);
        }

        public function set color(_arg_1:uint):void
        {
            if (!_SafeStr_7128)
            {
                _color = _arg_1;
            };
        }

        public function get light():int
        {
            return (_SafeStr_5116);
        }

        public function set light(_arg_1:int):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_5116 = _arg_1;
            };
        }


    }
}//package _-81g

// _SafeStr_1624 = "_-61j" (String#6969, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_5116 = "_-k6" (String#9693, DoABC#3)
// _SafeStr_7128 = "_-317" (String#6715, DoABC#3)


