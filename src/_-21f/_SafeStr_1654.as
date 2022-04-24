// by nota

//_-21f._SafeStr_1654

package _-21f
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1654 
    {

        private var _SafeStr_5104:String;
        private var _SafeStr_7015:Vector.<_SafeStr_1598> = new Vector.<_SafeStr_1598>(0);

        public function _SafeStr_1654(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_5104 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                quickLinks.push(new _SafeStr_1598(_arg_1));
                _local_3++;
            };
        }

        public function get searchCode():String
        {
            return (_SafeStr_5104);
        }

        public function get quickLinks():Vector.<_SafeStr_1598>
        {
            return (_SafeStr_7015);
        }


    }
}//package _-21f

// _SafeStr_1598 = "_-UP" (String#8579, DoABC#3)
// _SafeStr_1654 = "_-91u" (String#7177, DoABC#3)
// _SafeStr_5104 = "_-T14" (String#8472, DoABC#3)
// _SafeStr_7015 = "_-4T" (String#6853, DoABC#3)


