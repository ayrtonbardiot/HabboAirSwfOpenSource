// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1198

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1198 implements IMessageParser 
    {

        private var _groupId:int;
        private var _SafeStr_7704:_SafeStr_1633;


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get thread():_SafeStr_1633
        {
            return (_SafeStr_7704);
        }

        public function flush():Boolean
        {
            _groupId = -1;
            _SafeStr_7704 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _groupId = _arg_1.readInteger();
            _SafeStr_7704 = _SafeStr_1633.readFromMessage(_arg_1);
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1198 = "_-AN" (String#7280, DoABC#3)
// _SafeStr_1633 = "_-XN" (String#8805, DoABC#3)
// _SafeStr_7704 = "_-wd" (String#10489, DoABC#3)


