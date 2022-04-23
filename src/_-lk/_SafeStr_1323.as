// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-lk._SafeStr_1323

package _-lk
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-w19._SafeStr_1582;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1323 implements IMessageParser 
    {

        private var _SafeStr_5396:Array;


        public function flush():Boolean
        {
            _SafeStr_5396 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            _SafeStr_5396 = [];
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = new _SafeStr_1582();
                _local_2.type = _arg_1.readInteger();
                _local_2.subType = _arg_1.readInteger();
                _local_2.duration = _arg_1.readInteger();
                _local_2.inactiveEffectsInInventory = _arg_1.readInteger();
                _local_2.secondsLeftIfActive = _arg_1.readInteger();
                _local_2.isPermanent = _arg_1.readBoolean();
                _SafeStr_5396.push(_local_2);
                _local_4++;
            };
            return (true);
        }

        public function get effects():Array
        {
            return (_SafeStr_5396);
        }


    }
}//package _-lk

// _SafeStr_1323 = "_-21L" (String#6629, DoABC#3)
// _SafeStr_1582 = "_-K1L" (String#7870, DoABC#3)
// _SafeStr_5396 = "_-gj" (String#9434, DoABC#3)


