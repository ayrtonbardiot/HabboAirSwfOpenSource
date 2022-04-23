// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1Q._SafeStr_1172

package _-l1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1172 implements IMessageParser 
    {

        private var _SafeStr_5371:Array;


        public function get badWords():Array
        {
            return (_SafeStr_5371);
        }

        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_5371 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5371.push(_arg_1.readString());
                _local_3++;
            };
            return (false);
        }


    }
}//package _-l1Q

// _SafeStr_1172 = "_-Y1I" (String#8835, DoABC#3)
// _SafeStr_5371 = "_-Y0" (String#8824, DoABC#3)


