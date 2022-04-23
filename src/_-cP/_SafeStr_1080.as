// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-cP._SafeStr_1080

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-jK._SafeStr_1653;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1080 implements IMessageParser 
    {

        private var _SafeStr_7178:Array;


        public function get songs():Array
        {
            return (_SafeStr_7178);
        }

        public function flush():Boolean
        {
            _SafeStr_7178 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_9:int;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_7:int;
            var _local_3:* = null;
            var _local_8:int;
            var _local_10:* = null;
            var _local_5:int = _arg_1.readInteger();
            _local_8 = 0;
            while (_local_8 < _local_5)
            {
                _local_9 = _arg_1.readInteger();
                _local_4 = _arg_1.readString();
                _local_6 = _arg_1.readString();
                _local_2 = _arg_1.readString();
                _local_7 = _arg_1.readInteger();
                _local_3 = _arg_1.readString();
                _local_10 = new _SafeStr_1653(_local_9, _local_7, _local_6, _local_3, _local_2);
                _SafeStr_7178.push(_local_10);
                _local_8++;
            };
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1080 = "_-v13" (String#10377, DoABC#3)
// _SafeStr_1653 = "_-Gq" (String#7649, DoABC#3)
// _SafeStr_7178 = "_-f1C" (String#9328, DoABC#3)


