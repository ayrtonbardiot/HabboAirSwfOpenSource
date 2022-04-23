// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1513

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1513 implements IMessageParser 
    {

        private var _SafeStr_7596:_SafeStr_1616;


        public function get issueData():_SafeStr_1616
        {
            return (_SafeStr_7596);
        }

        public function flush():Boolean
        {
            if (_SafeStr_7596)
            {
            };
            _SafeStr_7596 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_7:int;
            var _local_3:int = _arg_1.readInteger();
            var _local_16:int = _arg_1.readInteger();
            var _local_19:int = _arg_1.readInteger();
            var _local_17:int = _arg_1.readInteger();
            var _local_4:Number = _arg_1.readInteger();
            var _local_8:int = _arg_1.readInteger();
            var _local_5:int = _arg_1.readInteger();
            var _local_18:int = _arg_1.readInteger();
            var _local_14:String = _arg_1.readString();
            var _local_15:int = _arg_1.readInteger();
            var _local_11:String = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            var _local_13:String = _arg_1.readString();
            var _local_9:String = _arg_1.readString();
            var _local_10:int = _arg_1.readInteger();
            var _local_12:int = _arg_1.readInteger();
            var _local_6:Array = [];
            _local_7 = 0;
            while (_local_7 < _local_12)
            {
                _local_6.push(new _SafeStr_1576(_arg_1));
                _local_7++;
            };
            _SafeStr_7596 = new _SafeStr_1616(_local_3, _local_16, _local_19, _local_17, _local_4, _local_8, _local_5, _local_18, _local_14, _local_15, _local_11, _local_2, _local_13, _local_9, _local_10, _local_6);
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1513 = "_-GN" (String#7629, DoABC#3)
// _SafeStr_1576 = "_-h15" (String#9456, DoABC#3)
// _SafeStr_1616 = "_-Jg" (String#7849, DoABC#3)
// _SafeStr_7596 = "_-91R" (String#7166, DoABC#3)


