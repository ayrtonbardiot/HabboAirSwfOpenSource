// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1257

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1257 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_4145:Array;


        public function flush():Boolean
        {
            _SafeStr_4128 = -1;
            _SafeStr_4145 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_2:int;
            var _local_3:* = null;
            _SafeStr_4128 = _arg_1.readInteger();
            var _local_4:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_2 = _arg_1.readInteger();
                _local_3 = _arg_1.readString();
                _SafeStr_4145.push(_local_3);
                _local_5++;
            };
            return (true);
        }

        public function get badges():Array
        {
            return (_SafeStr_4145);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }


    }
}//package _-NF

// _SafeStr_1257 = "_-hq" (String#9507, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4145 = "_-ZY" (String#8943, DoABC#3)


