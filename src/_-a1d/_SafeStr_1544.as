// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a1d._SafeStr_1544

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1544 
    {

        private var _SafeStr_4838:String;
        private var _SafeStr_7137:String;

        public function _SafeStr_1544(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4838 = _arg_1.readString();
            _SafeStr_7137 = _arg_1.readString();
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get furnitureClassName():String
        {
            return (_SafeStr_7137);
        }


    }
}//package _-a1d

// _SafeStr_1544 = "_-F19" (String#7531, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_7137 = "_-322" (String#6736, DoABC#3)


