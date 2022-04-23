// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-28._SafeStr_1276

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1276 implements IMessageParser 
    {

        private var _SafeStr_5642:Array;


        public function flush():Boolean
        {
            _SafeStr_5642 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5642.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }

        public function get messages():Array
        {
            return (_SafeStr_5642);
        }


    }
}//package _-28

// _SafeStr_1276 = "_-W2" (String#8727, DoABC#3)
// _SafeStr_5642 = "_-oE" (String#9948, DoABC#3)


