// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_1571

package _-W1K
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1571 
    {

        private var _SafeStr_3693:int;
        private var _roomName:String;
        private var _SafeStr_7675:Boolean = false;

        public function _SafeStr_1571(_arg_1:int, _arg_2:String, _arg_3:Boolean)
        {
            _SafeStr_3693 = _arg_1;
            _roomName = _arg_2;
            _SafeStr_7675 = _arg_3;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get hasControllers():Boolean
        {
            return (_SafeStr_7675);
        }


    }
}//package _-W1K

// _SafeStr_1571 = "_-r1" (String#10109, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7675 = "_-Oq" (String#8217, DoABC#3)


