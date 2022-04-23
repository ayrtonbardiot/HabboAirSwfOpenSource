// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-cP._SafeStr_1309

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-jK._SafeStr_1543;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1309 implements IMessageParser 
    {

        private var _SafeStr_7186:_SafeStr_1543;


        public function get entry():_SafeStr_1543
        {
            return (_SafeStr_7186);
        }

        public function flush():Boolean
        {
            _SafeStr_7186 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int = _arg_1.readInteger();
            var _local_4:int = _arg_1.readInteger();
            var _local_2:String = _arg_1.readString();
            var _local_3:String = _arg_1.readString();
            _SafeStr_7186 = new _SafeStr_1543(_local_5, _local_4, _local_2, _local_3);
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1309 = "_-k1b" (String#9678, DoABC#3)
// _SafeStr_1543 = "_-L1G" (String#7939, DoABC#3)
// _SafeStr_7186 = "_-mk" (String#9840, DoABC#3)


