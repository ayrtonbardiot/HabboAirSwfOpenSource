// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b7._SafeStr_1422

package _-b7
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-B1i._SafeStr_1530;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1422 implements IMessageParser 
    {

        private var _SafeStr_5647:Array;


        public function flush():Boolean
        {
            _SafeStr_5647 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5647.push(new _SafeStr_1530(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get hotLooks():Array
        {
            return (_SafeStr_5647);
        }


    }
}//package _-b7

// _SafeStr_1422 = "_-21P" (String#6631, DoABC#3)
// _SafeStr_1530 = "_-A1U" (String#7224, DoABC#3)
// _SafeStr_5647 = "_-u9" (String#10339, DoABC#3)


