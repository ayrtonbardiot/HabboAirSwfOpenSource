// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1Q._SafeStr_1531

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1531 
    {

        private var _name:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_7095:int;
        private var _SafeStr_5367:int;

        public function _SafeStr_1531(_arg_1:IMessageDataWrapper)
        {
            _name = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
            _SafeStr_7095 = _arg_1.readInteger();
            _SafeStr_5367 = _arg_1.readInteger();
        }

        public function get name():String
        {
            return (_name);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get rank():int
        {
            return (_SafeStr_7095);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }


    }
}//package _-d1Q

// _SafeStr_1531 = "_-U1J" (String#8550, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_7095 = "_-md" (String#9836, DoABC#3)


