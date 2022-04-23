// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-28._SafeStr_1250

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1250 implements IMessageParser 
    {

        private var _SafeStr_5591:Dictionary;


        public function flush():Boolean
        {
            _SafeStr_5591 = new Dictionary();
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:int;
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                _SafeStr_5591[_local_5] = _local_2;
                _local_4++;
            };
            return (true);
        }

        public function get points():Dictionary
        {
            return (_SafeStr_5591);
        }


    }
}//package _-28

// _SafeStr_1250 = "_-4d" (String#6858, DoABC#3)
// _SafeStr_5591 = "_-r1R" (String#10126, DoABC#3)


