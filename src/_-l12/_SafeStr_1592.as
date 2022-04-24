// by nota

//_-l12._SafeStr_1592

package _-l12
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1592 extends _SafeStr_1554 
    {

        private var _SafeStr_7374:int;
        private var _SafeStr_7373:Array = [];

        public function _SafeStr_1592(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super(_arg_1);
            _SafeStr_7374 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7373.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function get triggerConf():int
        {
            return (_SafeStr_7374);
        }

        override public function get code():int
        {
            return (_SafeStr_7374);
        }

        public function get conflictingActions():Array
        {
            return (_SafeStr_7373);
        }


    }
}//package _-l12

// _SafeStr_1554 = "_-W1B" (String#8667, DoABC#3)
// _SafeStr_1592 = "_-22A" (String#6661, DoABC#3)
// _SafeStr_7373 = "_-11E" (String#6538, DoABC#3)
// _SafeStr_7374 = "_-X1A" (String#8768, DoABC#3)


