// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IV._SafeStr_1425

package _-IV
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-p1o._SafeStr_1618;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1425 implements IMessageParser 
    {

        private var _SafeStr_4403:Array;
        private var _SafeStr_7269:String;


        public function flush():Boolean
        {
            _SafeStr_4403 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4403 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4403.push(new _SafeStr_1618(_arg_1));
                _local_3++;
            };
            _SafeStr_7269 = _arg_1.readString();
            return (true);
        }

        public function get achievements():Array
        {
            return (_SafeStr_4403);
        }

        public function get defaultCategory():String
        {
            return (_SafeStr_7269);
        }


    }
}//package _-IV

// _SafeStr_1425 = "_-G1h" (String#7604, DoABC#3)
// _SafeStr_1618 = "_-N2" (String#8084, DoABC#3)
// _SafeStr_4403 = "_-RC" (String#8367, DoABC#3)
// _SafeStr_7269 = "_-f1B" (String#9327, DoABC#3)


