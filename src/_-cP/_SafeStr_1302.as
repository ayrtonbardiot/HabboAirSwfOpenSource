// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-cP._SafeStr_1302

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-jK._SafeStr_1543;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1302 implements IMessageParser 
    {

        private var _SafeStr_7184:int;
        private var _SafeStr_7185:Array;


        public function get synchronizationCount():int
        {
            return (_SafeStr_7184);
        }

        public function get playList():Array
        {
            return (_SafeStr_7185);
        }

        public function flush():Boolean
        {
            _SafeStr_7184 = -1;
            _SafeStr_7185 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_6:int;
            var _local_7:int;
            var _local_4:int;
            var _local_5:* = null;
            var _local_2:* = null;
            _SafeStr_7184 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_6 = 0;
            while (_local_6 < _local_3)
            {
                _local_7 = _arg_1.readInteger();
                _local_4 = _arg_1.readInteger();
                _local_5 = _arg_1.readString();
                _local_2 = _arg_1.readString();
                _SafeStr_7185.push(new _SafeStr_1543(_local_7, _local_4, _local_5, _local_2));
                _local_6++;
            };
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1302 = "_-S1c" (String#8413, DoABC#3)
// _SafeStr_1543 = "_-L1G" (String#7939, DoABC#3)
// _SafeStr_7184 = "_-31l" (String#6730, DoABC#3)
// _SafeStr_7185 = "_-Bi" (String#7344, DoABC#3)


