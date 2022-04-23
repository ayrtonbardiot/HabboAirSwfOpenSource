// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_1561

package _-x1P
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1561 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _rooms:Array = [];

        public function _SafeStr_1561(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _rooms.push(new _SafeStr_1669(_arg_1));
                _local_3++;
            };
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get rooms():Array
        {
            return (_rooms);
        }


    }
}//package _-x1P

// _SafeStr_1561 = "_-Z1k" (String#8909, DoABC#3)
// _SafeStr_1669 = "_-hL" (String#9495, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


